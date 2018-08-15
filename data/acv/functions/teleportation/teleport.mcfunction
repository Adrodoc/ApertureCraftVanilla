# calculate target color
scoreboard players operation @s acv_target_color = @s acv_origin_color
scoreboard players operation @s acv_tmp = @s acv_origin_color
scoreboard players operation @s acv_tmp %= 2 acv_constant
scoreboard players remove @s[scores={acv_tmp=0}] acv_target_color 1
scoreboard players add @s[scores={acv_tmp=1}] acv_target_color 1

scoreboard players set @s acv_delta 6

# refer to origin portal
scoreboard players operation @e[tag=acv_portal,tag=acv_outside] acv_color -= @s acv_origin_color
execute store result score @s acv_tmp run data get entity @e[tag=acv_portal,tag=acv_outside,scores={acv_color=0},limit=1] Rotation[0] .011111111111111111
scoreboard players operation @e[tag=acv_portal,tag=acv_outside] acv_color += @s acv_origin_color

scoreboard players operation @s acv_delta -= @s acv_tmp

# refer to target portal
scoreboard players operation @e[tag=acv_portal,tag=acv_outside] acv_color -= @s acv_target_color
execute store result score @s acv_tmp run data get entity @e[tag=acv_portal,tag=acv_outside,scores={acv_color=0},limit=1] Rotation[0] .011111111111111111
scoreboard players operation @s acv_delta += @s acv_tmp
scoreboard players operation @s acv_delta %= 4 acv_constant
execute at @e[tag=acv_portal,tag=acv_outside,scores={acv_color=0}] run teleport @s ~ ~ ~
scoreboard players operation @e[tag=acv_portal,tag=acv_outside] acv_color += @s acv_target_color

# reset motion
teleport @s @s

execute if entity @s[scores={acv_delta=0}] at @s run teleport @s ~ ~ ~ ~ ~
execute if entity @s[scores={acv_delta=1}] at @s run teleport @s ~ ~ ~ ~90 ~
execute if entity @s[scores={acv_delta=2}] at @s run teleport @s ~ ~ ~ ~180 ~
execute if entity @s[scores={acv_delta=3}] at @s run teleport @s ~ ~ ~ ~270 ~
