execute at @s run teleport @s ~1 ~ ~
scoreboard players remove @s acv_tmp 1
execute if score @s acv_tmp matches 1.. run function acv:storage/tp_x
