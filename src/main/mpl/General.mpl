Befehle der Version 8.1.0

// Param & Return Types:
// AS = armor_stand
// SCV = Scoreboard Value
// SC = Scoreboard
// ASwS = armor_stands with Score
// ASwT = armor_stands with Tag
// dAS = Directional armor_stand
// IF = ItemFrame

// TODO: alle ASwS durch ASwT ersetzen

// direction:
// 5 = Floor Portal
// 4 = Ceiling Portal
// 3 = North Portal
// 2 = West Portal
// 1 = South Portal
// 0 = East Portal

// directionMask:
// 32-63 = Floor Portal
// 16-32 = Ceiling Portal
// 8-15 = North Portal
// 4-7 = West Portal
// 2-3 = South Portal
// 1 = East Portal

// bool:
// <= 0 = false
// >= 1 = true

// color:
// 0 = Blue
// 1 = Orange
// 2 = Purple
// 3 = Red

Gel Placement:
/summon Item ~-1 ~-1 ~-1 {CustomName:"ACV_BlueGel",Age:-32768,PickupDelay:32767,Item:{Count:1,Damage:11,id:"minecraft:wool"}}
/summon Item ~ ~-2 ~ {CustomName:"ACV_OrangeGel",Age:-32768,PickupDelay:32767,Item:{Count:1,Damage:1,id:"minecraft:wool"}}

Portal Spawner:
/summon armor_stand ~ ~-1 ~ {CustomName:"ACV_remote_createPortals_PARAM",Tags:["ACV_Blue"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_remote_createPortals] ~ ~ ~ /setblock ~ ~ ~ redstone_block

MEG_SPAWN_DELETE {
/give @p minecraft:spawn_egg 1 0 {EntityTag:{id:"Squid"},display:{Name:"spawnMeg",Lore:["Use this to spawn","a Material Emancipation Grid"]}}
/give @p minecraft:spawn_egg 1 0 {EntityTag:{id:"Squid"},display:{Name:"deleteMeg",Lore:["Use this to delete","a Material Emancipation Grid"]}}
MEG_SPAWN_DELETE }

MegSpawnAndDelete_on_off {
/execute @e[name=ACV_megSpawnAndDelete] ~ ~ ~ /setblock ~ ~ ~ stone

/execute @e[name=ACV_megSpawnAndDelete] ~ ~ ~ /setblock ~ ~ ~ redstone_block

MegSpawnAndDelete_on_off }

Install {
/setblock ~ ~ ~-1 stone
/gamerule commandBlockOutput false
/gamerule logAdminCommands false
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"red","extra":[{"text":"Starting Installation","color":"yellow"}]}
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Interfaces","color":"yellow"}]}
/setblock ~-1 ~ ~3 redstone_block
/setblock ~ ~1 ~ stone

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Scoreboards","color":"yellow"}]}
/execute @e[name=ACV_setupScoreboards] ~ ~ ~ /setblock ~ ~ ~ redstone_block
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Enabling UI","color":"yellow"}]}
/fill ~7 ~ ~-3 ~13 ~2 ~-2 lever 12 replace barrier
/fill ~6 ~ ~-2 ~12 ~2 ~-1 stained_hardened_clay 10 replace redstone_block 0
/blockdata ~4 ~1 ~-11 {Command:"/setblock ~-7 ~ ~9 redstone_block"}
/setblock ~4 ~2 ~-10 wall_sign 3 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"[Uninstall]\",\"color\":\"dark_green\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}
/fill ~3 ~ ~-12 ~5 ~2 ~-12 stained_hardened_clay 13 replace stained_hardened_clay 14
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Block-Option","color":"yellow"}]}
/setblock ~ ~ ~-1 redstone_block
/setblock ~ ~1 ~ stone
Install }

