execute at @e[tag=acv_storage_root] run summon area_effect_cloud ~ ~ ~ {Tags:[acv_storage,acv_new],Duration:2147483647}
scoreboard players operation @e[tag=acv_storage,tag=acv_new] acv_storage_id = @s acv_storage_id
execute as @e[tag=acv_storage,tag=acv_new] run function acv:storage/init_marker
