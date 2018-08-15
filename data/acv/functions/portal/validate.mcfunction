function acv:portal/summon_portal_in_markers

scoreboard players add @e[tag=acv_portal] acv_portal_id 0
execute at @e[tag=acv_portal,tag=acv_inside,scores={acv_portal_id=0}] run function acv:portal/validate_block

execute if entity @s[tag=acv_invalid] run kill @e[tag=acv_portal,tag=acv_inside,scores={acv_portal_id=0}]
