// Creates a Lightbridge at the corresponding ACV_PortalOut of every armorstand named ACV_PortalIn with tag ACV_createLightBridges_PARAM that is in the same block of a ACV_LightBridgeEnd.
// This is achieved by summoning an ACV_LightBridge_Idle at ACV_PortalIn wich will get teleported to ACV_PortalOut in the next tick.
// The ACV_LightBridge_Idle will then be transformed to an ACV_LightBridge.
// Params: armor_stand named ACV_PortalIn tagged with ACV_createLightBridges_PARAM
// Return: armor_stand named ACV_LightBridge_Idle
impulse process ACV_createLightBridges {
/execute @e[type=armor_stand,name=ACV_PortalIn,tag=ACV_createLightBridges_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=armor_stand,name=ACV_LightBridgeEnd,tag=!ACV_BlueOrange,dy=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_LightBridge_Idle",Tags:[ACV_RotationProof,ACV_BlueOrange],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_PortalIn,tag=ACV_createLightBridges_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=armor_stand,name=ACV_LightBridgeEnd,tag=!ACV_BlueOrange,dy=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_AntiBridge_Idle",Tags:[ACV_RotationProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_PortalIn,tag=ACV_createLightBridges_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=armor_stand,name=ACV_LightBridgeEnd,tag=!ACV_PurpleRed,dy=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_LightBridge_Idle",Tags:[ACV_RotationProof,ACV_PurpleRed],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_PortalIn,tag=ACV_createLightBridges_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=armor_stand,name=ACV_LightBridgeEnd,tag=!ACV_PurpleRed,dy=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_AntiBridge_Idle",Tags:[ACV_RotationProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_LightBridgeEnd,tag=ACV_BlueOrange] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge_Idle,dy=0] add ACV_BlueOrange
/execute @e[type=armor_stand,name=ACV_LightBridgeEnd,tag=ACV_PurpleRed] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge_Idle,dy=0] add ACV_PurpleRed

/scoreboard players tag @e remove ACV_createLightBridges_PARAM
}
