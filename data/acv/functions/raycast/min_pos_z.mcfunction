scoreboard players set @s acv_pos_z 2147483647
execute unless score @s acv_delta_x matches 0 run scoreboard players operation @s acv_pos_z < @s acv_x_pos_z
execute unless score @s acv_delta_y matches 0 run scoreboard players operation @s acv_pos_z < @s acv_y_pos_z
execute unless score @s acv_delta_z matches 0 run scoreboard players operation @s acv_pos_z < @s acv_z_pos_z
