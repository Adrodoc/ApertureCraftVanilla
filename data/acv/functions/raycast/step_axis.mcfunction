# execute at @e[tag=acv_pos,type=area_effect_cloud,limit=1] run setblock ~ ~ ~ light_gray_stained_glass
execute if score @s acv_axis matches 0 run function acv:raycast/step_x
execute if score @s acv_axis matches 1 run function acv:raycast/step_y
execute if score @s acv_axis matches 2 run function acv:raycast/step_z
