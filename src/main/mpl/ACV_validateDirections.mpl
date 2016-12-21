// Check if a portal can be spawned in any direction at the location of ACV_Main.
// All area effect clouds with tag ACV_Direction that would result in an invalid portal are killed.
// Of the remaining directions exactly one is retained with the following priority:
// * ACV_Up
// * ACV_Down
// * ACV_South
// * ACV_East
// * ACV_North
// * ACV_West
process ACV_validateDirections {
ACV_spaceValidation()
ACV_collisionValidation()
ACV_surfaceValidation()

/execute @e[type=area_effect_cloud,name=ACV_Up] ~ ~ ~ kill @e[type=area_effect_cloud,name=!ACV_Up,tag=ACV_Direction,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_Down] ~ ~ ~ kill @e[type=area_effect_cloud,name=!ACV_Down,tag=ACV_Direction,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_South] ~ ~ ~ kill @e[type=area_effect_cloud,name=!ACV_South,tag=ACV_Direction,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_East] ~ ~ ~ kill @e[type=area_effect_cloud,name=!ACV_East,tag=ACV_Direction,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_North] ~ ~ ~ kill @e[type=area_effect_cloud,name=!ACV_North,tag=ACV_Direction,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_West] ~ ~ ~ kill @e[type=area_effect_cloud,name=!ACV_West,tag=ACV_Direction,dy=0]
}



install {
  /scoreboard objectives add ACV_HEIGHT_VALID dummy
}

uninstall {
  /scoreboard objectives remove ACV_HEIGHT_VALID
}

// Checks if there is enough space to create the portal (is there air or carpet below a non floor Portal),
// if there is not, all directions of the affected creation are killed except for ACV_Up.
process ACV_spaceValidation {
/scoreboard players set @e[type=area_effect_cloud,tag=ACV_Direction] ACV_HEIGHT_VALID 0
/scoreboard players set @e[type=area_effect_cloud,name=ACV_Up] ACV_HEIGHT_VALID 1
/execute @e[type=area_effect_cloud,name=!ACV_Up,tag=ACV_Direction] ~ ~ ~ detect ~ ~-1 ~ air * scoreboard players set @e[type=area_effect_cloud,tag=ACV_Direction,r=0,c=1] ACV_HEIGHT_VALID 1
/execute @e[type=area_effect_cloud,name=!ACV_Up,tag=ACV_Direction] ~ ~ ~ detect ~ ~-1 ~ carpet * scoreboard players set @e[type=area_effect_cloud,tag=ACV_Direction,r=0,c=1] ACV_HEIGHT_VALID 1
/kill @e[type=area_effect_cloud,tag=ACV_Direction,score_ACV_HEIGHT_VALID=0]
}



// Checks if there is already a portal of a different color or an item frame or painting that would collide,
// if there is, all directions of the affected creation are killed.
process ACV_collisionValidation {
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ execute @e[type=painting,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=!ACV_PortalDisplay,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=-1,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=1,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=0,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=1,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=3,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=2,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=4,dy=-1,c=1] ~ ~ ~ kill @e[type=area_effect_cloud,tag=ACV_Direction,dy=1]
}



install {
  // The scoreboard Surface Valid Stat is filled by a stat command
  /scoreboard objectives add ACV_SURF_VALID_S dummy
}

uninstall {
  /scoreboard objectives remove ACV_SURF_VALID_S
}

// Checks if both the upper and lower block is valid.
// They are if they are non air, and either listed by the Block_Option or the Block_Option is empty.
// Invalid directions are killed.
process ACV_surfaceValidation {
/execute @e[type=area_effect_cloud,name=ACV_Up] ~ ~ ~ summon area_effect_cloud ~ ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_Up],Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_Up] ~ ~ ~ summon area_effect_cloud ~ ~-1 ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_Up],Duration:2147483647}

/execute @e[type=area_effect_cloud,name=ACV_Down] ~ ~ ~ summon area_effect_cloud ~ ~1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_Down],Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_Down] ~ ~ ~ summon area_effect_cloud ~ ~1 ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_Down],Duration:2147483647}

/execute @e[type=area_effect_cloud,name=ACV_South] ~ ~ ~ summon area_effect_cloud ~ ~-1 ~-1 {CustomName:"ACV_LowerBlock",Tags:[ACV_South],Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_South] ~ ~ ~ summon area_effect_cloud ~ ~ ~-1 {CustomName:"ACV_UpperBlock",Tags:[ACV_South],Duration:2147483647}

/execute @e[type=area_effect_cloud,name=ACV_East] ~ ~ ~ summon area_effect_cloud ~-1 ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_East],Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_East] ~ ~ ~ summon area_effect_cloud ~-1 ~ ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_East],Duration:2147483647}

