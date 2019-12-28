scoreboard players operation @s acv_x_pos_x += @s acv_step_x

scoreboard players operation @s acv_x_pos_y = @s acv_x_pos_x
scoreboard players operation @s acv_x_pos_y -= @s acv_origin_x
scoreboard players operation @s acv_x_pos_y *= @s acv_delta_y
scoreboard players operation @s acv_x_pos_y /= @s acv_delta_x
scoreboard players operation @s acv_x_pos_y += @s acv_origin_y

scoreboard players operation @s acv_x_pos_z = @s acv_x_pos_x
scoreboard players operation @s acv_x_pos_z -= @s acv_origin_x
scoreboard players operation @s acv_x_pos_z *= @s acv_delta_z
scoreboard players operation @s acv_x_pos_z /= @s acv_delta_x
scoreboard players operation @s acv_x_pos_z += @s acv_origin_z
