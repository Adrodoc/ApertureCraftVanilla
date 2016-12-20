// Delete all portals specified by the params and kill the params
// Params: AS-ACV_remote_deletePortals_PARAM_blue, AS-ACV_remote_deletePortals_PARAM_orange, AS-ACV_remote_deletePortals_PARAM_purple, AS-ACV_remote_deletePortals_PARAM_red
// Does not notify
impulse process ACV_remote_deletePortals {
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM,tag=ACV_Blue] ACV_COLOR 0
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM,tag=ACV_Orange] ACV_COLOR 1
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM,tag=ACV_Purple] ACV_COLOR 2
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM,tag=ACV_Red] ACV_COLOR 3
/entitydata @e[name=ACV_remote_deletePortals_PARAM] {CustomName:"ACV_deletePortals_PARAM"}
ACV_deletePortals()
}
