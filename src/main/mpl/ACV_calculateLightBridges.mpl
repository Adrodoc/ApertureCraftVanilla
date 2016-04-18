# Description: Summons an idle Lightbridge at every ASwT-ACV_CLB_PARAM named ACV_PortalIn, effectively summoning it at the corresponding ACV_PortalOut
# Params: AS-ACV_PortalIn, ASwT-ACV_CLB_PARAM
# Return: AS-ACV_LightBridge
process ACV_calculateLightBridges (
/execute @e[name=ACV_PortalIn,tag=ACV_CLB_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[name=ACV_LightBridgeEnd,tag=!ACV_BlueOrange,dy=0] ~ ~ ~ summon ArmorStand ~ ~ ~ {CustomName:"ACV_LightBridge_Idle",Tags:[ACV_RotationProof,ACV_BlueOrange],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_PortalIn,tag=ACV_CLB_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[name=ACV_LightBridgeEnd,tag=!ACV_BlueOrange,dy=0] ~ ~ ~ summon ArmorStand ~ ~ ~ {CustomName:"ACV_AntiBridge_Idle",Tags:[ACV_RotationProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[name=ACV_PortalIn,tag=ACV_CLB_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[name=ACV_LightBridgeEnd,tag=!ACV_PurpleRed,dy=0] ~ ~ ~ summon ArmorStand ~ ~ ~ {CustomName:"ACV_LightBridge_Idle",Tags:[ACV_RotationProof,ACV_PurpleRed],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_PortalIn,tag=ACV_CLB_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[name=ACV_LightBridgeEnd,tag=!ACV_PurpleRed,dy=0] ~ ~ ~ summon ArmorStand ~ ~ ~ {CustomName:"ACV_AntiBridge_Idle",Tags:[ACV_RotationProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[name=ACV_LightBridgeEnd,tag=ACV_BlueOrange] ~ ~ ~ scoreboard players tag @e[name=ACV_LightBridge_Idle,dy=0] add ACV_BlueOrange
/execute @e[name=ACV_LightBridgeEnd,tag=ACV_PurpleRed] ~ ~ ~ scoreboard players tag @e[name=ACV_LightBridge_Idle,dy=0] add ACV_PurpleRed

/scoreboard players tag @e remove ACV_CLB_PARAM
)
