function acv:portal/tag_arrow_direction
function acv:portal/load_storage_chunk
function acv:portal/validate
execute if entity @s[tag=!acv_invalid] run function acv:portal/create
kill @s
