// Description: Creates a Portal specified by SCV-color-Color-ACV_Interface
// Params: AS-ACV_remote_createPortal_PARAM, SCV-color-Color-ACV_Interface
// Return:



impulse process ACV_remote_createPortal {
/execute @e[name=ACV_online] ~ ~ ~ /testforblock ~ ~ ~ redstone_block
conditional: /setblock ${this + 4} redstone_block
/execute @e[name=ACV_online] ~ ~ ~ /setblock ~ ~ ~ stone
/entitydata @e[name=ACV_online] {CustomName:"ACV_online_intercepted"}
/summon armor_stand ${this + 1} {CustomName:"ACV_online",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

skip

impulse: /setblock ${this - 1} stone
/kill @e[name=ACV_online,r=2]
/kill @e[name=ACV_Main]
/entitydata @e[name=ACV_online_intercepted] {CustomName:"ACV_online"}

/kill @e[type=armor_stand,tag=ACV_Direction]

/execute @e[name=ACV_remote_createPortal_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_Up",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortal_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_Down",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortal_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_South",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortal_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_East",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortal_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_North",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortal_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_West",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortal_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_Main",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/kill @e[name=ACV_remote_createPortal_PARAM]
/scoreboard players operation @e[type=armor_stand,name=ACV_Main] ACV_COLOR = Color ACV_Interface
start ACV_createPortal
}