Uninstall {
/setblock ~ ~ ~-1 stone
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"red","extra":[{"text":"Starting Uninstallation","color":"yellow"}]}
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Portals","color":"yellow"}]}
/execute @e[name=ACV_remote_deleteAllPortals] ~ ~ ~ /setblock ~ ~ ~ redstone_block
/setblock ~1 ~1 ~1 redstone_block
/setblock ~ ~-1 ~ stone

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Disabling UI","color":"yellow"}]}
/fill ~7 ~-1 ~-4 ~13 ~1 ~-3 barrier 0 replace lever
/fill ~7 ~-1 ~-4 ~13 ~1 ~-3 redstone_block 0 replace stained_hardened_clay 10
/blockdata ~5 ~ ~-13 {Command:"/setblock ~-7 ~-1 ~9 redstone_block"}
/setblock ~4 ~1 ~-11 wall_sign 3 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"[Install]\",\"color\":\"dark_red\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}
/fill ~3 ~-1 ~-11 ~5 ~1 ~-11 stained_hardened_clay 14 replace stained_hardened_clay 13
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Interrupt all Interface calls","color":"yellow"}]}
/execute @e[tag=ACV_remote_interface] ~ ~ ~ /setblock ~ ~ ~ stone
/execute @e[tag=ACV_internal_interface] ~ ~ ~ /setblock ~ ~ ~ stone
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Scoreboards","color":"yellow"}]}
/execute @e[name=ACV_deleteScoreboards] ~ ~ ~ /setblock ~ ~ ~ redstone_block
/setblock ~1 ~ ~ redstone_block
/setblock ~ ~1 ~ stone
/setblock ~1 ~ ~1 redstone_block
/setblock ~ ~1 ~ stone
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Interfaces","color":"yellow"}]}
/setblock ~-7 ~-1 ~3 redstone_block
Uninstall }


