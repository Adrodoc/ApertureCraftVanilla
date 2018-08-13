scoreboard players reset @e[scores={acv_origin_color=0..}] acv_origin_color
execute as @e[type=area_effect_cloud,name=acv_portal_in] at @s align xyz run scoreboard players operation @e[name=!acv_portal_in,dy=0] acv_origin_color = @s acv_color
execute as @e[scores={acv_origin_color=0..}] run function acv:teleportation/teleport
