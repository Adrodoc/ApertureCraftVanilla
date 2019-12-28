execute anchored eyes run summon area_effect_cloud ^ ^ ^ {Tags:[acv_origin],Duration:1}
execute store result score @s acv_origin_x run data get entity @e[tag=acv_origin,type=area_effect_cloud,limit=1,distance=..2] Pos[0] 1000
execute store result score @s acv_origin_y run data get entity @e[tag=acv_origin,type=area_effect_cloud,limit=1,distance=..2] Pos[1] 1000
execute store result score @s acv_origin_z run data get entity @e[tag=acv_origin,type=area_effect_cloud,limit=1,distance=..2] Pos[2] 1000
kill @e[tag=acv_origin,type=area_effect_cloud]

scoreboard players operation @s acv_delta_x = @s acv_target_x
scoreboard players operation @s acv_delta_y = @s acv_target_y
scoreboard players operation @s acv_delta_z = @s acv_target_z

execute anchored eyes run summon area_effect_cloud ^ ^ ^1 {Tags:[acv_target],Duration:1}
execute store result score @s acv_target_x run data get entity @e[tag=acv_target,type=area_effect_cloud,limit=1,distance=..3] Pos[0] 1000
execute store result score @s acv_target_y run data get entity @e[tag=acv_target,type=area_effect_cloud,limit=1,distance=..3] Pos[1] 1000
execute store result score @s acv_target_z run data get entity @e[tag=acv_target,type=area_effect_cloud,limit=1,distance=..3] Pos[2] 1000
kill @e[tag=acv_target,type=area_effect_cloud]

scoreboard players operation @s acv_delta_x -= @s acv_origin_x
scoreboard players operation @s acv_delta_y -= @s acv_origin_y
scoreboard players operation @s acv_delta_z -= @s acv_origin_z

scoreboard players operation @s acv_x_pos_x = @s acv_origin_x
scoreboard players operation @s acv_x_pos_x /= 1000 acv_constant
scoreboard players operation @s acv_x_pos_x *= 1000 acv_constant
scoreboard players set @s acv_step_x 0
execute if score @s acv_delta_x matches 1.. run scoreboard players set @s acv_step_x 1000
function acv:raycast/next_x_pos
execute if score @s acv_delta_x matches ..-1 run scoreboard players set @s acv_step_x -1000

scoreboard players operation @s acv_y_pos_y = @s acv_origin_y
scoreboard players operation @s acv_y_pos_y /= 1000 acv_constant
scoreboard players operation @s acv_y_pos_y *= 1000 acv_constant
scoreboard players set @s acv_step_y 0
execute if score @s acv_delta_y matches 1.. run scoreboard players set @s acv_step_y 1000
function acv:raycast/next_y_pos
execute if score @s acv_delta_y matches ..-1 run scoreboard players set @s acv_step_y -1000

scoreboard players operation @s acv_z_pos_z = @s acv_origin_z
scoreboard players operation @s acv_z_pos_z /= 1000 acv_constant
scoreboard players operation @s acv_z_pos_z *= 1000 acv_constant
scoreboard players set @s acv_step_z 0
execute if score @s acv_delta_z matches 1.. run scoreboard players set @s acv_step_z 1000
function acv:raycast/next_z_pos
execute if score @s acv_delta_z matches ..-1 run scoreboard players set @s acv_step_z -1000

# function acv:raycast/next_x_pos
# function acv:raycast/next_y_pos
# function acv:raycast/next_z_pos

execute if score @s acv_delta_x matches 1.. run scoreboard players set @s acv_pos_x 2147483647
execute if score @s acv_delta_x matches ..0 run scoreboard players set @s acv_pos_x -2147483648
execute if score @s acv_delta_y matches 1.. run scoreboard players set @s acv_pos_y 2147483647
execute if score @s acv_delta_y matches ..0 run scoreboard players set @s acv_pos_y -2147483648
execute if score @s acv_delta_z matches 1.. run scoreboard players set @s acv_pos_z 2147483647
execute if score @s acv_delta_z matches ..0 run scoreboard players set @s acv_pos_z -2147483648

