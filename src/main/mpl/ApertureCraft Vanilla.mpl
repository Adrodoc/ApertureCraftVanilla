project ACV (

orientation "zyx"

# Setup
include "ACV_setupScoreboards.mpl"
include "ACV_deleteScoreboards.mpl"

# Main
include "ACV_online.mpl"

# Remote
include "ACV_remote_deletePortals.mpl"
include "ACV_remote_deleteAllPortals.mpl"
include "ACV_remote_createPortal.mpl"

# Extra
include "ACV_teleportation.mpl"
include "ACV_smoothTeleportation.mpl"
include "ACV_lightBridges.mpl"
include "ACV_antiBridges.mpl"
include "ACV_cubes.mpl"
include "ACV_lasers.mpl"
include "ACV_meg.mpl"
include "ACV_gels.mpl"
)

install (
/gamerule commandBlockOutput false
/gamerule logAdminCommands false
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"red","extra":[{"text":"Starting Installation","color":"yellow"}]}

/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Scoreboards","color":"yellow"}]}
start ACV_setupScoreboards
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Enabling UI","color":"yellow"}]}
/fill ${origin + (9 1 -8)} ${origin + (15 3 -7)} lever 12 replace barrier
/fill ${origin + (9 1 -7)} ${origin + (15 3 -6)} stained_hardened_clay 10 replace redstone_block 0
/blockdata ${origin + (7 2 -15)} {Command:"/setblock ~-7 ~ ~9 redstone_block"}
/setblock ${origin + (7 3 -13)} wall_sign 3 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"[Uninstall]\",\"color\":\"dark_green\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}
/fill ${origin + (6 1 -14)} ${origin + (9 3 -14)} stained_hardened_clay 13 replace stained_hardened_clay 14
/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Block-Option","color":"yellow"}]}
/setblock ${origin + (6 4 -5)} redstone_block
/setblock ${origin + (6 4 -5)} stone
)



#Install {
#/setblock ~ ~ ~-1 stone
#/gamerule commandBlockOutput false
#/gamerule logAdminCommands false
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"red","extra":[{"text":"Starting Installation","color":"yellow"}]}
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Interfaces","color":"yellow"}]}
#/setblock ~-1 ~ ~3 redstone_block
#/setblock ~ ~1 ~ stone
#
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Scoreboards","color":"yellow"}]}
#/execute @e[name=ACV_setupScoreboards] ~ ~ ~ /setblock ~ ~ ~ redstone_block
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Enabling UI","color":"yellow"}]}
#/fill ~7 ~ ~-3 ~13 ~2 ~-2 lever 12 replace barrier
#/fill ~6 ~ ~-2 ~12 ~2 ~-1 stained_hardened_clay 10 replace redstone_block 0
#/blockdata ~4 ~1 ~-11 {Command:"/setblock ~-7 ~ ~9 redstone_block"}
#/setblock ~4 ~2 ~-10 wall_sign 3 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"[Uninstall]\",\"color\":\"dark_green\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}
#/fill ~3 ~ ~-12 ~5 ~2 ~-12 stained_hardened_clay 13 replace stained_hardened_clay 14
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Setting up Block-Option","color":"yellow"}]}
#/setblock ~ ~ ~-1 redstone_block
#/setblock ~ ~1 ~ stone
#Install }
#
#Uninstall {
#/setblock ~ ~ ~-1 stone
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"red","extra":[{"text":"Starting Uninstallation","color":"yellow"}]}
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Portals","color":"yellow"}]}
#/execute @e[name=ACV_remote_deleteAllPortals] ~ ~ ~ /setblock ~ ~ ~ redstone_block
#/setblock ~1 ~1 ~1 redstone_block
#/setblock ~ ~-1 ~ stone
#
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Disabling UI","color":"yellow"}]}
#/fill ~7 ~-1 ~-4 ~13 ~1 ~-3 barrier 0 replace lever
#/fill ~7 ~-1 ~-4 ~13 ~1 ~-3 redstone_block 0 replace stained_hardened_clay 10
#/blockdata ~5 ~ ~-13 {Command:"/setblock ~-7 ~-1 ~9 redstone_block"}
#/setblock ~4 ~1 ~-11 wall_sign 3 replace {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"[Install]\",\"color\":\"dark_red\",\"bold\":\"true\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"}
#/fill ~3 ~-1 ~-11 ~5 ~1 ~-11 stained_hardened_clay 14 replace stained_hardened_clay 13
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Interrupt all Interface calls","color":"yellow"}]}
#/execute @e[tag=ACV_remote_interface] ~ ~ ~ /setblock ~ ~ ~ stone
#/execute @e[tag=ACV_internal_interface] ~ ~ ~ /setblock ~ ~ ~ stone
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Scoreboards","color":"yellow"}]}
#/execute @e[name=ACV_deleteScoreboards] ~ ~ ~ /setblock ~ ~ ~ redstone_block
#/setblock ~1 ~ ~ redstone_block
#/setblock ~ ~1 ~ stone
#/setblock ~1 ~ ~1 redstone_block
#/setblock ~ ~1 ~ stone
#/tellraw @a {"text":"[ApertureCraft Vanilla] ","color":"gold","extra":[{"text":"Deleting Interfaces","color":"yellow"}]}
#/setblock ~-7 ~-1 ~3 redstone_block
#Uninstall }



