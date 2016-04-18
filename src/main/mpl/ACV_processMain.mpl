# Description: Processes the AS-ACV_Main regarding the SCV-color-Color
# Params: AS-ACV_Main, SCV-color-Color
# Return:
process ACV_processMain (

/kill @e[name=ACV_Up]
/kill @e[name=ACV_Down]
/kill @e[name=ACV_South]
/kill @e[name=ACV_East]
/kill @e[name=ACV_North]
/kill @e[name=ACV_West]

# TODO: Werte (0.95) kontrollieren
/execute @e[type=ArmorStand,name=ACV_Main] ~ ~ ~ /summon ArmorStand ~ ~0.9 ~ {CustomName:"ACV_Up",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=ArmorStand,name=ACV_Main] ~ ~ ~ /summon ArmorStand ~ ~-2.9 ~ {CustomName:"ACV_Down",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=ArmorStand,name=ACV_Main] ~ ~ ~ /summon ArmorStand ~ ~ ~0.95 {CustomName:"ACV_South",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=ArmorStand,name=ACV_Main] ~ ~ ~ /summon ArmorStand ~0.95 ~ ~ {CustomName:"ACV_East",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=ArmorStand,name=ACV_Main] ~ ~ ~ /summon ArmorStand ~ ~ ~-0.95 {CustomName:"ACV_North",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[type=ArmorStand,name=ACV_Main] ~ ~ ~ /summon ArmorStand ~-0.95 ~ ~ {CustomName:"ACV_West",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}

/execute @e[type=ArmorStand,name=ACV_Main] ~ ~ ~ /scoreboard players tag @e[type=ArmorStand,name=!ACV_Main,dy=0] add ACV_DV_PARAM

start ACV_createPortal
)