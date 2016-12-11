repeat process ACV_lightBridges {
/kill @e[type=armor_stand,name=ACV_LightBridge,rxm=-90,rx=-1]
/kill @e[type=armor_stand,name=ACV_LightBridge,rxm=1,rx=90]
/scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge] remove ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ minecraft:air 0 scoreboard players tag @e[r=0,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ minecraft:carpet 3 scoreboard players tag @e[r=0,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ minecraft:piston_extension -1 execute @e[r=0,c=1] ~ ~ ~ detect ~ ~1 ~ minecraft:carpet 3 scoreboard players tag @e[r=0,c=1] add ACV_InAir

/execute @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_InAir] ~ ~ ~ scoreboard players tag @e[name=ACV_PortalIn,dy=0] add ACV_calculateLightBridges_PARAM
/entitydata @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_InAir] {CustomName:"ACV_LightBridgeEnd"}
conditional: start ACV_calculateLightBridges

/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~1 ~ minecraft:carpet 3 summon armor_stand ~ ~1 ~ {CustomName:"ACV_BridgeBelow",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ minecraft:carpet 3 summon armor_stand ~ ~ ~ {CustomName:"ACV_BridgeCross",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~-1 ~ minecraft:carpet 3 summon armor_stand ~ ~ ~ {CustomName:"ACV_BridgeBelow",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ setblock ~ ~-1 ~ minecraft:piston_extension 0 keep
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ setblock ~ ~ ~ minecraft:carpet 3
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=45,ry=135] ~-1 ~ ~
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=135,ry=-135] ~ ~ ~-1
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=-135,ry=-45] ~1 ~ ~
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=-45,ry=45] ~ ~ ~1

// Wake up all idle light bridges
/entitydata @e[name=ACV_LightBridge_Idle] {CustomName:"ACV_LightBridge"}
}
