repeat process ACV_portals {
/scoreboard players set @e[type=arrow,c=1] ACV_COLOR 0 {inGround:1b,damage:5.5}
/scoreboard players set @e[type=arrow,c=1] ACV_COLOR 1 {inGround:1b,damage:6.0}
/scoreboard players set @e[type=arrow,c=1] ACV_COLOR 2 {inGround:1b,damage:6.5}
/scoreboard players set @e[type=arrow,c=1] ACV_COLOR 3 {inGround:1b,damage:7.0}
/execute @e[type=arrow,score_ACV_COLOR_min=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_Main",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=arrow,score_ACV_COLOR_min=0] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name=ACV_Main,r=0,c=1] ACV_COLOR = @e[type=arrow,score_ACV_COLOR_min=0,c=1] ACV_COLOR
/kill @e[type=arrow,score_ACV_COLOR_min=0]
conditional: start ACV_processMain
}



impulse process ACV_processMain {
// TODO: Werte (0.95) kontrollieren
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~0.9 ~ {CustomName:"ACV_Up",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-0.95 ~ {CustomName:"ACV_Down",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~0.95 {CustomName:"ACV_South",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~0.95 ~ ~ {CustomName:"ACV_East",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~-0.95 {CustomName:"ACV_North",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~-0.95 ~ ~ {CustomName:"ACV_West",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=!ACV_Main,dy=0] add ACV_Direction

/kill @e[type=armor_stand,name=ACV_Up,tag=!ACV_Direction]
/kill @e[type=armor_stand,name=ACV_Down,tag=!ACV_Direction]
/kill @e[type=armor_stand,name=ACV_South,tag=!ACV_Direction]
/kill @e[type=armor_stand,name=ACV_East,tag=!ACV_Direction]
/kill @e[type=armor_stand,name=ACV_North,tag=!ACV_Direction]
/kill @e[type=armor_stand,name=ACV_West,tag=!ACV_Direction]

ACV_createPortals()
}
