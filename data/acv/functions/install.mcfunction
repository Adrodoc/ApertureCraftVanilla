function acv:force/install
function acv:motion/install

scoreboard objectives add acv_close_id dummy
scoreboard objectives add acv_delta dummy
scoreboard objectives add acv_opposite_id dummy
scoreboard objectives add acv_portal_id dummy
scoreboard objectives add acv_storage_id dummy
scoreboard objectives add acv_tmp dummy

scoreboard objectives add acv_constant dummy
scoreboard players set -1 acv_constant -1
scoreboard players set 2 acv_constant 2
scoreboard players set 4 acv_constant 4
scoreboard players set 8 acv_constant 8
scoreboard players set 16 acv_constant 16

team add acv_blue
team add acv_orange
team add acv_purple
team add acv_red
team modify acv_blue color aqua
team modify acv_orange color gold
team modify acv_purple color dark_blue
team modify acv_red color dark_red
