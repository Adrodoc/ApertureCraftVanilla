execute if entity @s[tag=acv_ceiling] align xyz run summon area_effect_cloud ~.5 ~ ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Rotation:[0f,90f],Duration:2147483647}
execute if entity @s[tag=acv_ceiling] align xyz run summon area_effect_cloud ~.5 ~1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_floor] align xyz run summon area_effect_cloud ~.5 ~ ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Rotation:[0f,-90f],Duration:2147483647}
execute if entity @s[tag=acv_floor] align xyz run summon area_effect_cloud ~.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Rotation:[180f,0f],Duration:2147483647}
execute if entity @s[tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-1 ~1.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Rotation:[0f,0f],Duration:2147483647}
execute if entity @s[tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-1 ~-.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_east] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Rotation:[90f,0f],Duration:2147483647}
execute if entity @s[tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_west] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Tags:[acv_uncolored],Rotation:[270f,0f],Duration:2147483647}
execute if entity @s[tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Tags:[acv_uncolored],Duration:2147483647}

scoreboard players operation @e[tag=acv_uncolored] acv_color = @s acv_color
tag @e[tag=acv_uncolored] remove acv_uncolored
