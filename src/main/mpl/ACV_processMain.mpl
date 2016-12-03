// Description: Processes the AS-ACV_Main regarding the SCV-color-Color
// Params: AS-ACV_Main, SCV-color-Color
// Return:
impulse process ACV_processMain {

/kill @e[name=ACV_Up]
/kill @e[name=ACV_Down]
/kill @e[name=ACV_South]
/kill @e[name=ACV_East]
/kill @e[name=ACV_North]
/kill @e[name=ACV_West]

// TODO: Werte (0.95) kontrollieren
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~0.9 ~ {CustomName:"ACV_Up",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-0.95 ~ {CustomName:"ACV_Down",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~0.95 {CustomName:"ACV_South",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~0.95 ~ ~ {CustomName:"ACV_East",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~-0.95 {CustomName:"ACV_North",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~-0.95 ~ ~ {CustomName:"ACV_West",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=!ACV_Main,dy=0] add ACV_DV_PARAM
/kill @e[type=armor_stand,tag=!ACV_DV_PARAM]

ACV_createPortal()
}