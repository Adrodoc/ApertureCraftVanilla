execute if score @s acv_axis matches 0 if score @s acv_delta_x matches 1.. rotated 90 0 run function acv:portal/validate
execute if score @s acv_axis matches 0 if score @s acv_delta_x matches ..0 rotated -90 0 run function acv:portal/validate
execute if score @s acv_axis matches 1 if score @s acv_delta_y matches 1.. rotated ~ -90 run function acv:portal/validate
execute if score @s acv_axis matches 1 if score @s acv_delta_y matches ..0 rotated ~180 90 run function acv:portal/validate
execute if score @s acv_axis matches 2 if score @s acv_delta_x matches 1.. rotated 180 0 run function acv:portal/validate
execute if score @s acv_axis matches 2 if score @s acv_delta_x matches ..0 rotated 0 0 run function acv:portal/validate

tag @s add acv_wall
execute if score @s acv_axis matches 0 if score @s acv_delta_x matches 1.. run tag @s add acv_east
execute if score @s acv_axis matches 0 if score @s acv_delta_x matches ..0 run tag @s add acv_west
# execute if score @s acv_axis matches 1 if score @s acv_delta_y matches 1.. run tag @s add acv_ceiling
# execute if score @s acv_axis matches 1 if score @s acv_delta_y matches ..0 run tag @s add acv_floor
execute if score @s acv_axis matches 2 if score @s acv_delta_x matches 1.. run tag @s add acv_south
execute if score @s acv_axis matches 2 if score @s acv_delta_x matches ..0 run tag @s add acv_north

execute if entity @s[tag=!acv_invalid] run function acv:portal/create
