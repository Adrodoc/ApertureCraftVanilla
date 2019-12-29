scoreboard players reset @s test2
function acv:raycast/raycast
# execute as @e[tag=acv_pos,type=area_effect_cloud,limit=1] at @s run teleport @s ~ ~ ~-1
execute as @e[tag=acv_pos,type=area_effect_cloud,limit=1] at @s run function acv:tmp_
