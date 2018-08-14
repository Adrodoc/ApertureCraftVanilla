# acv_portal_out
execute if entity @s[tag=acv_ceiling] align xyz run summon area_effect_cloud ~.5 ~-1 ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Rotation:[0f,90f],Duration:2147483647}
execute if entity @s[tag=acv_floor] align xyz run summon area_effect_cloud ~.5 ~.5 ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Rotation:[0f,-90f],Duration:2147483647}
execute if entity @s[tag=acv_wall] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_east] as @e[type=area_effect_cloud,name=acv_portal_out,tag=acv_uncolored] at @s run teleport @s ~ ~ ~ ~90 ~
execute if entity @s[tag=acv_south] as @e[type=area_effect_cloud,name=acv_portal_out,tag=acv_uncolored] at @s run teleport @s ~ ~ ~ ~180 ~
execute if entity @s[tag=acv_west] as @e[type=area_effect_cloud,name=acv_portal_out,tag=acv_uncolored] at @s run teleport @s ~ ~ ~ ~270 ~

# acv_portal_in
execute if entity @s[tag=acv_ceiling] align xyz run summon area_effect_cloud ~.5 ~1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_floor] align xyz run summon area_effect_cloud ~.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~ ~-.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~ ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~ ~1.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~ ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}

# acv_portal_in corner
execute if entity @s[tag=acv_ceiling,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~1 ~-.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~1 ~1.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_floor,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-1 ~1.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_east] align xyz run summon area_effect_cloud ~-.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-1 ~-.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_west] align xyz run summon area_effect_cloud ~1.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_wall,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-1 ~-.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-1 ~1.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_corner,acv_uncolored],Duration:2147483647}

scoreboard players operation @e[tag=acv_uncolored] acv_color = @s acv_color
tag @e[tag=acv_uncolored] remove acv_uncolored
