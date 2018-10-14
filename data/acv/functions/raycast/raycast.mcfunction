kill @e[type=area_effect_cloud,tag=acv_raycast]
execute anchored eyes positioned ^ ^ ^ anchored feet run function acv:raycast/iteration
execute store result score @s acv_pos_x run data get entity @s Pos[0] 10000
execute store result score @s acv_pos_y run data get entity @s Pos[1] 10000
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

execute if score @s acv_ray_x matches  run scoreboard players remove @s acv_corner_x 10000
execute if score @s acv_pos_y > @s acv_ray_y run scoreboard players remove @s acv_corner_y 10000
execute if score @s acv_pos_z > @s acv_ray_z run scoreboard players remove @s acv_corner_z 10000


scoreboard players operation @s acv_corner_x *= @s acv_ray_z
scoreboard players operation @s acv_corner_z *= @s acv_ray_x

tellraw @a {"score":{"name":"@s","objective":"acv_corner_x"}}
tellraw @a {"score":{"name":"@s","objective":"acv_corner_z"}}

execute if score @s acv_corner_x > @s acv_corner_z run say links
execute if score @s acv_corner_x <= @s acv_corner_z run say rechts
