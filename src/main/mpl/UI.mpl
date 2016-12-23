// Param & Return Types:
// AS = armor_stand
// SCV = Scoreboard Value
// SC = Scoreboard
// ASwS = armor_stands with Score
// ASwT = armor_stands with Tag
// IF = ItemFrame

// ACV_DIRECTION:
// 5 = Floor Portal
// 4 = Ceiling Portal
// 3 = East Portal
// 2 = North Portal
// 1 = West Portal
// 0 = South Portal

// ACV_Color:
// 0 = Blue
// 1 = Orange
// 2 = Purple
// 3 = Red

Summon blue Portal:
/summon area_effect_cloud ~ ~1 ~ {CustomName:"ACV_remote_createPortals_PARAM",Tags:["ACV_Blue"],Duration:2147483647}
/execute @e[name=ACV_remote_createPortals] ~ ~ ~ setblock ~ ~ ~ redstone_block

Summon orange Portal:
/summon area_effect_cloud ~ ~1 ~ {CustomName:"ACV_remote_createPortals_PARAM",Tags:["ACV_Orange"],Duration:2147483647}
/execute @e[name=ACV_remote_createPortals] ~ ~ ~ setblock ~ ~ ~ redstone_block

Summon purple Portal:
/summon area_effect_cloud ~ ~1 ~ {CustomName:"ACV_remote_createPortals_PARAM",Tags:["ACV_Purple"],Duration:2147483647}
/execute @e[name=ACV_remote_createPortals] ~ ~ ~ setblock ~ ~ ~ redstone_block

Summon red Portal:
/summon area_effect_cloud ~ ~1 ~ {CustomName:"ACV_remote_createPortals_PARAM",Tags:["ACV_Red"],Duration:2147483647}
/execute @e[name=ACV_remote_createPortals] ~ ~ ~ setblock ~ ~ ~ redstone_block

Summon Repulsion Gel:
/summon item ~ ~ ~ {CustomName:"ACV_RepulsionGel",PickupDelay:32767,Item:{Count:1,Damage:11,id:"minecraft:wool"}}

Summon Propulsion Gel:
/summon item ~ ~ ~ {CustomName:"ACV_PropulsionGel",PickupDelay:32767,Item:{Count:1,Damage:1,id:"minecraft:wool"}}

Summon Cleansing Gel
/summon item ~ ~ ~ {CustomName:"ACV_CleansingGel",PickupDelay:32767,Item:{Count:1,id:"minecraft:glass"}}

Summon Material Emancipation Grill:
/summon area_effect_cloud ~ ~ ~ {CustomName:ACV_MEG,Duration:2147483647,Passengers:[{id:creeper,CustomName:ACV_MEG,powered:1,ActiveEffects:[{Amplifier:1,Duration:1000000,Id:14,ShowParticles:0b}],PersistenceRequired:1,Invulnerable:1,NoAI:1}]}

Kill Material Emancipation Grill:
/tp @e[name=ACV_MEG,dy=1] ~ -100 ~



