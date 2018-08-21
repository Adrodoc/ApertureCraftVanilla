function acv:storage/load_transfer_chunk_if_neccessary

# refer to portal inside
scoreboard players operation @e[tag=acv_portal,tag=acv_inside] acv_portal_id -= @s acv_portal_id
execute at @e[tag=acv_portal,tag=acv_inside,tag=acv_corner,scores={acv_portal_id=0}] run clone ~ ~ ~ ~ ~ ~ 0 1 0
execute at @e[tag=acv_portal,tag=acv_inside,tag=!acv_corner,scores={acv_portal_id=0}] run clone ~ ~ ~ ~ ~ ~ 0 2 0
scoreboard players operation @e[tag=acv_portal,tag=acv_inside] acv_portal_id += @s acv_portal_id

scoreboard players operation @s acv_storage_id = @s acv_portal_id
function acv:storage/save

function acv:portal/get_opposite_id
scoreboard players operation @s acv_tmp = @s acv_portal_id
scoreboard players operation @s acv_tmp < @s acv_opposite_id

scoreboard players operation @e[tag=acv_portal,tag=acv_inside] acv_portal_id -= @s acv_tmp
execute if entity @e[tag=acv_portal,tag=acv_inside,scores={acv_portal_id=0}] if entity @e[tag=acv_portal,tag=acv_inside,scores={acv_portal_id=1}] at @e[tag=acv_portal,tag=acv_inside,scores={acv_portal_id=0..1}] run function acv:portal/open_inside
scoreboard players operation @e[tag=acv_portal,tag=acv_inside] acv_portal_id += @s acv_tmp
