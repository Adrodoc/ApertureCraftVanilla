execute if block ~ ~ ~ air run tag @s add acv_invalid
execute if entity @s[tag=!acv_invalid] unless block ~ ~ ~ moving_piston run function acv:portal/validate_block_option