Control_Panel {

Special_Thanks {
/setblock ~ ~ ~ standing_sign 0 replace {Text1:"{\"text\":\"Special Thanks\",\"bold\":\"true\"}",Text2:"[{\"text\":\"click on the \"},{\"text\":\"red\",\"color\":\"red\"}]",Text3:"{\"text\":\"names for more\"}",Text4:"{\"text\":\"information\"}"}
/setblock ~ ~ ~ wall_sign 3 replace {Text1:"{\"text\":\"Adrodoc55\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"Adrodoc55's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" YouTube-Channel by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"https://www.youtube.com/user/Adrodoc55\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"because I wanted\"}",Text4:"{\"text\":\"to thank myself\"}"}
/setblock ~ ~ ~ wall_sign 3 replace {Text1:"{\"text\":\"The Farlanders\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"The Farlander's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" Video by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"http://youtu.be/jSiP51XKK1Q\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for the whole\"}",Text4:"{\"text\":\"Idea\"}"}
/setblock ~ ~ ~ wall_sign 3 replace {Text1:"{\"text\":\"Dragnoz\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"Dragnoz's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" Video by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"http://youtu.be/J0ulXBtxQvo\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for floor and\"}",Text4:"{\"text\":\"ceiling Portals\"}"}
/setblock ~ ~ ~ wall_sign 3 replace {Text1:"{\"text\":\"SimplySarc\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"SimplySarc's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" Video by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"http://youtu.be/O8dv9P49cKk\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for the\"}",Text4:"{\"text\":\"Chunk-Loader\"}"}
/setblock ~ ~ ~ wall_sign 3 replace {Text1:"{\"text\":\"NanoRex\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"NanoRex's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" Video by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"http://youtu.be/lyROYbzLCZ0\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for the Material\"}",Text4:"{\"text\":\"Emancipation Grid\"}"}
/setblock ~ ~ ~ wall_sign 3 replace {Text1:"{\"text\":\"Ersatz_\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"Ersatz_'s\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" YouTube-Channel by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"https://www.youtube.com/channel/UClfq20CeYnZ2_Rm72VgUPXg\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for his\"}",Text4:"{\"text\":\"Contribution\"}"}
Special_Thanks }

Equipment {
/setblock ~ ~ ~ standing_sign 0 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"Equipment\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}

/give @p minecraft:bow 1 0 {Unbreakable:1,ench:[{id:48,lvl:6},{id:51,lvl:1}],HideFlags:5,display:{Name:"Blue Portalgun",Lore:["Makes blue Portals!"]}}
/give @p minecraft:bow 1 0 {Unbreakable:1,ench:[{id:48,lvl:7},{id:51,lvl:1}],HideFlags:5,display:{Name:"Orange Portalgun",Lore:["Doesn't make blue Portals!"]}}
/give @p minecraft:bow 1 0 {Unbreakable:1,ench:[{id:48,lvl:8},{id:51,lvl:1}],HideFlags:5,display:{Name:"Purple Portalgun",Lore:["Makes purple Portals!"]}}
/give @p minecraft:bow 1 0 {Unbreakable:1,ench:[{id:48,lvl:9},{id:51,lvl:1}],HideFlags:5,display:{Name:"Red Portalgun",Lore:["Makes red Portals!"]}}
/give @p minecraft:arrow 1 0 {display:{Name:"Picking up Cubes",Lore:["Hold this to pick up the closest Cube"]}}
/replaceitem entity @p slot.armor.feet minecraft:chainmail_boots 1 0 {Unbreakable:1,ench:[{id:2,lvl:1}],HideFlags:5,display:{Name:"Long Fall Boots",Lore:["No more Falldamage!"]}}
Equipment }

Kill all Cubes {
/kill @e[name=ACV_Cube]
Kill all Cubes }

Kill closest Cubes {
/kill @e[name=ACV_Cube,c=1]
Kill closest Cubes }

Summon a Weighted Storage Cube {
/summon armor_stand ~ ~-0.8 ~2 {CustomName:"ACV_Cube",DisabledSlots:2035728,ArmorItems:[{},{},{},{Damage:6,id:"stone",Count:1}],NoGravity:1b,Invisible:1b,Invulnerable:1b}
Summon a Weighted Storage Cube }

Summon a Discourgement Redirection Cube {
/summon armor_stand ~ ~-0.8 ~2 {CustomName:"ACV_Cube",DisabledSlots:2035728,ArmorItems:[{},{},{},{id:"dispenser",Count:1}],Tags:["ACV_Redirecting"],NoGravity:1b,Invisible:1b,Invulnerable:1b}
Summon a Discourgement Redirection Cube }



Delete all Portals {
/execute @e[name=ACV_remote_deleteAllPortals] ~ ~ ~ setblock ~ ~ ~ redstone_block
Delete all Portals }

Delete blue Portal {
/summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM",Tags:["ACV_Blue"],Duration:2147483647}
/execute @e[name=ACV_remote_deletePortals] ~ ~ ~ setblock ~ ~ ~ redstone_block
Delete blue Portal }

Delete orange Portal {
/summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM",Tags:["ACV_Orange"],Duration:2147483647}
/execute @e[name=ACV_remote_deletePortals] ~ ~ ~ setblock ~ ~ ~ redstone_block
Delete orange Portal }

Delete purple Portal {
/summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM",Tags:["ACV_Purple"],Duration:2147483647}
/execute @e[name=ACV_remote_deletePortals] ~ ~ ~ setblock ~ ~ ~ redstone_block
Delete purple Portal }

Delete red Portal {
/summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM",Tags:["ACV_Red"],Duration:2147483647}
/execute @e[name=ACV_remote_deletePortals] ~ ~ ~ setblock ~ ~ ~ redstone_block
Delete red Portal }



Block_Option {
/setblock ~ ~ ~ standing_sign 8 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"Block-Option\",\"color\":\"black\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}

/execute @e[name=ACV_confirmBlockOption] ~ ~ ~ setblock ~ ~ ~ redstone_block
Block_Option }

Mapmaker_Helper {
/setblock ~ ~ ~ standing_sign 8 replace {Text1:"{\"text\":\"When building\"}",Text2:"{\"text\":\"a map please\"}",Text3:"{\"text\":\"consider the \"}",Text4:"{\"text\":\"Mapmaker Helper\",\"color\":\"dark_red\"}"}

/tellraw @a [{"text":"Download the ","color":"yellow"},{"text":"Mapmaker Helper","color":"gold"},{"text":" by clicking ","color":"yellow"},{"text":"here","color":"aqua","hoverEvent":{"action":"show_text","value":{"text":"Click to open the Download Page","color":"red"}},"clickEvent":{"action":"open_url","value":"https://github.com/Adrodoc55/MapMakerHelper/releases"}}]
Mapmaker_Helper }

Portalsystem {
/setblock ~ ~ ~ standing_sign 8 replace {Text1:"[{\"text\":\"Portal\",\"color\":\"dark_blue\",\"bold\":true},{\"text\":\"system\",\"color\":\"gold\",\"bold\":true}]",Text2:"{\"text\":\"off\",\"color\":\"dark_red\"}",Text3:"{\"text\":\"|\",\"color\":\"black\"}",Text4:"{\"text\":\"on\",\"color\":\"dark_green\"}"}

/execute @e[name=ACV_portals] ~ ~ ~ setblock ~ ~ ~ redstone_block
/execute @e[name=ACV_teleportation] ~ ~ ~ setblock ~ ~ ~ redstone_block
/tellraw @a [{"text":"Welcome to","color":"gold"},{"text":" ApertureCraft Vanilla\n","color":"dark_aqua"},{"text":"   Version: ","color":"gold"},{"text":"9.0.0\n","color":"dark_aqua","italic":"true"},{"text":"   made by ","color":"yellow","italic":"true"},{"text":"Adrodoc55\n","color":"aqua","hoverEvent":{"action":"show_text","value":{"text":"Click to open YouTube Channel","color":"red"}},"clickEvent":{"action":"open_url","value":"https://www.youtube.com/user/Adrodoc55"}},{"text":"\nVisit me on ","color":"yellow"},{"text":"[Github]","color":"aqua","hoverEvent":{"action":"show_text","value":{"text":"Click to open Github","color":"red"}},"clickEvent":{"action":"open_url","value":"https://github.com/Adrodoc55/ApertureCraftVanilla"}},{"text":" to report Bugs and check for Updates","color":"yellow"}]

/execute @e[name=ACV_portals] ~ ~ ~ setblock ~ ~ ~ stone
/execute @e[name=ACV_teleportation] ~ ~ ~ setblock ~ ~ ~ stone
Portalsystem }

Smooth_Teleport {
/setblock ~ ~ ~ standing_sign 8 replace {Text1:"{\"text\":\"Smooth Teleport\"}",Text2:"{\"text\":\"off\",\"color\":\"dark_red\"}",Text3:"{\"text\":\"|\",\"color\":\"black\"}",Text4:"{\"text\":\"on\",\"color\":\"dark_green\"}"}

/execute @e[name=ACV_teleportation] ~ ~ ~ setblock ~ ~ ~ stone
/entitydata @e[name=ACV_teleportation] {CustomName:"ACV_simpleTeleportation"}
/entitydata @e[name=ACV_smoothTeleportation] {CustomName:"ACV_teleportation"}

/execute @e[name=ACV_teleportation] ~ ~ ~ setblock ~ ~ ~ stone
/entitydata @e[name=ACV_teleportation] {CustomName:"ACV_smoothTeleportation"}
/entitydata @e[name=ACV_simpleTeleportation] {CustomName:"ACV_teleportation"}

/execute @e[name=ACV_portals] ~ ~ ~ detect ~ ~ ~ redstone_block * execute @e[name=ACV_teleportation] ~ ~ ~ setblock ~ ~ ~ redstone_block
Smooth_Teleport }

Cubes {
/setblock ~ ~ ~ standing_sign 8 replace {Text1:"{\"text\":\"Cubes\",\"color\":\"dark_gray\",\"bold\":true}",Text2:"{\"text\":\"off\",\"color\":\"dark_red\"}",Text3:"{\"text\":\"|\",\"color\":\"black\"}",Text4:"{\"text\":\"on\",\"color\":\"dark_green\"}"}

/execute @e[name=ACV_cubes] ~ ~ ~ setblock ~ ~ ~ redstone_block

/execute @e[name=ACV_cubes] ~ ~ ~ setblock ~ ~ ~ stone
Cubes }

Lasers {
/setblock ~ ~ ~ standing_sign 8 replace {Text1:"{\"text\":\"Lasers\",\"color\":\"dark_red\",\"bold\":true}",Text2:"{\"text\":\"off\",\"color\":\"dark_red\"}",Text3:"{\"text\":\"|\",\"color\":\"black\"}",Text4:"{\"text\":\"on\",\"color\":\"dark_green\"}"}

/execute @e[name=ACV_lasers] ~ ~ ~ setblock ~ ~ ~ redstone_block

/execute @e[name=ACV_lasers] ~ ~ ~ setblock ~ ~ ~ stone
Lasers }

Material Emancipation Grill {
/setblock ~ ~ ~ minecraft:standing_sign 8 replace {Text1:"{\"text\":\"Material\"}",Text2:"{\"text\":\"Emancipation Grill\"}",Text3:"{\"text\":\"off\",\"color\":\"dark_red\"}",Text4:"{\"text\":\"on\",\"color\":\"dark_green\"}"}

/execute @e[name=ACV_megs] ~ ~ ~ setblock ~ ~ ~ redstone_block

/execute @e[name=ACV_megs] ~ ~ ~ setblock ~ ~ ~ stone
Material Emancipation Grill }

Gels {
/setblock ~ ~ ~ standing_sign 8 replace {Text1:"{\"text\":\"Gels\",\"color\":\"blue\",\"bold\":true}",Text2:"{\"text\":\"off\",\"color\":\"dark_red\"}",Text3:"{\"text\":\"|\",\"color\":\"black\"}",Text4:"{\"text\":\"on\",\"color\":\"dark_green\"}"}

/execute @e[name=ACV_gels] ~ ~ ~ /setblock ~ ~ ~ redstone_block

/execute @e[name=ACV_gels] ~ ~ ~ /setblock ~ ~ ~ stone
Gels }

Control_Panel }


