--
local M = {}
local logger = require('xe.logger')
local info = logger.getLogger('', 'info')
local err = require('xe.logger').getLogger('New Project', 'error')

local curProjFile
local curProjDir
local auto_save_counter = 1

--
--local function getDirFromPath(path)
--    return string.filefolder(path)
--end
---Returns the name part of the filename (without extension).
--local function getNameFromPath(path)
--    return string.filename(path, false)
--end
local function get_tree()
    return require('xe.main').getTree()
end

function M.getFile()
    return curProjFile
end

function M.getDir()
    if curProjFile then
        if not curProjDir then
            curProjDir = string.filefolder(curProjFile)
        end
        return curProjDir
    end
end

function M.saveEditorSetting()
    require('xe.win.Setting').save()
end

function M._setCurFile(s)
    curProjFile = s
    if s == nil then
        SetTitle("LuaSTG-x Editor")
        curProjDir = nil
        logger.clear()
        require('xe.main').getToolPanel():disableAll()
        local toolbar = require('xe.main').getToolBar()
        toolbar:disableAll()
        toolbar:enable('new')
        toolbar:enable('open')
    else
        SetTitle(string.filename(curProjFile) .. " - LuaSTG-x Editor")
        M.saveEditorSetting()
        require('xe.main').getToolPanel():enableAll()
        local toolbar = require('xe.main').getToolBar()
        toolbar:enableAll()
        toolbar:disable('debugSC')
        toolbar:disable('debugStage')
        toolbar:disable('insertChild')
        get_tree():setInsertPos('child')

        info("current project file: %s", curProjFile)
        info("current project folder: %s", M.getDir())
    end
end

function M._loadFromFile(path)
    if not path or path == '' then
        return
    end
    local f = io.open_u8(path, 'rb+')
    if not f then
        err("failed to open file %s", path)
        return
    end
    local str = f:read('*a')
    f:close()

    if not str or str == '' then
        err("invalid project file %s", path)
        return
    end

    M._setCurFile(path)

    local tree = get_tree()
    tree:reset()
    tree:deserialize(str)
    tree:getRoot():select()
    return true
end

function M._saveToFile(path)
    if not curProjFile then
        return
    end
    local f = io.open_u8(path, 'wb+')
    if not f then
        err("failed to open file %s", path)
        return
    end
    local tree = get_tree()
    local str = tree:serialize()
    if str == '' then
        err("failed to save file %s", path)
        return
    end
    f:write(str)
    f:close()
    return true
end

function M.save()
    print('proj save')
    --
    return M._saveToFile(curProjFile)
end

function M._autoSaveDir()
    return M.getDir() .. '/' .. '.editor'
end

function M._autoSavePath()
    --return ('%s/%s.lstgxproj'):format(M._autoSaveDir(), os.date('%Y_%m_%d_%H_%M_%S'))
    return ('%s/autosave.lstgxproj'):format(M._autoSaveDir())
end

function M.autoSave()
    print('proj autoSave')
    --TODO
end

function M.needSave()
    if not curProjFile then
        return
    end
    local tree = get_tree()
    return tree:isDirty()
end

function M._close(onFinish)
    M._setCurFile(nil)
    local tree = get_tree()
    tree:reset()
    logger.clear()
    -- remove search path
    local fu = cc.FileUtils:getInstance()
    local paths = fu:getSearchPaths()
    local dir = M.getDir()
    for i = 1, #paths do
        if paths[i] == dir then
            table.remove(paths, i)
            break
        end
    end
    fu:setSearchPaths(paths)
    if onFinish then
        onFinish()
    end
end

function M._confirmSave(onFinish)
    local win = require('xe.win.Message')('Save', 'Save project?')
    win:addHandler('Yes', function()
        if M.save() then
            if onFinish then
                onFinish()
            end
        end
    end)
    win:addHandler('No', function()
        if onFinish then
            onFinish()
        end
    end)
    win:addHandler('Cancel')
    imgui.get():addChild(win)
end

function M.close(onFinish)
    if not curProjFile then
        return
    end
    --
    if M.needSave() then
        M._confirmSave(function()
            M._close(onFinish)
        end)
    else
        M._close(onFinish)
    end
end

function M._open(onFinish)
    local path = require('platform.FileDialog').open('lstgxproj,luastg')
    if not path then
        return
    end
    if not M._loadFromFile(path) then
        return
    end
    cc.FileUtils:getInstance():addSearchPath(M.getDir())
    if onFinish then
        onFinish()
    end
    return true
end

function M.open(onFinish)
    if M.needSave() then
        M._confirmSave(function()
            M._open(onFinish)
        end)
    else
        M._open(onFinish)
    end
end

function M._new()
    require('xe.main').getInstance()._newproj:setVisible(true)
end

function M.new()
    if M.needSave() then
        M._confirmSave(function()
            M._new()
        end)
    else
        M._new()
    end
end

local _no_pack = {
    luastg = true, lstgxproj = true, lstgxsln = true, zip = true
}

function M.pack()
    if not curProjFile then
        return
    end
    local fu = cc.FileUtils:getInstance()

    local tree = require('xe.main').getAssetsTree()
    local root_path = tree:getRoot()._attr.path
    print(root_path)
    local entries = {}
    for i, v in ipairs(tree._arr) do
        if v.mode == 'file' then
            local entry, num = v.path:gsub(root_path, '')
            if num == 0 then
                logger.log(('invalid file path: %q'):format(v.path), 'error')
                return false
            end
            if not _no_pack[string.fileext(entry):lower()] then
                table.insert(entries, { entry, v.path })
            end
        end
    end

    local zip_path
    if setting.xe.pack_to_engine_path then
        zip_path = fu:fullPathForFilename('mod/')
    else
        zip_path = M.getDir() .. '/'
    end
    local name = string.filename(curProjFile)
    zip_path = zip_path .. name .. '.zip'

    if fu:isFileExist(zip_path) then
        local ok, msg = os.remove(zip_path)
        if not ok then
            logger.log(('failed to delete file: %q'):format(msg), 'error')
            return false
        end
    end

    local zip = lstg.ZipArchive:create(zip_path)
    if not zip then
        logger.log(('failed to create zip file %q'):format(zip_path), 'error')
        return false
    end
    if not zip:open(lstg.ZipArchive.OpenMode.NEW) then
        zip:unlink()
        logger.log(('failed to open zip file %q'):format(zip_path), 'error')
        return false
    end
    for i, v in ipairs(entries) do
        if not zip:addFile(v[1], v[2]) then
            zip:unlink()
            logger.log(('failed add entry %q to zip file'):format(v[1]), 'error')
            return false
        end
    end
    zip:close()
    return true
end

function M.compileToString(...)
    if not curProjFile then
        return
    end
    local sw = lstg.StopWatch()
    local str = get_tree():compile(...)
    if not str then
        err('failed to compile project')
        return
    end
    print(('project compiled in %.2f ms'):format(sw:get() * 1000))
    return str
end

function M.compileToFile(path, ...)
    local str = M.compileToString(...)
    if not str then
        return
    end
    local f, msg = io.open_u8(path, 'wb+')
    if not f then
        err(msg)
    end
    f:write(str)
    f:close()
    return true
end

function M.onQuit()
    M.close(function()
        GameExit()
    end)
end

function M.launchGame(...)
    --TODO
    require('xe.game').start(...)
end

function M.addPackRes(path, from_type)
    print('proj addPackRes', path, from_type)
    --TODO
end

return M
