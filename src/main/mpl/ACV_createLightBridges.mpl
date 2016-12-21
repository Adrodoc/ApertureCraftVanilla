// Creates a Lightbridge at the corresponding ACV_PortalOut of every area effect cloud named ACV_PortalIn with tag ACV_createLightBridges_PARAM that is in the same block of a ACV_LightBridgeEnd.
// This is achieved by summoning an ACV_LightBridge_Idle at ACV_PortalIn wich will get teleported to ACV_PortalOut in the next tick.
// The ACV_LightBridge_Idle will then be transformed to an ACV_LightBridge.
// Params: area_effect_cloud named ACV_PortalIn tagged with ACV_createLightBridges_PARAM
// Return: area_effect_cloud named ACV_LightBridge_Idle
impulse process ACV_createLightBridges {
if: /testfor @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
then { // only create light- and anti-bridge if the connection is open
  if: /testfor @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
  then {
    /execute @e[type=area_effect_cloud,name=ACV_PortalIn,tag=ACV_createLightBridges_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_LightBridgeEnd,tag=!ACV_BlueOrange,dy=0] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_LightBridge_Idle",Tags:[ACV_RotationProof,ACV_BlueOrange],Duration:2147483647}
    /execute @e[type=area_effect_cloud,name=ACV_PortalIn,tag=ACV_createLightBridges_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_LightBridgeEnd,tag=!ACV_BlueOrange,dy=0] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_AntiBridge_Idle",Tags:[ACV_RotationProof],Duration:2147483647}
  }
}

if: /testfor @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
then { // only create light- and anti-bridge if the connection is open
  if: /testfor @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=3,score_ACV_COLOR=3]
  then {
    /execute @e[type=area_effect_cloud,name=ACV_PortalIn,tag=ACV_createLightBridges_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_LightBridgeEnd,tag=!ACV_PurpleRed,dy=0] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_LightBridge_Idle",Tags:[ACV_RotationProof,ACV_PurpleRed],Duration:2147483647}
    /execute @e[type=area_effect_cloud,name=ACV_PortalIn,tag=ACV_createLightBridges_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_LightBridgeEnd,tag=!ACV_PurpleRed,dy=0] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_AntiBridge_Idle",Tags:[ACV_RotationProof],Duration:2147483647}
  }
}

/execute @e[type=area_effect_cloud,name=ACV_LightBridgeEnd,tag=ACV_BlueOrange] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LightBridge_Idle,dy=0] add ACV_BlueOrange
/execute @e[type=area_effect_cloud,name=ACV_LightBridgeEnd,tag=ACV_PurpleRed] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LightBridge_Idle,dy=0] add ACV_PurpleRed

/scoreboard players tag @e remove ACV_createLightBridges_PARAM
start ACV_lightBridges
}
