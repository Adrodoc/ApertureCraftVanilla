# Description: Deletes all Portals specified by the Params
# Params: AS-ACV_remote_deletePortals_PARAM_blue, AS-ACV_remote_deletePortals_PARAM_orange, AS-ACV_remote_deletePortals_PARAM_purple, AS-ACV_remote_deletePortals_PARAM_red
# Return:



process ACV_remote_deletePortals (
/setblock ~ ~ ~-1 stone

/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM_blue] ACV_COLOR 0
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM_orange] ACV_COLOR 1
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM_purple] ACV_COLOR 2
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM_red] ACV_COLOR 3
start ACV_loadChunks
waitfor
start ACV_deletePortal
)
