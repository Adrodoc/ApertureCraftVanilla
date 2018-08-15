# for y use at most ~-.8 to be able to exit a ceiling portal
execute if entity @s[tag=acv_ceiling,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-.8 ~-.5 {Rotation:[0f,90f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~-.8 ~.5 {Rotation:[90f,90f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-.8 ~1.5 {Rotation:[180f,90f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_ceiling,tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~-.8 ~.5 {Rotation:[270f,90f],Tags:[acv_portal,acv_outside],Duration:2147483647}

# for y use at least ~.7685 to be able to exit a floor portal by walking and at least ~1.1452 to exit a floor portal diagonally by walking
execute if entity @s[tag=acv_floor,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~.7685 ~1.5 {Rotation:[0f,-90f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_east] align xyz run summon area_effect_cloud ~-.5 ~.7685 ~.5 {Rotation:[90f,-90f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~.7685 ~-.5 {Rotation:[180f,-90f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_floor,tag=acv_west] align xyz run summon area_effect_cloud ~1.5 ~.7685 ~.5 {Rotation:[270f,-90f],Tags:[acv_portal,acv_outside],Duration:2147483647}

# for y use at least ~.9375 to be able to exit a wall portal with carpet in front of it
execute if entity @s[tag=acv_wall,tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {Rotation:[0f,0f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_east] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {Rotation:[90f,0f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {Rotation:[180f,0f],Tags:[acv_portal,acv_outside],Duration:2147483647}
execute if entity @s[tag=acv_wall,tag=acv_west] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {Rotation:[270f,0f],Tags:[acv_portal,acv_outside],Duration:2147483647}
