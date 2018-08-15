# refer to origin portal
scoreboard players operation @e[tag=acv_portal,tag=acv_outside] acv_portal_id -= @s acv_portal_id
execute store result score @s acv_tmp run data get entity @e[tag=acv_portal,tag=acv_outside,scores={acv_portal_id=0},limit=1] Rotation[0] .011111111111111111
scoreboard players operation @e[tag=acv_portal,tag=acv_outside] acv_portal_id += @s acv_portal_id

scoreboard players set @s acv_delta 6
scoreboard players operation @s acv_delta -= @s acv_tmp
function acv:portal/get_opposite_id

# refer to target portal
scoreboard players operation @e[tag=acv_portal,tag=acv_outside] acv_portal_id -= @s acv_opposite_id
execute store result score @s acv_tmp run data get entity @e[tag=acv_portal,tag=acv_outside,scores={acv_portal_id=0},limit=1] Rotation[0] .011111111111111111
scoreboard players operation @s acv_delta += @s acv_tmp
scoreboard players operation @s acv_delta %= 4 acv_constant
execute at @e[tag=acv_portal,tag=acv_outside,scores={acv_portal_id=0}] run teleport @s ~ ~ ~
scoreboard players operation @e[tag=acv_portal,tag=acv_outside] acv_portal_id += @s acv_opposite_id

# reset motion
teleport @s @s

execute if entity @s[scores={acv_delta=0}] at @s run teleport @s ~ ~ ~ ~ ~
execute if entity @s[scores={acv_delta=1}] at @s run teleport @s ~ ~ ~ ~90 ~
execute if entity @s[scores={acv_delta=2}] at @s run teleport @s ~ ~ ~ ~180 ~
execute if entity @s[scores={acv_delta=3}] at @s run teleport @s ~ ~ ~ ~270 ~
