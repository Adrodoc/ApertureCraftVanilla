// Deletes all portals whose color is specified by an entity tagged with ACV_deletePortal_PARAM
// Params: entities with tag ACV_deletePortal_PARAM and a score of ACV_COLOR
process ACV_deletePortals {
  triggerAntiBridges()
  closeConnections()
  killPortals()
  lightUpHorizontalPortals()

  // Kill the Params
  /kill @e[tag=ACV_deletePortal_PARAM]
}

// Triggers the AntiBridges at every specified Portal
// Params: entities with tag ACV_deletePortal_PARAM and a score of ACV_COLOR
process triggerAntiBridges {
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ entitydata @e[type=armor_stand,name=ACV_AntiBridge_Idle,dy=0] {CustomName:"ACV_AntiBridge"}
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ entitydata @e[type=armor_stand,name=ACV_AntiBridge_Idle,dy=0] {CustomName:"ACV_AntiBridge"}
}

// Close the connection between the two portals
// Params: entities with tag ACV_deletePortal_PARAM and a score of ACV_COLOR
process closeConnections {
  ACV_loadChunks()
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ clone 0 1 0 0 2 0 ~ ~ ~
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalIn,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ clone 1 1 0 1 2 0 ~ ~ ~
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ clone 2 1 0 2 2 0 ~ ~ ~
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalIn,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ clone 3 1 0 3 2 0 ~ ~ ~
}

// Delete the specified portals
// Params: entities with tag ACV_deletePortal_PARAM and a score of ACV_COLOR
process killPortals {
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ kill @e[tag=ACV_Portal,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ kill @e[tag=ACV_Portal,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ kill @e[tag=ACV_Portal,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ kill @e[tag=ACV_Portal,score_ACV_COLOR_min=3,score_ACV_COLOR=3]
}

// Place barrier blocks at floor and ceiling portals, because otherwise the display turns dark
// Params: entities with tag ACV_deletePortal_PARAM and a score of ACV_COLOR
process lightUpHorizontalPortals {  
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ setblock ~ ~2 ~ barrier
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ setblock ~ ~2 ~ barrier
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ setblock ~ ~2 ~ barrier
  /execute @e[tag=ACV_deletePortal_PARAM,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ setblock ~ ~2 ~ barrier
}
