execute if entity @s[tag=acv_ceiling] align xyz run summon area_effect_cloud ~.5 ~1 ~.5 {Tags:[acv_portal_in,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_floor] align xyz run summon area_effect_cloud ~.5 ~-1 ~.5 {Tags:[acv_portal_in,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~ ~-.5 {Tags:[acv_portal_in,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~ ~.5 {Tags:[acv_portal_in,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~ ~1.5 {Tags:[acv_portal_in,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~ ~.5 {Tags:[acv_portal_in,acv_uncolored],Duration:2147483647}

# acv_portal_in corner
execute if entity @s[tag=acv_ceiling,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~1 ~-.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~1 ~.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~1 ~1.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~1 ~.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_floor,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-1 ~1.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_east] align xyz run summon area_effect_cloud ~-.5 ~-1 ~.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-1 ~-.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_west] align xyz run summon area_effect_cloud ~1.5 ~-1 ~.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}

execute if entity @s[tag=acv_wall,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-1 ~-.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~-1 ~.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-1 ~1.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~-1 ~.5 {Tags:[acv_portal_in,acv_corner,acv_uncolored],Duration:2147483647}
