scoreboard players reset @e[tag=!acv_portal,scores={acv_portal_id=1..}] acv_portal_id
execute as @e[type=area_effect_cloud,tag=acv_portal,tag=acv_inside] at @s align xyz run scoreboard players operation @e[tag=!acv_portal,dy=0] acv_portal_id = @s acv_portal_id
execute as @e[tag=!acv_portal,scores={acv_portal_id=1..}] run function acv:teleportation/teleport
