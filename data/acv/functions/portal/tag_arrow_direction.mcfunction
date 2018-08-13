execute store result score @s acv_delta run data get entity @s xTile
execute store result score @s acv_tmp run data get entity @s Pos[0]
scoreboard players operation @s acv_delta -= @s acv_tmp
execute if score @s acv_delta matches -1 run tag @s add acv_west
execute if score @s acv_delta matches 1 run tag @s add acv_east

execute store result score @s acv_delta run data get entity @s yTile
execute store result score @s acv_tmp run data get entity @s Pos[1]
scoreboard players operation @s acv_delta -= @s acv_tmp
execute if score @s acv_delta matches -1 run tag @s add acv_floor
execute if score @s acv_delta matches 1 run tag @s add acv_ceiling

execute store result score @s acv_delta run data get entity @s zTile
execute store result score @s acv_tmp run data get entity @s Pos[2]
scoreboard players operation @s acv_delta -= @s acv_tmp
execute if score @s acv_delta matches -1 run tag @s add acv_north
execute if score @s acv_delta matches 1 run tag @s add acv_south
