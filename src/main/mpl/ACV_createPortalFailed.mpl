// Description:
// Params: AS-ACV_Main, SCV-color-Color
// Return:
impulse process ACV_createPortalFailed {

start ACV_online
/execute @e[name=ACV_Main,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 22
/execute @e[name=ACV_Main,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 1
/execute @e[name=ACV_Main,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 11
/execute @e[name=ACV_Main,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 14

// TODO: playsound
}
