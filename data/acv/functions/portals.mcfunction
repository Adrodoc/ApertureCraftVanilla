tag @e[type=arrow,nbt={inGround:1b,damage:5.5}] add acv_blue
tag @e[type=arrow,nbt={inGround:1b,damage:6.0}] add acv_orange
tag @e[type=arrow,nbt={inGround:1b,damage:6.5}] add acv_purple
tag @e[type=arrow,nbt={inGround:1b,damage:7.0}] add acv_red
execute as @e[type=arrow,nbt={inGround:1b}] at @s run function acv:process_arrow
