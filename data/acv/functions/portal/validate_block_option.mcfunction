tag @s add acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 1 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 2 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 3 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 4 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 5 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 6 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 7 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 8 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 9 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 10 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 11 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 12 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 13 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 14 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 15 0 all run tag @s remove acv_invalid
execute if blocks ~ ~ ~ ~ ~ ~ 0 16 0 all run tag @s remove acv_invalid

tag @s add acv_all_air
execute unless block 0 1 0 air remove acv_all_air
execute unless block 0 2 0 air remove acv_all_air
execute unless block 0 3 0 air remove acv_all_air
execute unless block 0 4 0 air remove acv_all_air
execute unless block 0 5 0 air remove acv_all_air
execute unless block 0 6 0 air remove acv_all_air
execute unless block 0 7 0 air remove acv_all_air
execute unless block 0 8 0 air remove acv_all_air
execute unless block 0 9 0 air remove acv_all_air
execute unless block 0 10 0 air remove acv_all_air
execute unless block 0 11 0 air remove acv_all_air
execute unless block 0 12 0 air remove acv_all_air
execute unless block 0 13 0 air remove acv_all_air
execute unless block 0 14 0 air remove acv_all_air
execute unless block 0 15 0 air remove acv_all_air
execute unless block 0 16 0 air remove acv_all_air
execute if entity @s[tag=acv_all_air] run tag @s remove acv_invalid
