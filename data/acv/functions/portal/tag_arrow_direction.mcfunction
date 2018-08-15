execute store result score @s acv_delta run data get entity @s xTile
execute store result score @s acv_tmp run data get entity @s Pos[0]
scoreboard players operation @s acv_delta -= @s acv_tmp
tag @s[scores={acv_delta=-1}] add acv_west
tag @s[scores={acv_delta=1}] add acv_east
execute unless score @s acv_delta matches 0 run tag @s add acv_wall

execute store result score @s acv_delta run data get entity @s yTile
execute store result score @s acv_tmp run data get entity @s Pos[1]
scoreboard players operation @s acv_delta -= @s acv_tmp
tag @s[scores={acv_delta=-1}] add acv_floor
tag @s[scores={acv_delta=1}] add acv_ceiling

execute store result score @s acv_delta run data get entity @s zTile
execute store result score @s acv_tmp run data get entity @s Pos[2]
scoreboard players operation @s acv_delta -= @s acv_tmp
tag @s[scores={acv_delta=-1}] add acv_north
tag @s[scores={acv_delta=1}] add acv_south
execute unless score @s acv_delta matches 0 run tag @s add acv_wall

execute if entity @s[tag=!acv_wall] store result score @s acv_tmp run data get entity @s Rotation[0] .022222222222222222
execute if entity @s[tag=!acv_wall] run scoreboard players add @s acv_tmp 8
execute if entity @s[tag=!acv_wall] run scoreboard players operation @s acv_tmp %= 8 acv_constant

# workaround for https://bugs.mojang.com/browse/MC-112474
execute if entity @s[tag=!acv_wall] run tag @s[scores={acv_tmp=0}] add acv_south
execute if entity @s[tag=!acv_wall] run tag @s[scores={acv_tmp=1..2}] add acv_east
execute if entity @s[tag=!acv_wall] run tag @s[scores={acv_tmp=3..4}] add acv_north
execute if entity @s[tag=!acv_wall] run tag @s[scores={acv_tmp=5..6}] add acv_west
execute if entity @s[tag=!acv_wall] run tag @s[scores={acv_tmp=7}] add acv_south
