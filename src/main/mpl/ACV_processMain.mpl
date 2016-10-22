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
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~0.9 ~ {CustomName:"ACV_Up",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
// Workaround for https://github.com/Adrodoc55/ApertureCraftVanilla/issues/11, see commit 1f230f3
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~-2.9 ~ {CustomName:"ACV_Down",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~ ~0.95 {CustomName:"ACV_South",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ /summon armor_stand ~0.95 ~ ~ {CustomName:"ACV_East",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~ ~-0.95 {CustomName:"ACV_North",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ /summon armor_stand ~-0.95 ~ ~ {CustomName:"ACV_West",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ /scoreboard players tag @e[type=armor_stand,name=!ACV_Main,dy=0] add ACV_DV_PARAM

ACV_createPortal()
}