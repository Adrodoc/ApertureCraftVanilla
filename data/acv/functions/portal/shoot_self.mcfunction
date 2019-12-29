tag @s remove acv_new
function acv:raycast/cast_self
execute at @s align xyz positioned ~.5 ~.5 ~.5 run particle barrier
execute at @s align xyz positioned ~.5 ~.5 ~.5 run function acv:portal/try_create
