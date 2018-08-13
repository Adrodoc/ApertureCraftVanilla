function acv:tag_arrow_direction
function acv:validate
execute if entity @s[tag=!acv_invalid] run function acv:create_portal