/execute @e[type=area_effect_cloud,name=ACV_North] ~ ~ ~ summon area_effect_cloud ~ ~-1 ~1 {CustomName:"ACV_LowerBlock",Tags:[ACV_North],Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_North] ~ ~ ~ summon area_effect_cloud ~ ~ ~1 {CustomName:"ACV_UpperBlock",Tags:[ACV_North],Duration:2147483647}

/execute @e[type=area_effect_cloud,name=ACV_West] ~ ~ ~ summon area_effect_cloud ~1 ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_West],Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_West] ~ ~ ~ summon area_effect_cloud ~1 ~ ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_West],Duration:2147483647}


/scoreboard players add @e[type=area_effect_cloud,name=ACV_LowerBlock] ACV_SURF_VALID_S 0
/scoreboard players add @e[type=area_effect_cloud,name=ACV_UpperBlock] ACV_SURF_VALID_S 0
/stats entity @e[type=area_effect_cloud,name=ACV_LowerBlock] set SuccessCount @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] ACV_SURF_VALID_S
/stats entity @e[type=area_effect_cloud,name=ACV_UpperBlock] set SuccessCount @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] ACV_SURF_VALID_S


ACV_loadChunks()


/testforblocks 0 1 1 6 2 1 0 1 2
conditional: /scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock] add ACV_SurfaceValid
conditional: /scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock] add ACV_SurfaceValid


/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 1 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 1 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 1 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 1 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 1 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 1 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 1 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 2 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 2 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 2 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 2 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 2 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 2 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 2 1
/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid

/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 1 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 1 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 1 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 1 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 1 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 1 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 1 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 2 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 2 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 2 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 2 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 2 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 2 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 2 1
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,score_ACV_SURF_VALID_S_min=1] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid


/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ detect ~ ~ ~ piston_extension * scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] add ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ detect ~ ~ ~ piston_extension * scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] add ACV_SurfaceValid


/execute @e[type=area_effect_cloud,name=ACV_LowerBlock] ~ ~ ~ detect ~ ~ ~ air * scoreboard players tag @e[type=area_effect_cloud,name=ACV_LowerBlock,r=0,c=1] remove ACV_SurfaceValid
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock] ~ ~ ~ detect ~ ~ ~ air * scoreboard players tag @e[type=area_effect_cloud,name=ACV_UpperBlock,r=0,c=1] remove ACV_SurfaceValid


/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,tag=ACV_Up,tag=!ACV_SurfaceValid] ~ ~1 ~ kill @e[type=area_effect_cloud,name=ACV_Up,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,tag=ACV_Up,tag=!ACV_SurfaceValid] ~ ~1 ~ kill @e[type=area_effect_cloud,name=ACV_Up,dy=0]

/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,tag=ACV_Down,tag=!ACV_SurfaceValid] ~ ~-1 ~ kill @e[type=area_effect_cloud,name=ACV_Down,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,tag=ACV_Down,tag=!ACV_SurfaceValid] ~ ~-1 ~ kill @e[type=area_effect_cloud,name=ACV_Down,dy=0]

/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,tag=ACV_South,tag=!ACV_SurfaceValid] ~ ~1 ~1 kill @e[type=area_effect_cloud,name=ACV_South,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,tag=ACV_South,tag=!ACV_SurfaceValid] ~ ~ ~1 kill @e[type=area_effect_cloud,name=ACV_South,dy=0]

/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,tag=ACV_East,tag=!ACV_SurfaceValid] ~1 ~1 ~ kill @e[type=area_effect_cloud,name=ACV_East,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,tag=ACV_East,tag=!ACV_SurfaceValid] ~1 ~ ~ kill @e[type=area_effect_cloud,name=ACV_East,dy=0]

/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,tag=ACV_North,tag=!ACV_SurfaceValid] ~ ~1 ~-1 kill @e[type=area_effect_cloud,name=ACV_North,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,tag=ACV_North,tag=!ACV_SurfaceValid] ~ ~ ~-1 kill @e[type=area_effect_cloud,name=ACV_North,dy=0]

/execute @e[type=area_effect_cloud,name=ACV_LowerBlock,tag=ACV_West,tag=!ACV_SurfaceValid] ~-1 ~1 ~ kill @e[type=area_effect_cloud,name=ACV_West,dy=0]
/execute @e[type=area_effect_cloud,name=ACV_UpperBlock,tag=ACV_West,tag=!ACV_SurfaceValid] ~-1 ~ ~ kill @e[type=area_effect_cloud,name=ACV_West,dy=0]


/kill @e[type=area_effect_cloud,name=ACV_LowerBlock]
/kill @e[type=area_effect_cloud,name=ACV_UpperBlock]
}
