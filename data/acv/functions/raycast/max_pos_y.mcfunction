scoreboard players set @s acv_pos_y -2147483648
execute unless score @s acv_delta_x matches 0 run scoreboard players operation @s acv_pos_y > @s acv_x_pos_y
execute unless score @s acv_delta_y matches 0 run scoreboard players operation @s acv_pos_y > @s acv_y_pos_y
execute unless score @s acv_delta_z matches 0 run scoreboard players operation @s acv_pos_y > @s acv_z_pos_y
