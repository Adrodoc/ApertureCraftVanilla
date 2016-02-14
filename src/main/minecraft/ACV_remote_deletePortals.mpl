# Description: Deletes all Portals specified by the Params
# Params: AS-ACV_remote_deletePortals_PARAM_blue, AS-ACV_remote_deletePortals_PARAM_orange, AS-ACV_remote_deletePortals_PARAM_purple, AS-ACV_remote_deletePortals_PARAM_red
# Return:



process ACV_remote_deletePortals (
/setblock ~ ~ ~-1 stone

/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM_blue] ACV_COLOR 0
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM_orange] ACV_COLOR 1
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM_purple] ACV_COLOR 2
/scoreboard players set @e[name=ACV_remote_deletePortals_PARAM_red] ACV_COLOR 3
/execute @e[name=ACV_loadChunks] ~ ~ ~ /setblock ~ ~ ~ redstone_block
/summon ArmorStand ${this + 1} {CustomName:"ACV_loadChunks_return",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

skip

impulse: /setblock ${this - 1} stone
/execute @e[name=ACV_deletePortal] ~ ~ ~ /setblock ~ ~ ~ redstone_block
)
