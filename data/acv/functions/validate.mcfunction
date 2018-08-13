execute if entity @s[tag=acv_ceiling] positioned ~ ~1 ~ run function acv:validate_block

execute if entity @s[tag=acv_floor] positioned ~ ~-1 ~ run function acv:validate_block

execute if entity @s[tag=acv_south] positioned ~ ~-1 ~1 run function acv:validate_block
execute if entity @s[tag=acv_south] positioned ~ ~ ~1 run function acv:validate_block

execute if entity @s[tag=acv_north] positioned ~ ~-1 ~-1 run function acv:validate_block
execute if entity @s[tag=acv_north] positioned ~ ~ ~-1 run function acv:validate_block

execute if entity @s[tag=acv_east] positioned ~1 ~-1 ~ run function acv:validate_block
execute if entity @s[tag=acv_east] positioned ~1 ~ ~ run function acv:validate_block

execute if entity @s[tag=acv_west] positioned ~-1 ~-1 ~ run function acv:validate_block
execute if entity @s[tag=acv_west] positioned ~-1 ~ ~ run function acv:validate_block
