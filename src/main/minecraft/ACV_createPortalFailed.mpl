# Description:
# Params: AS-ACV_Main, SCV-color-Color
# Return:



process ACV_createPortalFailed (

start ACV_online
/scoreboard players test Color ACV_Internal 0 0
conditional: /execute @e[name=ACV_Main] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 22
/scoreboard players test Color ACV_Internal 1 1
conditional: /execute @e[name=ACV_Main] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 1
/scoreboard players test Color ACV_Internal 2 2
conditional: /execute @e[name=ACV_Main] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 11
/scoreboard players test Color ACV_Internal 3 3
conditional: /execute @e[name=ACV_Main] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 14

# TODO: playsound
)
