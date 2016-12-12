repeat process ACV_antiBridges {

// Wake up all idle anti bridges
/execute @e[type=armor_stand,name=ACV_AntiBridge_Stopping] ~ ~ ~ entitydata @e[name=ACV_AntiBridge_Idle,dy=0] {CustomName:"ACV_AntiBridge"}

/kill @e[type=armor_stand,name=ACV_AntiBridge_Stopping]

/scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge,tag=ACV_InCarpet] remove ACV_InCarpet
/execute @e[type=armor_stand,name=ACV_AntiBridge] ~ ~ ~ detect ~ ~ ~ carpet 3 scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge,r=0,c=1] add ACV_InCarpet

/entitydata @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_InCarpet] {CustomName:"ACV_AntiBridge_Stopping"}

/scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge,tag=ACV_KeepCarpet] remove ACV_KeepCarpet
/scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge,tag=ACV_KeepPistonExtension] remove ACV_KeepPistonExtension
/execute @e[type=armor_stand,name=ACV_BridgeCross] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge,dy=0] add ACV_KeepCarpet
/execute @e[type=armor_stand,name=ACV_BridgeBelow] ~ ~-1 ~ scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge,dy=0] add ACV_KeepPistonExtension

/execute @e[type=armor_stand,name=ACV_AntiBridge] ~ ~ ~ kill @e[type=armor_stand,name=ACV_BridgeCross,dy=0,c=1]

/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~ ~ kill @e[type=armor_stand,name=ACV_BridgeBelow,dy=0]
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~1 ~ kill @e[type=armor_stand,name=ACV_BridgeBelow,dy=0]

///setblock ~ ~ ~ piston_extension Not: /fill ~ ~ ~ ~ ~ ~ piston_extension 0 replace carpet 3 due to https://bugs.mojang.com/browse/MC-61864
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~ ~ execute @e[type=armor_stand,name=ACV_AntiBridge,tag=ACV_KeepPistonExtension,r=0,c=1] ~ ~ ~ setblock ~ ~ ~ piston_extension
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~ ~ fill ~ ~ ~ ~ ~ ~ air 0 replace carpet 3
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~ ~ fill ~ ~-1 ~ ~ ~-1 ~ air 0 replace piston_extension

/tp @e[type=armor_stand,name=ACV_AntiBridge,rym=45,ry=135] ~-1 ~ ~
/tp @e[type=armor_stand,name=ACV_AntiBridge,rym=135,ry=-135] ~ ~ ~-1
/tp @e[type=armor_stand,name=ACV_AntiBridge,rym=-135,ry=-45] ~1 ~ ~
/tp @e[type=armor_stand,name=ACV_AntiBridge,rym=-45,ry=45] ~ ~ ~1

/execute @e[type=armor_stand,name=ACV_AntiBridge] ~ ~ ~ kill @e[type=armor_stand,name=ACV_LightBridgeEnd,dy=0]
}
