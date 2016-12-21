// Setup
include "ACV_setupScoreboards.mpl"
include "ACV_deleteScoreboards.mpl"

// Main
include "ACV_portals.mpl"

// Remote
include "ACV_remote_deletePortals.mpl"
include "ACV_remote_deleteAllPortals.mpl"
include "ACV_remote_createPortals.mpl"

// Extra
include "ACV_confirmBlockOption.mpl"
include "ACV_teleportation.mpl"
include "ACV_smoothTeleportation.mpl"
include "ACV_lightBridges.mpl"
include "ACV_antiBridges.mpl"
include "ACV_cubes.mpl"
include "ACV_lasers.mpl"
include "ACV_megs.mpl"
include "ACV_gels.mpl"

project ACV {
  orientation "zyx"
}

install {
/gamerule commandBlockOutput false
/gamerule logAdminCommands false
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"red","extra":[{"text":"Starting Installation","color":"yellow"}]}

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Scoreboards","color":"yellow"}]}
ACV_setupScoreboards()
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Enabling UI","color":"yellow"}]}
/fill ${origin + (9 1 -7)} ${origin + (15 3 -6)} lever 12 replace barrier
/fill ${origin + (9 1 -6)} ${origin + (15 3 -5)} stained_hardened_clay 10 replace redstone_block 0
/blockdata ${origin + (7 2 -14)} {Command:"/setblock ~-7 ~-1 ~14 redstone_block"}
/setblock ${origin + (7 3 -12)} wall_sign 3 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"[Uninstall]\",\"color\":\"dark_green\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}
/fill ${origin + (6 1 -13)} ${origin + (9 3 -13)} stained_hardened_clay 13 replace stained_hardened_clay 14

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Block-Option","color":"yellow"}]}
ACV_confirmBlockOption()
}



uninstall {
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"red","extra":[{"text":"Starting Uninstallation","color":"yellow"}]}

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Portals","color":"yellow"}]}
ACV_remote_deleteAllPortals()

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Disabling UI","color":"yellow"}]}
/fill ${origin + (9 1 -7)} ${origin + (15 3 -6)} barrier 0 replace lever
/fill ${origin + (9 1 -6)} ${origin + (15 3 -5)} redstone_block 0 replace stained_hardened_clay 10
/blockdata ${origin + (7 2 -14)} {Command:"/setblock ~-7 ~-2 ~14 redstone_block"}
/setblock ${origin + (7 3 -12)} wall_sign 3 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"[Install]\",\"color\":\"dark_red\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}
/fill ${origin + (6 1 -13)} ${origin + (9 3 -13)} stained_hardened_clay 14 replace stained_hardened_clay 13

///tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Interrupt all Interface calls","color":"yellow"}]}
///execute @e[tag=ACV_remote_interface] ~ ~ ~ /setblock ~ ~ ~ stone
///execute @e[tag=ACV_internal_interface] ~ ~ ~ /setblock ~ ~ ~ stone

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Scoreboards","color":"yellow"}]}
ACV_deleteScoreboards()

// 2 tick delay
/setblock ${this+1} redstone_block
skip
impulse: /setblock ${this-1} stone
/setblock ${this+1} redstone_block
skip
impulse: /setblock ${this-1} stone
// 2 tick delay end

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Interfaces","color":"yellow"}]}
}
