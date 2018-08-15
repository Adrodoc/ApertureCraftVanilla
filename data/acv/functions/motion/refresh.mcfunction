scoreboard players set @s acv_motion_y 0
scoreboard players operation @s acv_motion_y -= @s acv_pos_y
execute store result score @s acv_pos_y run data get entity @s Pos[1] 10
scoreboard players operation @s acv_motion_y += @s acv_pos_y

#tellraw @a [{"text":"calculated motion: "},{"score":{"name":"@s","objective":"acv_motion_y"}}]
#execute store result score @s acv_tmp run data get entity @s Motion[1] 10
#tellraw @a [{"text":"game motion: "},{"score":{"name":"@s","objective":"acv_tmp"}}]
