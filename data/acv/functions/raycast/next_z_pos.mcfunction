scoreboard players operation @s acv_z_pos_z += @s acv_step_z

scoreboard players operation @s acv_z_pos_x = @s acv_z_pos_z
scoreboard players operation @s acv_z_pos_x -= @s acv_origin_z
scoreboard players operation @s acv_z_pos_x *= @s acv_delta_x
scoreboard players operation @s acv_z_pos_x /= @s acv_delta_z
scoreboard players operation @s acv_z_pos_x += @s acv_origin_x

scoreboard players operation @s acv_z_pos_y = @s acv_z_pos_z
scoreboard players operation @s acv_z_pos_y -= @s acv_origin_z
scoreboard players operation @s acv_z_pos_y *= @s acv_delta_y
scoreboard players operation @s acv_z_pos_y /= @s acv_delta_z
scoreboard players operation @s acv_z_pos_y += @s acv_origin_y
