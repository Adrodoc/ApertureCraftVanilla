scoreboard players operation @s acv_storage_id = @s acv_close_id
function acv:storage/load

# refer to portal inside
scoreboard players operation @e[tag=acv_portal,tag=acv_inside] acv_portal_id -= @s acv_close_id
execute at @e[tag=acv_portal,tag=acv_inside,tag=acv_corner,scores={acv_portal_id=0}] run clone 0 1 0 0 1 0 ~ ~ ~
execute at @e[tag=acv_portal,tag=acv_inside,tag=!acv_corner,scores={acv_portal_id=0}] run clone 0 2 0 0 2 0 ~ ~ ~
execute at @e[tag=acv_portal,tag=acv_inside,scores={acv_portal_id=0}] run kill @e[type=falling_block,tag=acv_portal,dy=0]
scoreboard players operation @e[tag=acv_portal,tag=acv_inside] acv_portal_id += @s acv_close_id
