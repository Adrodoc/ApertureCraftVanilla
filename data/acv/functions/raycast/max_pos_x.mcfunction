scoreboard players set @s acv_pos_x -2147483648
execute unless score @s acv_delta_x matches 0 run scoreboard players operation @s acv_pos_x > @s acv_x_pos_x
execute unless score @s acv_delta_y matches 0 run scoreboard players operation @s acv_pos_x > @s acv_y_pos_x
execute unless score @s acv_delta_z matches 0 run scoreboard players operation @s acv_pos_x > @s acv_z_pos_x
