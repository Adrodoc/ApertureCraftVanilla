execute if entity @s[tag=acv_ceiling] run summon item_frame ~ ~ ~ {Tags:[acv_display,acv_uncolored],Facing:0b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_ceiling,tag=acv_north] run summon item_frame ~ ~ ~-1 {Tags:[acv_display,acv_uncolored],Facing:0b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_ceiling,tag=acv_east] run summon item_frame ~1 ~ ~ {Tags:[acv_display,acv_uncolored],Facing:0b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_ceiling,tag=acv_south] run summon item_frame ~ ~ ~1 {Tags:[acv_display,acv_uncolored],Facing:0b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_ceiling,tag=acv_west] run summon item_frame ~-1 ~ ~ {Tags:[acv_display,acv_uncolored],Facing:0b,Invulnerable:1b,Glowing:1b}

execute if entity @s[tag=acv_floor] run summon item_frame ~ ~ ~ {Tags:[acv_display,acv_uncolored],Facing:1b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_floor,tag=acv_north] run summon item_frame ~ ~ ~1 {Tags:[acv_display,acv_uncolored],Facing:1b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_floor,tag=acv_east] run summon item_frame ~-1 ~ ~ {Tags:[acv_display,acv_uncolored],Facing:1b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_floor,tag=acv_south] run summon item_frame ~ ~ ~-1 {Tags:[acv_display,acv_uncolored],Facing:1b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_floor,tag=acv_west] run summon item_frame ~1 ~ ~ {Tags:[acv_display,acv_uncolored],Facing:1b,Invulnerable:1b,Glowing:1b}

execute if entity @s[tag=acv_wall,tag=acv_north] run summon item_frame ~ ~ ~ {Tags:[acv_display,acv_uncolored],Facing:3b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_wall,tag=acv_north] run summon item_frame ~ ~-1 ~ {Tags:[acv_display,acv_uncolored],Facing:3b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_wall,tag=acv_east] run summon item_frame ~ ~ ~ {Tags:[acv_display,acv_uncolored],Facing:4b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_wall,tag=acv_east] run summon item_frame ~ ~-1 ~ {Tags:[acv_display,acv_uncolored],Facing:4b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_wall,tag=acv_south] run summon item_frame ~ ~ ~ {Tags:[acv_display,acv_uncolored],Facing:2b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_wall,tag=acv_south] run summon item_frame ~ ~-1 ~ {Tags:[acv_display,acv_uncolored],Facing:2b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_wall,tag=acv_west] run summon item_frame ~ ~ ~ {Tags:[acv_display,acv_uncolored],Facing:5b,Invulnerable:1b,Glowing:1b}
execute if entity @s[tag=acv_wall,tag=acv_west] run summon item_frame ~ ~-1 ~ {Tags:[acv_display,acv_uncolored],Facing:5b,Invulnerable:1b,Glowing:1b}

scoreboard players operation @e[tag=acv_uncolored] acv_color = @s acv_color
tag @e[tag=acv_uncolored] remove acv_uncolored
