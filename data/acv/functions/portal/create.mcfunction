function acv:portal/delete
function acv:portal/spawn
function acv:portal/texture

scoreboard players operation @e[tag=acv_uncolored] acv_color = @s acv_color
tag @e[tag=acv_uncolored] remove acv_uncolored

function acv:portal/open_connection