execute unless score @s acv_delta_x matches 0 if score @s acv_delta_x matches 1.. run scoreboard players operation @s acv_pos_x < @s acv_x_pos_x
execute unless score @s acv_delta_x matches 0 if score @s acv_delta_y matches 1.. run scoreboard players operation @s acv_pos_y < @s acv_x_pos_y
execute unless score @s acv_delta_x matches 0 if score @s acv_delta_z matches 1.. run scoreboard players operation @s acv_pos_z < @s acv_x_pos_z
execute unless score @s acv_delta_x matches 0 if score @s acv_delta_x matches ..0 run scoreboard players operation @s acv_pos_x > @s acv_x_pos_x
execute unless score @s acv_delta_x matches 0 if score @s acv_delta_y matches ..0 run scoreboard players operation @s acv_pos_y > @s acv_x_pos_y
execute unless score @s acv_delta_x matches 0 if score @s acv_delta_z matches ..0 run scoreboard players operation @s acv_pos_z > @s acv_x_pos_z

execute unless score @s acv_delta_y matches 0 if score @s acv_delta_x matches 1.. run scoreboard players operation @s acv_pos_x < @s acv_y_pos_x
execute unless score @s acv_delta_y matches 0 if score @s acv_delta_y matches 1.. run scoreboard players operation @s acv_pos_y < @s acv_y_pos_y
execute unless score @s acv_delta_y matches 0 if score @s acv_delta_z matches 1.. run scoreboard players operation @s acv_pos_z < @s acv_y_pos_z
execute unless score @s acv_delta_y matches 0 if score @s acv_delta_x matches ..0 run scoreboard players operation @s acv_pos_x > @s acv_y_pos_x
execute unless score @s acv_delta_y matches 0 if score @s acv_delta_y matches ..0 run scoreboard players operation @s acv_pos_y > @s acv_y_pos_y
execute unless score @s acv_delta_y matches 0 if score @s acv_delta_z matches ..0 run scoreboard players operation @s acv_pos_z > @s acv_y_pos_z

execute unless score @s acv_delta_z matches 0 if score @s acv_delta_x matches 1.. run scoreboard players operation @s acv_pos_x < @s acv_z_pos_x
execute unless score @s acv_delta_z matches 0 if score @s acv_delta_y matches 1.. run scoreboard players operation @s acv_pos_y < @s acv_z_pos_y
execute unless score @s acv_delta_z matches 0 if score @s acv_delta_z matches 1.. run scoreboard players operation @s acv_pos_z < @s acv_z_pos_z
execute unless score @s acv_delta_z matches 0 if score @s acv_delta_x matches ..0 run scoreboard players operation @s acv_pos_x > @s acv_z_pos_x
execute unless score @s acv_delta_z matches 0 if score @s acv_delta_y matches ..0 run scoreboard players operation @s acv_pos_y > @s acv_z_pos_y
execute unless score @s acv_delta_z matches 0 if score @s acv_delta_z matches ..0 run scoreboard players operation @s acv_pos_z > @s acv_z_pos_z

execute if score @s acv_pos_x = @s acv_x_pos_x if score @s acv_pos_y = @s acv_x_pos_y if score @s acv_pos_z = @s acv_x_pos_z run scoreboard players set @s acv_axis 0
execute if score @s acv_pos_x = @s acv_y_pos_x if score @s acv_pos_y = @s acv_y_pos_y if score @s acv_pos_z = @s acv_y_pos_z run scoreboard players set @s acv_axis 1
execute if score @s acv_pos_x = @s acv_z_pos_x if score @s acv_pos_y = @s acv_z_pos_y if score @s acv_pos_z = @s acv_z_pos_z run scoreboard players set @s acv_axis 2

# tellraw @a [{"text":"\nacv_axis: "},{"score":{"name":"@s","objective":"acv_axis"}},{"text":"\nacv_pos_y: "},{"score":{"name":"@s","objective":"acv_pos_y"}},{"text":"\nacv_z_pos_y: "},{"score":{"name":"@s","objective":"acv_z_pos_y"}}]

summon area_effect_cloud ~ ~ ~ {Tags:[acv_pos],Duration:1}
execute store result entity @e[tag=acv_pos,type=area_effect_cloud,limit=1] Pos[0] double 0.001 run scoreboard players get @s acv_pos_x
execute store result entity @e[tag=acv_pos,type=area_effect_cloud,limit=1] Pos[1] double 0.001 run scoreboard players get @s acv_pos_y
execute store result entity @e[tag=acv_pos,type=area_effect_cloud,limit=1] Pos[2] double 0.001 run scoreboard players get @s acv_pos_z
execute at @e[tag=acv_pos,type=area_effect_cloud,limit=1] run particle dust 0 0 0 1
kill @e[tag=acv_pos,type=area_effect_cloud]
