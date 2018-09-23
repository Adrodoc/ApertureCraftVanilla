summon area_effect_cloud ~ ~ ~ {Tags:[acv_rotated_marker],Duration:1}

execute if entity @s[tag=acv_ceiling] as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] at @s run teleport @s ~ ~ ~ ~ -90
#execute if entity @s[tag=acv_wall] as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] at @s run teleport @s ~ ~ ~ ~ 0
execute if entity @s[tag=acv_floor] as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] at @s run teleport @s ~ ~ ~ ~ 90
#execute if entity @s[tag=acv_south] as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] at @s run teleport @s ~ ~ ~ 0 ~
execute if entity @s[tag=acv_west] as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] at @s run teleport @s ~ ~ ~ 90 ~
execute if entity @s[tag=acv_north] as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] at @s run teleport @s ~ ~ ~ 180 ~
execute if entity @s[tag=acv_east] as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] at @s run teleport @s ~ ~ ~ 270 ~

execute rotated as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] positioned ^ ^ ^1 align xyz run summon area_effect_cloud ~.5 ~ ~.5 {Tags:[acv_portal,acv_inside],Duration:2147483647}
execute rotated as @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1] positioned ^ ^-1 ^1 align xyz run summon area_effect_cloud ~.5 ~ ~.5 {Tags:[acv_portal,acv_inside,acv_corner],Duration:2147483647}

kill @e[type=area_effect_cloud,tag=acv_rotated_marker,distance=..1]
