function acv:portal/delete
function acv:portal/spawn
function acv:portal/texture

scoreboard players add @e[tag=acv_portal] acv_portal_id 0
scoreboard players operation @e[tag=acv_portal,scores={acv_portal_id=0}] acv_portal_id = @s acv_portal_id

function acv:portal/open_connection
