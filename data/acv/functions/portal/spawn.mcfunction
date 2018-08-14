# acv_portal_out
execute if entity @s[tag=acv_ceiling] align xyz run summon area_effect_cloud ~.5 ~-1 ~.5 {Tags:[acv_portal_out,acv_uncolored],Rotation:[0f,90f],Duration:2147483647}
execute if entity @s[tag=acv_floor] align xyz run summon area_effect_cloud ~.5 ~.5 ~.5 {Tags:[acv_portal_out,acv_uncolored],Rotation:[0f,-90f],Duration:2147483647}
execute if entity @s[tag=acv_wall] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {Tags:[acv_portal_out,acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_east] as @e[type=area_effect_cloud,tag=acv_portal_out,tag=acv_uncolored] at @s run teleport @s ~ ~ ~ ~90 ~
execute if entity @s[tag=acv_south] as @e[type=area_effect_cloud,tag=acv_portal_out,tag=acv_uncolored] at @s run teleport @s ~ ~ ~ ~180 ~
execute if entity @s[tag=acv_west] as @e[type=area_effect_cloud,tag=acv_portal_out,tag=acv_uncolored] at @s run teleport @s ~ ~ ~ ~270 ~
