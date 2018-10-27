kill @e[type=area_effect_cloud,tag=acv_raycast]
execute anchored eyes positioned ^ ^ ^ anchored feet run function acv:raycast/iteration

execute store result score @s acv_pos_x run data get entity @s Pos[0] 10000
execute store result score @s acv_pos_y run data get entity @s Pos[1] 10000
scoreboard players add @s acv_pos_y 16200
execute store result score @s acv_pos_z run data get entity @s Pos[2] 10000

execute store result score @s acv_ray_x run data get entity @e[type=area_effect_cloud,tag=acv_raycast,limit=1] Pos[0] 10000
execute store result score @s acv_ray_y run data get entity @e[type=area_effect_cloud,tag=acv_raycast,limit=1] Pos[1] 10000
execute store result score @s acv_ray_z run data get entity @e[type=area_effect_cloud,tag=acv_raycast,limit=1] Pos[2] 10000
scoreboard players operation @s acv_corner_x = @s acv_ray_x
scoreboard players operation @s acv_corner_y = @s acv_ray_y
scoreboard players operation @s acv_corner_z = @s acv_ray_z
scoreboard players operation @s acv_corner_x %= 10000 acv_constant
scoreboard players operation @s acv_corner_y %= 10000 acv_constant
scoreboard players operation @s acv_corner_z %= 10000 acv_constant
scoreboard players operation @s acv_ray_x -= @s acv_pos_x
scoreboard players operation @s acv_ray_y -= @s acv_pos_y
scoreboard players operation @s acv_ray_z -= @s acv_pos_z
execute if score @s acv_ray_x matches ..0 run scoreboard players remove @s acv_corner_x 10000
execute if score @s acv_ray_y matches ..0 run scoreboard players remove @s acv_corner_y 10000
execute if score @s acv_ray_z matches ..0 run scoreboard players remove @s acv_corner_z 10000

# acv_pos is the coordinate from which the ray was cast
# acv_ray is the vector from acv_pos to the ray target coordinate
# acv_corner is the vector from the closest block corner to the ray target coordinate

scoreboard players set @s acv_blockface_x 1
scoreboard players set @s acv_blockface_y 1
scoreboard players set @s acv_blockface_z 1
scoreboard players operation @s[scores={acv_ray_x=..0}] acv_blockface_x *= -1 acv_constant
scoreboard players operation @s[scores={acv_ray_y=..0}] acv_blockface_y *= -1 acv_constant
scoreboard players operation @s[scores={acv_ray_z=..0}] acv_blockface_z *= -1 acv_constant

scoreboard players operation @s[scores={acv_ray_x=..0}] acv_ray_x *= -1 acv_constant
scoreboard players operation @s[scores={acv_ray_y=..0}] acv_ray_y *= -1 acv_constant
scoreboard players operation @s[scores={acv_ray_z=..0}] acv_ray_z *= -1 acv_constant
scoreboard players operation @s[scores={acv_corner_x=..0}] acv_corner_x *= -1 acv_constant
scoreboard players operation @s[scores={acv_corner_y=..0}] acv_corner_y *= -1 acv_constant
scoreboard players operation @s[scores={acv_corner_z=..0}] acv_corner_z *= -1 acv_constant

# compare x to z
scoreboard players operation @s acv_tmp_x = @s acv_ray_x
scoreboard players operation @s acv_tmp_x *= @s acv_corner_z
scoreboard players operation @s acv_tmp_z = @s acv_ray_z
scoreboard players operation @s acv_tmp_z *= @s acv_corner_x
execute if score @s acv_tmp_x > @s acv_tmp_z run scoreboard players set @s acv_blockface_z 0
execute if score @s acv_tmp_z >= @s acv_tmp_x run scoreboard players set @s acv_blockface_x 0

# compare x to y
scoreboard players operation @s acv_tmp_x = @s acv_ray_x
scoreboard players operation @s acv_tmp_x *= @s acv_corner_y
scoreboard players operation @s acv_tmp_y = @s acv_ray_y
scoreboard players operation @s acv_tmp_y *= @s acv_corner_x
execute if score @s acv_tmp_x > @s acv_tmp_y run scoreboard players set @s acv_blockface_y 0
execute if score @s acv_tmp_y >= @s acv_tmp_x run scoreboard players set @s acv_blockface_x 0

# compare y to z
scoreboard players operation @s acv_tmp_y = @s acv_ray_y
scoreboard players operation @s acv_tmp_y *= @s acv_corner_z
scoreboard players operation @s acv_tmp_z = @s acv_ray_z
scoreboard players operation @s acv_tmp_z *= @s acv_corner_y
execute if score @s acv_tmp_y > @s acv_tmp_z run scoreboard players set @s acv_blockface_z 0
execute if score @s acv_tmp_z >= @s acv_tmp_y run scoreboard players set @s acv_blockface_y 0

execute if entity @s[scores={acv_blockface_x=-1}] run say east
execute if entity @s[scores={acv_blockface_x=1}] run say west
execute if entity @s[scores={acv_blockface_y=-1}] run say up
execute if entity @s[scores={acv_blockface_y=1}] run say down
execute if entity @s[scores={acv_blockface_z=-1}] run say south
execute if entity @s[scores={acv_blockface_z=1}] run say north
