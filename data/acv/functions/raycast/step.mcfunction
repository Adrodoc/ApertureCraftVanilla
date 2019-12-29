execute if score @s acv_delta_x matches 1.. run function acv:raycast/min_pos_x
execute if score @s acv_delta_x matches ..0 run function acv:raycast/max_pos_x
execute if score @s acv_delta_y matches 1.. run function acv:raycast/min_pos_y
execute if score @s acv_delta_y matches ..0 run function acv:raycast/max_pos_y
execute if score @s acv_delta_z matches 1.. run function acv:raycast/min_pos_z
execute if score @s acv_delta_z matches ..0 run function acv:raycast/max_pos_z

execute if score @s acv_pos_x = @s acv_x_pos_x if score @s acv_pos_y = @s acv_x_pos_y if score @s acv_pos_z = @s acv_x_pos_z run scoreboard players set @s acv_axis 0
execute if score @s acv_pos_x = @s acv_y_pos_x if score @s acv_pos_y = @s acv_y_pos_y if score @s acv_pos_z = @s acv_y_pos_z run scoreboard players set @s acv_axis 1
execute if score @s acv_pos_x = @s acv_z_pos_x if score @s acv_pos_y = @s acv_z_pos_y if score @s acv_pos_z = @s acv_z_pos_z run scoreboard players set @s acv_axis 2

execute store result entity @e[tag=acv_pos,type=area_effect_cloud,limit=1] Pos[0] double 0.001 run scoreboard players get @s acv_pos_x
execute store result entity @e[tag=acv_pos,type=area_effect_cloud,limit=1] Pos[1] double 0.001 run scoreboard players get @s acv_pos_y
execute store result entity @e[tag=acv_pos,type=area_effect_cloud,limit=1] Pos[2] double 0.001 run scoreboard players get @s acv_pos_z
# execute at @e[tag=acv_pos,type=area_effect_cloud,limit=1] run particle dust 0 0 0 1

execute if score @s acv_axis matches 0 if score @s acv_delta_x matches 1.. at @e[tag=acv_pos,type=area_effect_cloud,limit=1] run function acv:raycast/check_block
execute if score @s acv_axis matches 0 if score @s acv_delta_x matches ..-1 at @e[tag=acv_pos,type=area_effect_cloud,limit=1] positioned ~-1 ~ ~ run function acv:raycast/check_block
execute if score @s acv_axis matches 1 if score @s acv_delta_y matches 1.. at @e[tag=acv_pos,type=area_effect_cloud,limit=1] run function acv:raycast/check_block
execute if score @s acv_axis matches 1 if score @s acv_delta_y matches ..-1 at @e[tag=acv_pos,type=area_effect_cloud,limit=1] positioned ~ ~-1 ~ run function acv:raycast/check_block
execute if score @s acv_axis matches 2 if score @s acv_delta_z matches 1.. at @e[tag=acv_pos,type=area_effect_cloud,limit=1] run function acv:raycast/check_block
execute if score @s acv_axis matches 2 if score @s acv_delta_z matches ..-1 at @e[tag=acv_pos,type=area_effect_cloud,limit=1] positioned ~ ~ ~-1 run function acv:raycast/check_block
