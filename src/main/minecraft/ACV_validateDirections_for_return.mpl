process ACV_validateDirections_for_return (
/scoreboard players test DV_DIRECTION_MASK ACV_Internal 32 63
conditional: /scoreboard players tag @e[name=ACV_Up] add ACV_DV_RESULT
/scoreboard players test DV_DIRECTION_MASK ACV_Internal 16 31
conditional: /scoreboard players tag @e[name=ACV_Down] add ACV_DV_RESULT
/scoreboard players test DV_DIRECTION_MASK ACV_Internal 8 15
conditional: /scoreboard players tag @e[name=ACV_South] add ACV_DV_RESULT
/scoreboard players test DV_DIRECTION_MASK ACV_Internal 4 7
conditional: /scoreboard players tag @e[name=ACV_East] add ACV_DV_RESULT
/scoreboard players test DV_DIRECTION_MASK ACV_Internal 2 3
conditional: /scoreboard players tag @e[name=ACV_North] add ACV_DV_RESULT
/scoreboard players test DV_DIRECTION_MASK ACV_Internal 1 1
conditional: /scoreboard players tag @e[name=ACV_West] add ACV_DV_RESULT

/kill @e[name=ACV_Up,tag=!ACV_DV_RESULT]
/kill @e[name=ACV_Down,tag=!ACV_DV_RESULT]
/kill @e[name=ACV_South,tag=!ACV_DV_RESULT]
/kill @e[name=ACV_East,tag=!ACV_DV_RESULT]
/kill @e[name=ACV_North,tag=!ACV_DV_RESULT]
/kill @e[name=ACV_West,tag=!ACV_DV_RESULT]

/execute @e[name=ACV_validateDirections_return] ~ ~ ~ /setblock ~ ~ ~ redstone_block
/kill @e[name=ACV_validateDirections_return]
)
