install {
  /scoreboard objectives add ACV_SURFACE_VALIDATION dummy
  /scoreboard objectives add ACV_SURFACE_VALIDATION_STAT dummy
}

uninstall {
  /scoreboard objectives remove ACV_SURFACE_VALIDATION
  /scoreboard objectives remove ACV_SURFACE_VALIDATION_STAT
}

// Description: Check if a Portal can be spawned in any direction at the location of ACV_Main
//              All Armorstands with tag ACV_Direction that would result in an invalid Portal are killed.
//              Of the remaining directions exactly one is retained with the following priority:
//              * ACV_Up
//              * ACV_Down
//              * ACV_South
//              * ACV_East
//              * ACV_North
//              * ACV_West
impulse process ACV_validateDirections {
// Description: Checks if there is air below a non floor Portal
//              If there is not, all directions of the affected creation are killed except for ACV_Up
// HEIGHT_VALIDATION {
/scoreboard players tag @e[type=armor_stand,name=ACV_Up] add ACV_HeightValidation
/execute @e[type=armor_stand,name=!ACV_Up,tag=ACV_Direction] ~ ~ ~ detect ~ ~-1 ~ air * scoreboard players tag @e[type=armor_stand,tag=ACV_Direction,r=0,c=1] add ACV_HeightValidation
/execute @e[type=armor_stand,name=!ACV_Up,tag=ACV_Direction] ~ ~ ~ detect ~ ~-1 ~ carpet * scoreboard players tag @e[type=armor_stand,tag=ACV_Direction,r=0,c=1] add ACV_HeightValidation
/kill @e[type=armor_stand,tag=ACV_Direction,tag!=ACV_HeightValidation]
// HEIGHT_VALIDATION }


// Description: Checks if there is already a Portal of a different color or an item frame or painting that would overlap
//              If there is, all directions of the affected creation are killed
// PORTAL_VALIDATION {
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=painting,dy=1,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=!ACV_PortalDisplay,dy=1,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/scoreboard players test Color ACV_Internal 0 0
conditional: /execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=-1,dy=1,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/scoreboard players test Color ACV_Internal 0 0
conditional: /execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=1,dy=0,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/scoreboard players test Color ACV_Internal 1 1
conditional: /execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=0,dy=0,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/scoreboard players test Color ACV_Internal 1 1
conditional: /execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,dy=0,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/scoreboard players test Color ACV_Internal 2 2
conditional: /execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=1,dy=0,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/scoreboard players test Color ACV_Internal 2 2
conditional: /execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=3,dy=0,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/scoreboard players test Color ACV_Internal 3 3
conditional: /execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=2,dy=0,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
/scoreboard players test Color ACV_Internal 3 3
conditional: /execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=4,dy=0,c=1] ~ ~ ~ kill @e[type=armor_stand,tag=ACV_Direction,dy=-1]
// PORTAL_VALIDATION }



// Description: Checks if both the upper and lower block is valid.
//              They are if they are non air, and either listed by the Block_Option or the Block_Option is empty.
//              Invalid directions are killed.
// SURFACE_VALIDATION {
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_Up],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-1 ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_Up],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_Down],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~1 ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_Down],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-1 ~-1 {CustomName:"ACV_LowerBlock",Tags:[ACV_South],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~-1 {CustomName:"ACV_UpperBlock",Tags:[ACV_South],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~-1 ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_East],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~-1 ~ ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_East],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-1 ~1 {CustomName:"ACV_LowerBlock",Tags:[ACV_North],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~1 {CustomName:"ACV_UpperBlock",Tags:[ACV_North],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~1 ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_West],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_Main] ~ ~ ~ summon armor_stand ~1 ~ ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_West],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}


/execute @e[type=armor_stand,name=ACV_LowerBlock] set SuccessCount @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] set SuccessCount @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT


ACV_loadChunks()


/scoreboard players set @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION 0
/scoreboard players set @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION 0
/testforblocks 0 1 1 6 2 1 0 1 2
conditional: /scoreboard players set @e[type=armor_stand,tag=ACV_LowerBlock] ACV_SURFACE_VALIDATION 1
conditional: /scoreboard players set @e[type=armor_stand,tag=ACV_UpperBlock] ACV_SURFACE_VALIDATION 1

/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT

/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT


/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ detect ~ ~ ~ air * scoreboard players set @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION 0
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ detect ~ ~ ~ air * scoreboard players set @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION 0


/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_Up,score_ACV_SURFACE_VALIDATION=0] ~ ~1 ~ kill @e[type=armor_stand,name=ACV_Up,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_Up,score_ACV_SURFACE_VALIDATION=0] ~ ~1 ~ kill @e[type=armor_stand,name=ACV_Up,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_Down,score_ACV_SURFACE_VALIDATION=0] ~ ~-1 ~ kill @e[type=armor_stand,name=ACV_Down,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_Down,score_ACV_SURFACE_VALIDATION=0] ~ ~-1 ~ kill @e[type=armor_stand,name=ACV_Down,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_South,score_ACV_SURFACE_VALIDATION=0] ~ ~ ~1 kill @e[type=armor_stand,name=ACV_South,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_South,score_ACV_SURFACE_VALIDATION=0] ~ ~ ~1 kill @e[type=armor_stand,name=ACV_South,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_East,score_ACV_SURFACE_VALIDATION=0] ~1 ~ ~ kill @e[type=armor_stand,name=ACV_East,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_East,score_ACV_SURFACE_VALIDATION=0] ~1 ~ ~ kill @e[type=armor_stand,name=ACV_East,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_North,score_ACV_SURFACE_VALIDATION=0] ~ ~ ~-1 kill @e[type=armor_stand,name=ACV_North,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_North,score_ACV_SURFACE_VALIDATION=0] ~ ~ ~-1 kill @e[type=armor_stand,name=ACV_North,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_West,score_ACV_SURFACE_VALIDATION=0] ~-1 ~ ~ kill @e[type=armor_stand,name=ACV_West,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_West,score_ACV_SURFACE_VALIDATION=0] ~-1 ~ ~ kill @e[type=armor_stand,name=ACV_West,dy=0]


/kill @e[type=armor_stand,name=ACV_LowerBlock]
/kill @e[type=armor_stand,name=ACV_UpperBlock]
// SURFACE_VALIDATION }



/execute @e[type=armor_stand,name=ACV_Up] ~ ~ ~ kill @e[type=armor_stand,name=!ACV_Up,tag=ACV_Direction]
/execute @e[type=armor_stand,name=ACV_Down] ~ ~ ~ kill @e[type=armor_stand,name=!ACV_Down,tag=ACV_Direction]
/execute @e[type=armor_stand,name=ACV_South] ~ ~ ~ kill @e[type=armor_stand,name=!ACV_South,tag=ACV_Direction]
/execute @e[type=armor_stand,name=ACV_East] ~ ~ ~ kill @e[type=armor_stand,name=!ACV_East,tag=ACV_Direction]
/execute @e[type=armor_stand,name=ACV_North] ~ ~ ~ kill @e[type=armor_stand,name=!ACV_North,tag=ACV_Direction]
/execute @e[type=armor_stand,name=ACV_West] ~ ~ ~ kill @e[type=armor_stand,name=!ACV_West,tag=ACV_Direction]
}