Control_Panel {

Block_Option {
/setblock ~ ~3 ~ standing_sign 8 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"Block-Option\",\"color\":\"black\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}

/execute @e[name=ACV_confirmBlockOption] ~ ~ ~ /setblock ~ ~ ~ redstone_block
Block_Option }

Smooth_Teleport {
/setblock ~ ~6 ~ standing_sign 8 replace {Text1:"{\"text\":\"Smooth Teleport\"}",Text2:"{\"text\":\"on\",\"color\":\"dark_green\"}",Text3:"{\"text\":\"|\",\"color\":\"black\"}",Text4:"{\"text\":\"off\",\"color\":\"dark_red\"}"}

/execute @e[name=ACV_teleportation] ~ ~ ~ /setblock ~ ~ ~ stone
/entitydata @e[name=ACV_teleportation] {CustomName:"ACV_smoothTeleportation"}
/entitydata @e[name=ACV_simpleTeleportation] {CustomName:"ACV_teleportation"}

/execute @e[name=ACV_teleportation] ~ ~ ~ /setblock ~ ~ ~ stone
/entitydata @e[name=ACV_teleportation] {CustomName:"ACV_simpleTeleportation"}
/entitydata @e[name=ACV_smoothTeleportation] {CustomName:"ACV_teleportation"}

/execute @e[name=ACV_online] ~ ~ ~ detect ~ ~ ~ redstone_block 0 /execute @e[name=ACV_teleportation] ~ ~ ~ /setblock ~ ~ ~ redstone_block
Smooth_Teleport }

Portalsystem_on_off {
/execute @e[name=ACV_online] ~ ~ ~ /setblock ~ ~ ~ stone
/execute @e[name=ACV_teleportation] ~ ~ ~ /setblock ~ ~ ~ stone

/execute @e[name=ACV_online] ~ ~ ~ /setblock ~ ~ ~ redstone_block
/execute @e[name=ACV_teleportation] ~ ~ ~ /setblock ~ ~ ~ redstone_block
/tellraw @a {"text":"","extra":[{"text":"Welcome to","color":"gold"},{"text":" ApertureCraft Vanilla\n","color":"dark_aqua"},{"text":"   Version: ","color":"gold"},{"text":"8.2.0\n","color":"dark_aqua","italic":"true"},{"text":"   made by ","color":"yellow","italic":"true"},{"text":"Adrodoc55\n","color":"aqua","hoverEvent":{"action":"show_text","value":{"text":"Click to open YouTube Channel","color":"red"}},"clickEvent":{"action":"open_url","value":"https://www.youtube.com/user/Adrodoc55"}},{"text":"\nVisit me on ","color":"yellow"},{"text":"[Github]","color":"aqua","hoverEvent":{"action":"show_text","value":{"text":"Click to open Github","color":"red"}},"clickEvent":{"action":"open_url","value":"https://github.com/Adrodoc55/ApertureCraftVanilla"}},{"text":" to report Bugs and check for Updates\n","color":"yellow"}]}
/setblock ~ ~ ~ redstone_block
/fill ~ ~ ~ ~1 ~ ~ air
/tellraw @a {"text":"ApertureCraft Vanilla has been installed. Please restart the System to enable it!","color":"red"}
Portalsystem_on_off }

Lightbridges_on_off {
/execute @e[name=ACV_lightBridges] ~ ~ ~ /setblock ~ ~ ~ stone
/execute @e[name=ACV_antiBridges] ~ ~ ~ /setblock ~ ~ ~ stone

/execute @e[name=ACV_lightBridges] ~ ~ ~ /setblock ~ ~ ~ redstone_block
/execute @e[name=ACV_antiBridges] ~ ~ ~ /setblock ~ ~ ~ redstone_block
Lightbridges_on_off }

Mapmaker_Helper {
/setblock ~ ~3 ~ standing_sign 8 replace {Text1:"{\"text\":\"To create Laser\"}",Text2:"{\"text\":\"and Light Bridges\"}",Text3:"{\"text\":\"you need the\"}",Text4:"{\"text\":\"Mapmaker Helper\",\"color\":\"dark_red\"}"}

/tellraw @a {"text":"Download the ","color":"yellow","extra":[{"text":"Map Maker Helper","color":"gold"},{"text":" by clicking ","color":"yellow"},{"text":"here","color":"aqua","hoverEvent":{"action":"show_text","value":{"text":"Click to open the Download Page","color":"red"}},"clickEvent":{"action":"open_url","value":"https://github.com/Adrodoc55/MapMakerHelper/releases"}}]}
Mapmaker_Helper }

Gels_on_off {
/setblock ~ ~5 ~ standing_sign 8 replace {Text1:"{\"text\":\"Gels\",\"color\":\"yellow\",\"bold\":\"true\"}",Text2:"{\"text\":\"on\",\"color\":\"dark_green\"}",Text3:"{\"text\":\"|\",\"color\":\"black\"}",Text4:"{\"text\":\"off\",\"color\":\"dark_red\"}"}

/execute @e[name=ACV_gels] ~ ~ ~ /setblock ~ ~ ~ stone

/execute @e[name=ACV_gels] ~ ~ ~ /setblock ~ ~ ~ redstone_block
Gels_on_off }

Cubes_on_off {
/execute @e[name=ACV_cubes] ~ ~ ~ /setblock ~ ~ ~ stone

/execute @e[name=ACV_cubes] ~ ~ ~ /setblock ~ ~ ~ redstone_block
Cubes_on_off }

Lasers_on_off {
/execute @e[name=ACV_lasers] ~ ~ ~ /setblock ~ ~ ~ stone

/execute @e[name=ACV_lasers] ~ ~ ~ /setblock ~ ~ ~ redstone_block
Lasers_on_off }

Meg_on_off {
/setblock ~ ~4 ~ minecraft:standing_sign 8 replace {Text1:"Material",Text2:"Emancipation Grill",Text3:"{\"text\":\"on\",\"color\":\"dark_green\"}",Text4:"{\"text\":\"off\",\"color\":\"dark_red\"}"}

/execute @e[name=ACV_meg] ~ ~ ~ /setblock ~ ~ ~ stone

/execute @e[name=ACV_meg] ~ ~ ~ /setblock ~ ~ ~ redstone_block
Meg_on_off }

Custom_Cursor_() {
/setblock ~ ~6 ~ standing_sign 8 replace {Text1:"{\"text\":\"Custom Cursor \",\"color\":\"black\",\"extra\":[{\"text\":\"(\",\"color\":\"blue\",\"bold\":\"true\"},{\"text\":\")\",\"color\":\"gold\",\"bold\":\"true\"}]}",Text2:"{\"text\":\"on\",\"color\":\"dark_green\"}",Text3:"{\"text\":\"|\",\"color\":\"black\"}",Text4:"{\"text\":\"off\",\"color\":\"dark_red\"}"}


Custom_Cursor_() }

Equipment {
/setblock ~ ~4 ~ standing_sign 0 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"Equipment\",\"color\":\"dark_purple\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}

/give @p minecraft:bow 1 0 {Unbreakable:1,ench:[{id:48,lvl:6},{id:51,lvl:1}],HideFlags:5,display:{Name:"Blue Portalgun",Lore:["Makes blue Portals!"]}}
/give @p minecraft:bow 1 0 {Unbreakable:1,ench:[{id:48,lvl:7},{id:51,lvl:1}],HideFlags:5,display:{Name:"Orange Portalgun",Lore:["Doesn't make blue Portals!"]}}
/give @p minecraft:bow 1 0 {Unbreakable:1,ench:[{id:48,lvl:8},{id:51,lvl:1}],HideFlags:5,display:{Name:"Purple Portalgun",Lore:["Makes purple Portals!"]}}
/give @p minecraft:bow 1 0 {Unbreakable:1,ench:[{id:48,lvl:9},{id:51,lvl:1}],HideFlags:5,display:{Name:"Red Portalgun",Lore:["Makes red Portals!"]}}
/give @p minecraft:arrow 1 0 {display:{Name:"Picking up Cubes",Lore:["Hold this to pick up the closest Cube"]}}
/replaceitem entity @p slot.armor.feet minecraft:chainmail_boots 1 0 {Unbreakable:1,ench:[{id:2,lvl:1}],HideFlags:5,display:{Name:"Long Fall Boots",Lore:["No more Falldamage!"]}}
Equipment }

Delete_all_Portals {
/execute @e[name=ACV_remote_deleteAllPortals] ~ ~ ~ /setblock ~ ~ ~ redstone_block
Delete_all_Portals }

Kill_all_Cubes {
/kill @e[name=Weighted_Storage_Cube]
Kill_all_Cubes}

Spawn_normal_Cube {
/summon armor_stand ~ ~-0.6 ~1 {CustomName:"Weighted_Storage_Cube",DisabledSlots:2035728,ArmorItems:[{},{},{},{Damage:6,id:"stone",Count:1}],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:0b}
Spawn_normal_Cube}

Spawn_redirecting_Cube {
/summon armor_stand ~ ~-0.6 ~1 {CustomName:"Weighted_Storage_Cube",DisabledSlots:2035728,ArmorItems:[{},{},{},{id:"dispenser",Count:1}],Tags:["ACV_Redirecting"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:0b}
Spawn_redirecting_Cube}

Special_Thanks {
/setblock ~ ~7 ~ standing_sign 0 replace {Text1:"{\"text\":\"Special Thanks\",\"bold\":\"true\"}",Text2:"{\"text\":\"click on the \",\"extra\":[{\"text\":\"red\",\"color\":\"red\"}]}",Text3:"names for more",Text4:"information"}
/setblock ~ ~6 ~ wall_sign 3 replace {Text1:"{\"text\":\"Adrodoc55\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"Adrodoc55's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" YouTube-Channel by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"https://www.youtube.com/user/Adrodoc55\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"because I wanted\"}",Text4:"{\"text\":\"to thank myself\"}"}
/setblock ~ ~4 ~ wall_sign 3 replace {Text1:"{\"text\":\"The Farlanders\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"The Farlander's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" Video by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"http://youtu.be/jSiP51XKK1Q\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for the whole\"}",Text4:"{\"text\":\"Idea\"}"}
/setblock ~ ~4 ~ wall_sign 3 replace {Text1:"{\"text\":\"Dragnoz\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"Dragnoz's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" Video by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"http://youtu.be/J0ulXBtxQvo\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for floor and\"}",Text4:"{\"text\":\"ceiling Portals\"}"}
/setblock ~ ~4 ~ wall_sign 3 replace {Text1:"{\"text\":\"SimplySarc\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"SimplySarc's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" Video by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"http://youtu.be/O8dv9P49cKk\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for the\"}",Text4:"{\"text\":\"Chunk-Loader\"}"}
/setblock ~ ~4 ~ wall_sign 3 replace {Text1:"{\"text\":\"NanoRex\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"NanoRex's\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" Video by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"http://youtu.be/lyROYbzLCZ0\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for the Material\"}",Text4:"{\"text\":\"Emancipation Grid\"}"}
/setblock ~ ~-1 ~ wall_sign 3 replace {Text1:"{\"text\":\"Ersatz_\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @a {\\\"text\\\":\\\"\\\",\\\"extra\\\":[{\\\"text\\\":\\\"Check out \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"Ersatz_'s\\\",\\\"color\\\":\\\"gold\\\"},{\\\"text\\\":\\\" YouTube-Channel by clicking \\\",\\\"color\\\":\\\"yellow\\\"},{\\\"text\\\":\\\"here\\\",\\\"color\\\":\\\"aqua\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"https://www.youtube.com/channel/UClfq20CeYnZ2_Rm72VgUPXg\\\"}}]}\"}}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"for his\"}",Text4:"{\"text\":\"Contribution\"}"}
Special_Thanks }

Control_Panel }


