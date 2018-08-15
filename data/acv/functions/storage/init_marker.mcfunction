scoreboard players operation @s acv_tmp = @s acv_storage_id
scoreboard players operation @s acv_tmp %= 16 acv_constant
execute if score @s acv_tmp matches 1.. run function acv:storage/tp_x

scoreboard players operation @s acv_tmp = @s acv_storage_id
scoreboard players operation @s acv_tmp /= 16 acv_constant
execute if score @s acv_tmp matches 1.. run function acv:storage/tp_z
