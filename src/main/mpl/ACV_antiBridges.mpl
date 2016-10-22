repeat process ACV_antiBridges {

// Wake up all idle anti bridges
/execute @e[type=armor_stand,name=ACV_AntiBridge_Stopping] ~ ~ ~ entitydata @e[name=ACV_AntiBridge_Idle,dy=0] {CustomName:"ACV_AntiBridge"}

/kill @e[type=armor_stand,name=ACV_AntiBridge_Stopping]
/scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge] remove ACV_InCarpet
/execute @e[type=armor_stand,name=ACV_AntiBridge] ~ ~ ~ detect ~ ~ ~ minecraft:carpet 3 scoreboard players tag @e[r=0,c=1] add ACV_InCarpet
/entitydata @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_InCarpet] {CustomName:"ACV_AntiBridge_Stopping"}
/scoreboard players tag @e remove ACV_KeepCarpet
/scoreboard players tag @e remove ACV_Keep36
/execute @e[name=ACV_BridgeCross] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge,dy=0] add ACV_KeepCarpet
/execute @e[name=ACV_BridgeBelow] ~ ~-1 ~ scoreboard players tag @e[type=armor_stand,name=ACV_AntiBridge,dy=0] add ACV_Keep36
/execute @e[type=armor_stand,name=ACV_AntiBridge] ~ ~ ~ kill @e[name=ACV_BridgeCross,dy=0,c=1]
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~ ~ kill @e[name=ACV_BridgeBelow,dy=0]
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~1 ~ kill @e[name=ACV_BridgeBelow,dy=0]
///setblock ~ ~ ~ minecraft:piston_extension Not: /fill ~ ~ ~ ~ ~ ~ minecraft:piston_extension 0 replace minecraft:carpet 3 due to https://bugs.mojang.com/browse/MC-61864
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~ ~ execute @e[type=armor_stand,name=ACV_AntiBridge,tag=ACV_Keep36,r=0,c=1] ~ ~ ~ setblock ~ ~ ~ minecraft:piston_extension
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~ ~ fill ~ ~ ~ ~ ~ ~ minecraft:air 0 replace minecraft:carpet 3
/execute @e[type=armor_stand,name=ACV_AntiBridge,tag=!ACV_KeepCarpet] ~ ~ ~ fill ~ ~-1 ~ ~ ~-1 ~ minecraft:air 0 replace minecraft:piston_extension
/tp @e[type=armor_stand,name=ACV_AntiBridge,rym=45,ry=135] ~-1 ~ ~
/tp @e[type=armor_stand,name=ACV_AntiBridge,rym=135,ry=-135] ~ ~ ~-1
/tp @e[type=armor_stand,name=ACV_AntiBridge,rym=-135,ry=-45] ~1 ~ ~
/tp @e[type=armor_stand,name=ACV_AntiBridge,rym=-45,ry=45] ~ ~ ~1

/execute @e[type=armor_stand,name=ACV_AntiBridge] ~ ~ ~ kill @e[name=ACV_LightBridgeEnd,dy=0]
}
