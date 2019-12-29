scoreboard players set @s acv_portal_id 2
tag @s add acv_wall
tag @s add acv_south
function acv:portal/validate
execute if entity @s[tag=!acv_invalid] run function acv:portal/create
kill @s
