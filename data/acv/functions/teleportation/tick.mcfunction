scoreboard players reset @e[scores={acv_origin_color=0..}] acv_origin_color
execute as @e[type=area_effect_cloud,tag=acv_portal,tag=acv_inside] at @s align xyz run scoreboard players operation @e[tag=!acv_portal,dy=0] acv_origin_color = @s acv_color
execute as @e[scores={acv_origin_color=0..}] run function acv:teleportation/teleport
