function acv:storage/load_transfer_chunk_if_neccessary

# refer to portal inside
scoreboard players operation @e[tag=acv_portal,tag=acv_inside] acv_color -= @s acv_color
execute at @e[tag=acv_portal,tag=acv_inside,tag=acv_corner,scores={acv_color=0}] run clone ~ ~ ~ ~ ~ ~ 0 1 0
execute at @e[tag=acv_portal,tag=acv_inside,tag=!acv_corner,scores={acv_color=0}] run clone ~ ~ ~ ~ ~ ~ 0 2 0
scoreboard players operation @e[tag=acv_portal,tag=acv_inside] acv_color += @s acv_color

scoreboard players operation @s acv_storage_id = @s acv_color
function acv:storage/store

execute if entity @e[tag=acv_portal,tag=acv_inside,scores={acv_color=1}] if entity @e[tag=acv_portal,tag=acv_inside,scores={acv_color=2}] at @e[tag=acv_portal,tag=acv_inside,scores={acv_color=1..2}] run setblock ~ ~ ~ moving_piston
execute if entity @e[tag=acv_portal,tag=acv_inside,scores={acv_color=3}] if entity @e[tag=acv_portal,tag=acv_inside,scores={acv_color=4}] at @e[tag=acv_portal,tag=acv_inside,scores={acv_color=3..4}] run setblock ~ ~ ~ moving_piston
