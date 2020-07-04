local M = {
    --{
    --    label   = 'File',
    --    name    = "PanelFile",
    --    content = {
    --        { name   = "ToolNew",
    --          bitmap = 'toolbar/new.png',
    --        },
    --        { name   = "ToolOpen",
    --          bitmap = 'toolbar/open.png',
    --        },
    --        { name   = "ToolSave",
    --          bitmap = 'toolbar/save.png',
    --        },
    --        { name   = "ToolClose",
    --          bitmap = 'toolbar/delete.png',
    --        },
    --        { name   = "ToolMerge",
    --          bitmap = 'toolbar/merge.png',
    --        },
    --    },
    --},
    {
        label   = 'General',
        name    = "PanelGeneral",
        content = {
            { name   = "Insert_folder",
              bitmap = 'folder.png',
            },
            { name   = "Insert_codeblock",
              bitmap = 'codeblock.png',
            },
            { name   = "Insert_if",
              bitmap = 'if.png',
            },
            { name   = "Insert_variable",
              bitmap = 'variable.png',
            },
            { name   = "Insert_repeat",
              bitmap = 'repeat.png',
            },
            { name   = "Insert_code",
              bitmap = 'code.png',
            },
            { name   = "Insert_comment",
              bitmap = 'comment.png',
            },
            { name   = "Insert_patch",
              bitmap = 'patch.png',
            },
        },
    },
    {
        label   = 'Stage',
        name    = "PanelStage",
        content = {
            { name   = "Insert_stagegroup",
              bitmap = 'stagegroup.png',
            },
            { name   = "Insert_stage",
              bitmap = 'stage.png',
            },
            { name   = "Insert_stagegoto",
              bitmap = 'stagegoto.png',
            },
            { name   = "Insert_stagefinish",
              bitmap = 'stagefinish.png',
            },
            { name   = "Insert_stagefinishgroup",
              bitmap = 'stagefinishgroup.png',
            },
            { name   = "Insert_bgstage",
              bitmap = 'bgstage.png',
            },
        },
    },
    {
        label   = 'Task',
        name    = "PanelTask",
        content = {
            { name   = "Insert_task",
              bitmap = 'task.png',
            },
            { name   = "Insert_tasker",
              bitmap = 'tasker.png',
            },
            { name   = "Insert_taskwait",
              bitmap = 'taskwait.png',
            },
            --[[
            { name   = "Insert_taskrepeat",
              bitmap = 'taskrepeat.png',
            },
            { name   = "Insert_taskbreak",
              bitmap = 'taskbreak.png',
            },
            --]]
            { name   = "Insert_taskmoveto",
              bitmap = 'taskmoveto.png',
            },
            { name   = "Insert_taskBeziermoveto",
              bitmap = 'taskBeziermoveto.png',
            },
            { name   = "Insert_taskreturn",
              bitmap = 'taskreturn.png',
            },
            { name   = "Insert_taskclear",
              bitmap = 'taskclear.png',
            },
        },
    },
    {
        label   = 'Enemy',
        name    = "PanelEnemy",
        content = {
            { name   = "Insert_enemydefine",
              bitmap = 'enemydefine.png',
            },
            { name   = "Insert_enemycreate",
              bitmap = 'enemycreate.png',
            },
            { name   = "Insert_enemysimple",
              bitmap = 'enemysimple.png',
            },
        },
    },
    {
        label   = 'Boss',
        name    = "PanelBoss",
        content = {
            { name   = "Insert_bossdefine",
              bitmap = 'bossdefine.png',
            },
            { name   = "Insert_bossspellcard",
              bitmap = 'bossspellcard.png',
            },
            { name   = "Insert_bossmoveto",
              bitmap = 'bossmoveto.png',
            },
            { name   = "Insert_dialog",
              bitmap = 'dialog.png',
            },
            { name   = "Insert_sentence",
              bitmap = 'sentence.png',
            },
            { name   = "Insert_taskbosswander",
              bitmap = 'taskbosswander.png',
            },
            { name   = "Insert_bosscast",
              bitmap = 'bosscast.png',
            },
            { name   = "Insert_bossshowaura",
              bitmap = 'bossshowaura.png',
            },
            { name   = "Insert_pactrometer",
              bitmap = 'pactrometer.png',
            },
            { name   = "Insert_explode",
              bitmap = 'explode.png',
            },
            { name   = "Insert_bosscreate",
              bitmap = 'bosscreate.png',
            },
            { name   = "Insert_bgdefine",
              bitmap = 'bgdefine.png',
            },
            { name   = "Insert_bglayer",
              bitmap = 'bglayer.png',
            },
        },
    },
    {
        label   = 'Bullet',
        name    = "PanelBullet",
        content = {
            { name   = "Insert_bulletdefine",
              bitmap = 'bulletdefine.png',
            },
            { name   = "Insert_bulletcreate",
              bitmap = 'bulletcreate.png',
            },
            { name   = "Insert_bulletchangestyle",
              bitmap = 'bulletchangestyle.png',
            },
            { name   = "Insert_bulletcreatestraight",
              bitmap = 'bulletcreatestraight.png',
            },
            { name   = "Insert_bulletcreatestraightex",
              bitmap = 'bulletcreatestraightex.png',
            },
            { name   = "Insert_bulletclear",
              bitmap = 'bulletclear.png',
            },
            { name   = "Insert_bulletcleanrange",
              bitmap = 'bulletcleanrange.png',
            },
        },
    },
    --[[
    {
        label   = 'Tools',
        name    = "PanelTools",
        content = {
            { name   = "Insert_rebounderdefine",
              bitmap = 'rebounderdefine.png',
            },
            { name   = "Insert_reboundercreate",
              bitmap = 'reboundercreate.png',
            },
            { name   = "Insert_simplerebounder",
              bitmap = 'simplerebounder.png',
            },
        },
    },
    --]]
    --[[
    {
        label   = 'BulletEx',
        name    = "PanelBulletEx",
        content = {
            { name   = "Insert_iteration",
              bitmap = 'iteration.png',
            },
            { name   = "Insert_shooter",
              bitmap = 'shooter.png',
            },
            { name   = "Insert_lasershooter",
              bitmap = 'lasershooter.png',
            },
            { name   = "Insert_bentlasershooter",
              bitmap = 'bentlasershooter.png',
            },
            { name   = "Insert__node_atp",
              bitmap = '_node_atp.png',
            },
            { name   = "Insert__node_g",
              bitmap = '_node_g.png',
            },
            { name   = "Insert__node_accel",
              bitmap = '_node_accel.png',
            },
            { name   = "Insert__node_stay",
              bitmap = '_node_stay.png',
            },
            { name   = "Insert__node_vf",
              bitmap = '_node_vf.png',
            },
            { name   = "Insert__node_pro",
              bitmap = '_node_pro.png',
            },
            { name   = "Insert__node_dir",
              bitmap = '_node_dir.png',
            },
            { name   = "Insert__node_aa",
              bitmap = '_node_aa.png',
            },
            { name   = "Insert__node_moveto",
              bitmap = '_node_moveto.png',
            },
            { name   = "Insert__node_rot",
              bitmap = '_node_rot.png',
            },
            { name   = "Insert__node_pe",
              bitmap = '_node_pe.png',
            },
            { name   = "Insert__node_toc",
              bitmap = '_node_toc.png',
            },
            { name   = "Insert__node_tof",
              bitmap = '_node_tof.png',
            },
        },
    },
    --]]
    {
        label   = 'Laser',
        name    = "PanelLaser",
        content = {
            { name   = "Insert_laserdefine",
              bitmap = 'laserdefine.png',
            },
            { name   = "Insert_lasercreate",
              bitmap = 'lasercreate.png',
            },
            { name   = "Insert_laserturnhalfon",
              bitmap = 'laserturnhalfon.png',
            },
            { name   = "Insert_laserturnon",
              bitmap = 'laserturnon.png',
            },
            { name   = "Insert_laserturnoff",
              bitmap = 'laserturnoff.png',
            },
            { name   = "Insert_lasergrow",
              bitmap = 'lasergrow.png',
            },
            { name   = "Insert_laserchange",
              bitmap = 'laserchange.png',
            },
            { name   = "Insert_laserbentdefine",
              bitmap = 'laserbentdefine.png',
            },
            { name   = "Insert_laserbentcreate",
              bitmap = 'laserbentcreate.png',
            },
        },
    },
    {
        label   = 'Object',
        name    = "PanelObject",
        content = {
            { name   = "Insert_objectdefine",
              bitmap = 'objectdefine.png',
            },
            { name   = "Insert_objectcreate",
              bitmap = 'objectcreate.png',
            },
            { name   = "Insert_setcolor",
              bitmap = 'setcolor.png',
            },
            { name   = "Insert_objectsetimg",
              bitmap = 'objectsetimg.png',
            },
            --[[
        },
    },
    {
        label   = 'Unit',
        name    = "PanelUnit",
        content = {
            --]]
            { name   = "Insert_callbackfunc",
              bitmap = 'callbackfunc.png',
            },
            { name   = "Insert_defaultaction",
              bitmap = 'defaultaction.png',
            },
            { name   = "Insert_setv",
              bitmap = 'setv.png',
            },
            --[[
            { name   = "Insert_setaccel",
              bitmap = 'setaccel.png',
            },
            { name   = "Insert_setgravity",
              bitmap = 'setgravity.png',
            },
            { name   = "Insert_setfv",
              bitmap = 'setfv.png',
            },
            --]]
            { name   = "Insert_unitkill",
              bitmap = 'unitkill.png',
            },
            { name   = "Insert_unitdel",
              bitmap = 'unitdel.png',
            },
            { name   = "Insert_unitforeach",
              bitmap = 'unitforeach.png',
            },
            { name   = "Insert_connect",
              bitmap = 'connect.png',
            },
            { name   = "Insert_setrelpos",
              bitmap = 'setrelpos.png',
            },
        },
    },
    {
        label   = 'Audio',
        name    = "PanelAudio",
        content = {
            { name   = "Insert_loadsound",
              bitmap = 'loadsound.png',
            },
            { name   = "Insert_playsound",
              bitmap = 'playsound.png',
            },
            { name   = "Insert_loadbgm",
              bitmap = 'loadbgm.png',
            },
            { name   = "Insert_playbgm",
              bitmap = 'playbgm.png',
            },
            { name   = "Insert_pausebgm",
              bitmap = 'pausebgm.png',
            },
            { name   = "Insert_resumebgm",
              bitmap = 'resumebgm.png',
            },
            { name   = "Insert_stopbgm",
              bitmap = 'stopbgm.png',
            },
        },
    },
    {
        label   = 'Graphics',
        name    = "PanelGraphics",
        content = {
            { name   = "Insert_loadimage",
              bitmap = 'loadimage.png',
            },
            { name   = "Insert_loadani",
              bitmap = 'loadani.png',
            },
            { name   = "Insert_loadparticle",
              bitmap = 'loadparticle.png',
            },
            { name   = "Insert_loadimagegroup",
              bitmap = 'loadimagegroup.png',
            },
            { name   = "Insert_loadtexture",
              bitmap = 'loadtexture.png',
            },
            --{ name   = "Insert_renderimage",
            --  bitmap = 'renderimage.png',
            --},
        },
    },
    {
        label   = 'Effects',
        name    = "PanelEffects",
        content = {
            { name   = "Insert_shakescreen",
              bitmap = 'shakescreen.png',
            },
            { name   = "Insert_dropitem",
              bitmap = 'dropitem.png',
            },
            { name   = "Insert_loadFX",
              bitmap = 'loadFX.png',
            },
            { name   = "Insert_smear",
              bitmap = 'smear.png',
            },
        },
    },
}

return M
