repeat process ACV_portals {
/scoreboard players set @e[type=arrow,c=1] ACV_COLOR 0 {inGround:1b,damage:5.5}
/scoreboard players set @e[type=arrow,c=1] ACV_COLOR 1 {inGround:1b,damage:6.0}
/scoreboard players set @e[type=arrow,c=1] ACV_COLOR 2 {inGround:1b,damage:6.5}
/scoreboard players set @e[type=arrow,c=1] ACV_COLOR 3 {inGround:1b,damage:7.0}
/execute @e[type=arrow,score_ACV_COLOR_min=0] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_Main",Duration:2147483647}
/execute @e[type=arrow,score_ACV_COLOR_min=0] ~ ~ ~ scoreboard players operation @e[type=area_effect_cloud,name=ACV_Main,r=0,c=1] ACV_COLOR = @e[type=arrow,score_ACV_COLOR_min=0,c=1] ACV_COLOR
/kill @e[type=arrow,score_ACV_COLOR_min=0]
conditional: start ACV_processMain
}



impulse process ACV_processMain {
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ summon area_effect_cloud ~ ~0.9 ~ {CustomName:"ACV_Up",Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ summon area_effect_cloud ~ ~-1.45 ~ {CustomName:"ACV_Down",Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ summon area_effect_cloud ~ ~ ~0.95 {CustomName:"ACV_South",Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ summon area_effect_cloud ~0.95 ~ ~ {CustomName:"ACV_East",Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ summon area_effect_cloud ~ ~ ~-0.95 {CustomName:"ACV_North",Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ summon area_effect_cloud ~-0.95 ~ ~ {CustomName:"ACV_West",Duration:2147483647}

/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=!ACV_Main,dy=0] add ACV_Direction

/kill @e[type=area_effect_cloud,name=ACV_Up,tag=!ACV_Direction]
/kill @e[type=area_effect_cloud,name=ACV_Down,tag=!ACV_Direction]
/kill @e[type=area_effect_cloud,name=ACV_South,tag=!ACV_Direction]
/kill @e[type=area_effect_cloud,name=ACV_East,tag=!ACV_Direction]
/kill @e[type=area_effect_cloud,name=ACV_North,tag=!ACV_Direction]
/kill @e[type=area_effect_cloud,name=ACV_West,tag=!ACV_Direction]

/tp @e[type=area_effect_cloud,name=ACV_Down] ~ ~1 ~

ACV_createPortals()
}
