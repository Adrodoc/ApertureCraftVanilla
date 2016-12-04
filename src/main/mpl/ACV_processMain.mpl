// Description: Processes the AS-ACV_Main regarding the SCV-color-Color
// Params: AS-ACV_Main, SCV-color-Color
// Return:
impulse process ACV_processMain {

/kill @e[type=armor_stand,tag=ACV_Direction]

// TODO: Werte (0.95) kontrollieren
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~0.9 ~ {CustomName:"ACV_Up",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-0.95 ~ {CustomName:"ACV_Down",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~0.95 {CustomName:"ACV_South",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~0.95 ~ ~ {CustomName:"ACV_East",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~-0.95 {CustomName:"ACV_North",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~-0.95 ~ ~ {CustomName:"ACV_West",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=!ACV_Main,dy=0] add ACV_Direction

/kill @e[name=ACV_Up,tag=!ACV_Direction]
/kill @e[name=ACV_Down,tag=!ACV_Direction]
/kill @e[name=ACV_South,tag=!ACV_Direction]
/kill @e[name=ACV_East,tag=!ACV_Direction]
/kill @e[name=ACV_North,tag=!ACV_Direction]
/kill @e[name=ACV_West,tag=!ACV_Direction]

ACV_createPortal()
}