function acv:portal/summon_portal_in_markers

execute at @e[tag=acv_portal_in,tag=acv_uncolored] run function acv:portal/validate_block

execute if entity @s[tag=acv_invalid] run kill @e[tag=acv_portal_in,tag=acv_uncolored]
