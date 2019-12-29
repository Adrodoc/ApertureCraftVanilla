# scoreboard players set @e[type=arrow,nbt={inGround:1b,damage:5.5}] acv_portal_id 1
# scoreboard players set @e[type=arrow,nbt={inGround:1b,damage:6.0}] acv_portal_id 2
# scoreboard players set @e[type=arrow,nbt={inGround:1b,damage:6.5}] acv_portal_id 3
# scoreboard players set @e[type=arrow,nbt={inGround:1b,damage:7.0}] acv_portal_id 4
# execute as @e[type=arrow,scores={acv_portal_id=1..4}] at @s run function acv:portal/process_arrow

execute as @a[scores={acv_shoot=1..}] if data entity @s SelectedItem.tag.acv_portal_id at @s run function acv:portal/shoot
