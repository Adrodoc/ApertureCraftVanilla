scoreboard players operation @e[tag=acv_storage] acv_storage_id -= @s acv_storage_id
execute unless entity @e[tag=acv_storage,scores={acv_storage_id=0}] run function acv:storage/create_marker
scoreboard players operation @e[tag=acv_storage,tag=!acv_new] acv_storage_id += @s acv_storage_id
tag @e[tag=acv_storage,tag=acv_new] remove acv_new
