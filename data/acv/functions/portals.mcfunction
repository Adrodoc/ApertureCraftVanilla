scoreboard players set @e[type=arrow,nbt={inGround:1b,damage:5.5}] acv_color 0
scoreboard players set @e[type=arrow,nbt={inGround:1b,damage:6.0}] acv_color 1
scoreboard players set @e[type=arrow,nbt={inGround:1b,damage:6.5}] acv_color 2
scoreboard players set @e[type=arrow,nbt={inGround:1b,damage:7.0}] acv_color 3
execute as @e[type=arrow,scores={acv_color=0..3}] at @s run function acv:process_arrow
