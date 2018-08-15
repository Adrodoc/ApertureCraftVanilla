scoreboard players operation @s acv_storage_id = @s acv_color
function acv:storage/load

# refer to acv_portal_in
scoreboard players operation @e[tag=acv_portal_in] acv_color -= @s acv_color
execute at @e[tag=acv_portal_in,tag=acv_corner,scores={acv_color=0}] run clone 0 1 0 0 1 0 ~ ~ ~
execute at @e[tag=acv_portal_in,tag=!acv_corner,scores={acv_color=0}] run clone 0 2 0 0 2 0 ~ ~ ~
scoreboard players operation @e[tag=acv_portal_in] acv_color += @s acv_color
