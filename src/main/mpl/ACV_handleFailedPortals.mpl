// Spawn particles at every ACV_Main that did not have a successful validation.
// Params: armor_stand named ACV_Main tagged with ACV_handleFailedPortals_PARAM
process ACV_handleFailedPortals {
/execute @e[type=armor_stand,name=ACV_Main,tag=ACV_handleFailedPortals_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 22
/execute @e[type=armor_stand,name=ACV_Main,tag=ACV_handleFailedPortals_PARAM,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 1
/execute @e[type=armor_stand,name=ACV_Main,tag=ACV_handleFailedPortals_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 11
/execute @e[type=armor_stand,name=ACV_Main,tag=ACV_handleFailedPortals_PARAM,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ /particle iconcrack ~ ~ ~ 0.1 0.1 0.1 0 20 force @a 159 14

// TODO: playsound
}
