repeat process ACV_lightBridges {
// Remove unsupported bridges
/kill @e[type=armor_stand,name=ACV_LightBridge,rxm=-90,rx=-1]
/kill @e[type=armor_stand,name=ACV_LightBridge,rxm=1,rx=90]

/scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,tag=ACV_InAir] remove ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ air * scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,r=0,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ carpet 3 scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,r=0,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ piston_extension * execute @e[type=armor_stand,name=ACV_LightBridge,r=0,c=1] ~ ~ ~ detect ~ ~1 ~ carpet 3 scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,r=0,c=1] add ACV_InAir

/execute @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_InAir] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=ACV_PortalIn,dy=0] add ACV_createLightBridges_PARAM
/entitydata @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_InAir] {CustomName:"ACV_LightBridgeEnd"}
conditional: start ACV_createLightBridges

/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~-1 ~ carpet 3 summon armor_stand ~ ~ ~ {CustomName:"ACV_BridgeBelow",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ carpet 3 summon armor_stand ~ ~ ~ {CustomName:"ACV_BridgeCross",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~1 ~ carpet 3 summon armor_stand ~ ~1 ~ {CustomName:"ACV_BridgeBelow",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ setblock ~ ~-1 ~ piston_extension 0 keep
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ setblock ~ ~ ~ carpet 3

/tp @e[type=armor_stand,name=ACV_LightBridge,rym=45,ry=135] ~-1 ~ ~
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=135,ry=-135] ~ ~ ~-1
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=-135,ry=-45] ~1 ~ ~
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=-45,ry=45] ~ ~ ~1

// Wake up all idle light bridges
/entitydata @e[name=ACV_LightBridge_Idle] {CustomName:"ACV_LightBridge"}
}
