scoreboard players reset @s acv_shoot
# /give @s minecraft:carrot_on_a_stick{acv_portal_id:1,display:{Name:"{\"text\":\"Blue Portalgun\"}"}}
summon area_effect_cloud ~ ~ ~ {Tags:[acv_new],Duration:1}
execute store result score @e[tag=acv_new,type=area_effect_cloud,distance=0] acv_portal_id run data get entity @s SelectedItem.tag.acv_portal_id
execute anchored eyes positioned ^ ^ ^ as @e[tag=acv_new,type=area_effect_cloud,distance=..3] run function acv:portal/shoot_self
