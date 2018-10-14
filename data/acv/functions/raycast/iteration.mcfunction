execute if block ~ ~ ~ air if entity @s[distance=..50] positioned ^ ^ ^.1 run function acv:raycast/iteration
execute unless block ~ ~ ~ air run summon area_effect_cloud ~ ~ ~ {Tags:[acv_raycast],Duration:2147483647}
