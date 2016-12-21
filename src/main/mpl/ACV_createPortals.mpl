// Create a portal at each area effect cloud named ACV_Main if the location is a valid portal location.
// For each direction that should be taken into account there must be an area effect cloud located in the same block.
// The color is specified by ACV_Mains ACV_COLOR score.
// Params: area_effect_cloud named ACV_Main, area_effect_cloud tagged with ACV_Direction
process ACV_createPortals {
ACV_deleteRedundantMarkers()


ACV_validateDirections()


/scoreboard players tag @e[type=area_effect_cloud,name=ACV_Main] add ACV_handleFailedPortals_PARAM
/execute @e[type=area_effect_cloud,tag=ACV_Direction] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,name=ACV_Main,dy=0] remove ACV_handleFailedPortals_PARAM
ACV_handleFailedPortals()
/kill @e[type=area_effect_cloud,name=ACV_Main,tag=ACV_handleFailedPortals_PARAM]


/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_deletePortals_PARAM",Duration:2147483647}
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ scoreboard players operation @e[type=area_effect_cloud,name=ACV_deletePortals_PARAM,r=0,c=1] ACV_COLOR = @e[type=area_effect_cloud,name=ACV_Main,r=0,c=1] ACV_COLOR
ACV_deletePortals()


/execute @e[type=area_effect_cloud,name=ACV_Up] ~ ~ ~ summon item_frame ~ ~-1 ~ {CustomName:"ACV_PortalMain",Tags:[ACV_Up],Facing:0b,Invulnerable:1b}
/execute @e[type=area_effect_cloud,name=ACV_Down] ~ ~ ~ summon item_frame ~ ~1 ~ {CustomName:"ACV_PortalMain",Tags:[ACV_Down],Facing:0b,Invulnerable:1b}
/execute @e[type=area_effect_cloud,name=ACV_South] ~ ~ ~ summon item_frame ~ ~-1 ~ {CustomName:"ACV_PortalMain",Tags:[ACV_South],Facing:0b,Invulnerable:1b}
/execute @e[type=area_effect_cloud,name=ACV_East] ~ ~ ~ summon item_frame ~ ~-1 ~ {CustomName:"ACV_PortalMain",Tags:[ACV_East],Facing:3b,Invulnerable:1b}
/execute @e[type=area_effect_cloud,name=ACV_North] ~ ~ ~ summon item_frame ~ ~-1 ~ {CustomName:"ACV_PortalMain",Tags:[ACV_North],Facing:2b,Invulnerable:1b}
/execute @e[type=area_effect_cloud,name=ACV_West] ~ ~ ~ summon item_frame ~ ~-1 ~ {CustomName:"ACV_PortalMain",Tags:[ACV_West],Facing:1b,Invulnerable:1b}
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ scoreboard players operation @e[type=item_frame,name=ACV_PortalMain,dy=-1] ACV_COLOR = @e[type=area_effect_cloud,name=ACV_Main,r=0,c=1] ACV_COLOR
/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ scoreboard players operation @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down,dy=1] ACV_COLOR = @e[type=area_effect_cloud,name=ACV_Main,r=0,c=1] ACV_COLOR
ACV_spawnPortals()
ACV_texturePortals()
/kill @e[type=item_frame,name=ACV_PortalMain]

ACV_openConnections()


/testfor @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=0,score_ACV_COLOR=1]
conditional: /scoreboard players tag @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=1] add ACV_createLightBridges_PARAM
/testfor @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=2,score_ACV_COLOR=3]
conditional: /scoreboard players tag @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=3] add ACV_createLightBridges_PARAM
start ACV_createLightBridges


ACV_handleSuccessfulPortals()
/kill @e[type=area_effect_cloud,name=ACV_Main]
/kill @e[type=area_effect_cloud,tag=ACV_Direction]
}



// Delete all duplicate ACV_Main and the corresponding directions to prevent simultanious creation of multiple portals with the same color.
process ACV_deleteRedundantMarkers {
/scoreboard players tag @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=0,score_ACV_COLOR=0,c=1] add ACV_notRedundant
/scoreboard players tag @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=1,score_ACV_COLOR=1,c=1] add ACV_notRedundant
/scoreboard players tag @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=2,score_ACV_COLOR=2,c=1] add ACV_notRedundant
/scoreboard players tag @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=3,score_ACV_COLOR=3,c=1] add ACV_notRedundant
/kill @e[type=area_effect_cloud,name=ACV_Main,tag=!ACV_notRedundant]

/execute @e[type=area_effect_cloud,name=ACV_Main] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,tag=ACV_Direction,dy=0] add ACV_notRedundant
/kill @e[type=area_effect_cloud,name=ACV_Up,tag=!ACV_notRedundant]
/kill @e[type=area_effect_cloud,name=ACV_Down,tag=!ACV_notRedundant]
/kill @e[type=area_effect_cloud,name=ACV_South,tag=!ACV_notRedundant]
/kill @e[type=area_effect_cloud,name=ACV_East,tag=!ACV_notRedundant]
/kill @e[type=area_effect_cloud,name=ACV_North,tag=!ACV_notRedundant]
/kill @e[type=area_effect_cloud,name=ACV_West,tag=!ACV_notRedundant]

/scoreboard players tag @e[type=area_effect_cloud,tag=ACV_notRedundant] remove ACV_notRedundant
}



// Spawn the area effect clouds and itemframes of a portal for each directional area effect cloud
// Params: AEC-ACV_PortalMain
// Return: AEC-ACV_PortalIn, AEC-ACV_PortalOut
process ACV_spawnPortals {
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up] ~ ~ ~0.46875 summon area_effect_cloud ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_Portal,ACV_TpProof,ACV_Up],Rotation:[0:0f,1:-90f],Duration:2147483647}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up] ~ ~ ~0.46875 summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_PortalIn",Tags:[ACV_Portal,ACV_TpProof,ACV_Up],Duration:2147483647}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down] ~ ~ ~0.46875 summon area_effect_cloud ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_Portal,ACV_TpProof,ACV_Down],Rotation:[0:0f,1:90f],Duration:2147483647}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down] ~ ~ ~0.46875 summon area_effect_cloud ~ ~ ~ {CustomName:"ACV_PortalIn",Tags:[ACV_Portal,ACV_TpProof,ACV_Down],Duration:2147483647}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_South] ~ ~ ~0.46875 summon area_effect_cloud ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_Portal,ACV_TpProof,ACV_South],Rotation:[0:0f,1:0f],Duration:2147483647}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_South] ~ ~ ~0.46875 summon area_effect_cloud ~ ~ ~-1 {CustomName:"ACV_PortalIn",Tags:[ACV_Portal,ACV_TpProof,ACV_South],Duration:2147483647}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_East] ~0.46875 ~ ~ summon area_effect_cloud ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_Portal,ACV_TpProof,ACV_East],Rotation:[0:-90f,1:0f],Duration:2147483647}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_East] ~0.46875 ~ ~ summon area_effect_cloud ~-1 ~ ~ {CustomName:"ACV_PortalIn",Tags:[ACV_Portal,ACV_TpProof,ACV_East],Duration:2147483647}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_North] ~ ~ ~-0.46875 summon area_effect_cloud ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_Portal,ACV_TpProof,ACV_North],Rotation:[0:180f,1:0f],Duration:2147483647}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_North] ~ ~ ~-0.46875 summon area_effect_cloud ~ ~ ~1 {CustomName:"ACV_PortalIn",Tags:[ACV_Portal,ACV_TpProof,ACV_North],Duration:2147483647}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_West] ~-0.46875 ~ ~ summon area_effect_cloud ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_Portal,ACV_TpProof,ACV_West],Rotation:[0:90f,1:0f],Duration:2147483647}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_West] ~-0.46875 ~ ~ summon area_effect_cloud ~1 ~ ~ {CustomName:"ACV_PortalIn",Tags:[ACV_Portal,ACV_TpProof,ACV_West],Duration:2147483647}

// Set the direction scores
/scoreboard players set @e[tag=ACV_Up] ACV_DIRECTION -1
/scoreboard players set @e[tag=ACV_Down] ACV_DIRECTION -2
/scoreboard players set @e[tag=ACV_South] ACV_DIRECTION 0
/scoreboard players set @e[tag=ACV_East] ACV_DIRECTION 3
/scoreboard players set @e[tag=ACV_North] ACV_DIRECTION 2
/scoreboard players set @e[tag=ACV_West] ACV_DIRECTION 1

// Set the color scores
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ scoreboard players operation @e[type=area_effect_cloud,name=ACV_PortalOut,dy=0] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,r=0,c=1] ACV_COLOR
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ scoreboard players operation @e[type=area_effect_cloud,name=ACV_PortalIn,dy=0] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,r=0,c=1] ACV_COLOR
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_South] ~ ~ ~ scoreboard players operation @e[type=area_effect_cloud,name=ACV_PortalIn,tag=ACV_South,dz=-1] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,tag=ACV_South,r=0,c=1] ACV_COLOR
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_East] ~ ~ ~ scoreboard players operation @e[type=area_effect_cloud,name=ACV_PortalIn,tag=ACV_East,dx=-1] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,tag=ACV_East,r=0,c=1] ACV_COLOR
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_North] ~ ~ ~ scoreboard players operation @e[type=area_effect_cloud,name=ACV_PortalIn,tag=ACV_North,dz=1] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,tag=ACV_North,r=0,c=1] ACV_COLOR
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_West] ~ ~ ~ scoreboard players operation @e[type=area_effect_cloud,name=ACV_PortalIn,tag=ACV_West,dx=1] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,tag=ACV_West,r=0,c=1] ACV_COLOR

// Teleport the new ACV_PortalOut to it's final position
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up] ~ ~-0.43 ~0.46875 tp @e[type=area_effect_cloud,name=ACV_PortalOut,tag=ACV_Up,dy=0] ~ ~2 ~
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down] ~ ~-0.43 ~0.46875 tp @e[type=area_effect_cloud,name=ACV_PortalOut,tag=ACV_Down,dy=0] ~ ~-2 ~
}



install {
  /scoreboard teams add ACV_BluePortal
  /scoreboard teams add ACV_OrangePortal
  /scoreboard teams add ACV_PurplePortal
  /scoreboard teams add ACV_RedPortal
  /scoreboard teams option ACV_BluePortal color aqua
  /scoreboard teams option ACV_OrangePortal color gold
  /scoreboard teams option ACV_PurplePortal color dark_blue
  /scoreboard teams option ACV_RedPortal color dark_red
}

uninstall {
  /scoreboard teams remove ACV_BluePortal
  /scoreboard teams remove ACV_OrangePortal
  /scoreboard teams remove ACV_PurplePortal
  /scoreboard teams remove ACV_RedPortal
}

// Spawn the texture armorstands and itemframes of the portals and join them to their color team
// Params: AEC-ACV_PortalMain
// Return: AS-ACV_PortalDisplay, IF-ACV_PortalDisplay
process ACV_texturePortals {
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up] ~ ~ ~ summon armor_stand ~-0.21 ~-1.51 ~0.7 {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_Up],Rotation:[0:-90f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up] ~ ~ ~ summon armor_stand ~-0.21 ~-1.51 ~0.25 {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_Up],Rotation:[0:0f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up] ~ ~ ~ summon armor_stand ~0.23 ~-1.51 ~0.25 {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_Up],Rotation:[0:90f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up] ~ ~ ~ summon armor_stand ~0.23 ~-1.51 ~0.7 {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_Up],Rotation:[0:180f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down] ~ ~ ~ summon armor_stand ~-0.21 ~-1.95 ~0.7 {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_Down],Rotation:[0:-90f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down] ~ ~ ~ summon armor_stand ~-0.21 ~-1.95 ~0.25 {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_Down],Rotation:[0:0f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down] ~ ~ ~ summon armor_stand ~0.23 ~-1.95 ~0.25 {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_Down],Rotation:[0:90f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down] ~ ~ ~ summon armor_stand ~0.23 ~-1.95 ~0.7 {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_Down],Rotation:[0:180f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_South] ~ ~ ~ summon item_frame ~ ~ ~ {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_South],Facing:0b,Invulnerable:1b,Glowing:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_South] ~ ~ ~ summon item_frame ~ ~1 ~ {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_South],Facing:0b,Invulnerable:1b,Glowing:1b}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_East] ~ ~ ~ summon item_frame ~ ~ ~ {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_East],Facing:3b,Invulnerable:1b,Glowing:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_East] ~ ~ ~ summon item_frame ~ ~1 ~ {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_East],Facing:3b,Invulnerable:1b,Glowing:1b}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_North] ~ ~ ~ summon item_frame ~ ~ ~ {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_North],Facing:2b,Invulnerable:1b,Glowing:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_North] ~ ~ ~ summon item_frame ~ ~1 ~ {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_North],Facing:2b,Invulnerable:1b,Glowing:1b}

/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_West] ~ ~ ~ summon item_frame ~ ~ ~ {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_West],Facing:1b,Invulnerable:1b,Glowing:1b}
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_West] ~ ~ ~ summon item_frame ~ ~1 ~ {CustomName:"ACV_PortalDisplay",Tags:[ACV_Portal,ACV_TpProof,ACV_West],Facing:1b,Invulnerable:1b,Glowing:1b}

// Set the color scores
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ scoreboard players operation @e[type=item_frame,name=ACV_PortalDisplay,dy=1] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,r=0,c=1] ACV_COLOR
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name=ACV_PortalDisplay,tag=ACV_Up,dy=-2] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Up,r=0,c=1] ACV_COLOR
/execute @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down] ~ ~ ~ scoreboard players operation @e[type=armor_stand,name=ACV_PortalDisplay,tag=ACV_Down,dy=-2] ACV_COLOR = @e[type=item_frame,name=ACV_PortalMain,tag=ACV_Down,r=0,c=1] ACV_COLOR


// texture blue portal
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~-2 ~ entitydata @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=0,score_ACV_COLOR=0,dy=0] {ArmorItems:[{},{},{},{id:"minecraft:skull",Count:1,Damage:3,tag:{SkullOwner:{Id:"cc01bc38-881f-420e-86d9-2308d28b5840",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmRhNmZiN2RlNzFhZjMyNTZhNjEzNWRjNjQ0NDRiNTY1ZGQ5YjkxMjM5NGUyNTU0MzViOWI3ZmQxYzU4MGFiIn19fQ=="}]}}}}]}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ entitydata @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=0,score_ACV_COLOR=0,dy=0] {Item:{Damage:0,id:"minecraft:filled_map",Count:1}}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~1 ~ entitydata @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=0,score_ACV_COLOR=0,dy=0] {Item:{Damage:1,id:"minecraft:filled_map",Count:1}}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ scoreboard teams join ACV_BluePortal @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=0,score_ACV_COLOR=0,dy=1]

// texture orange portal
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~-2 ~ entitydata @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=1,score_ACV_COLOR=1,dy=0] {ArmorItems:[{},{},{},{id:"minecraft:skull",Count:1,Damage:3,tag:{SkullOwner:{Id:"ff0f945d-8ef9-46f8-914d-53e0b5182a9e",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFlOTlhMjllYTc0YzUzOTdjOTQ3YWE5ZWQyMWE2NGYxMzUxMzIzNGZjYzFkYThmZDkwYjc5NWZkOTA4NSJ9fX0="}]}}}}]}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ entitydata @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=1,score_ACV_COLOR=1,dy=0] {Item:{Damage:2,id:"minecraft:filled_map",Count:1}}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~1 ~ entitydata @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=1,score_ACV_COLOR=1,dy=0] {Item:{Damage:3,id:"minecraft:filled_map",Count:1}}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ scoreboard teams join ACV_OrangePortal @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=1,score_ACV_COLOR=1,dy=1]

// texture purple portal
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~-2 ~ entitydata @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,score_ACV_COLOR=2,dy=0] {ArmorItems:[{},{},{},{id:"minecraft:skull",Count:1,Damage:3,tag:{SkullOwner:{Id:"f6937a89-7e05-4eb0-9928-ec8664e3d21a",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTlmODI4ODgyYjIyOTZmNzU1ZjY2YjY5NWM5YjQ4NGZkMjQzYzFiZmNmMjMxMzdmMTlhYzVhNTIxN2FmZGYifX19"}]}}}}]}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ entitydata @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,score_ACV_COLOR=2,dy=0] {Item:{Damage:4,id:"minecraft:filled_map",Count:1}}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~1 ~ entitydata @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,score_ACV_COLOR=2,dy=0] {Item:{Damage:5,id:"minecraft:filled_map",Count:1}}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ scoreboard teams join ACV_PurplePortal @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,score_ACV_COLOR=2,dy=1]

// texture red portal
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~-2 ~ entitydata @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=3,score_ACV_COLOR=3,dy=0] {ArmorItems:[{},{},{},{id:"minecraft:skull",Count:1,Damage:3,tag:{SkullOwner:{Id:"409b8064-7097-4059-b208-99f53f7d6bc3",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTIxYzg5YWM0ODI4YjcyNzllMmJlZWZkZWI1NzVjZmQ3YzEyNTU1M2VhMmMzZjZiNTNhNjUxODRlNTY4NTYifX19"}]}}}}]}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ entitydata @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=3,score_ACV_COLOR=3,dy=0] {Item:{Damage:6,id:"minecraft:filled_map",Count:1}}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~1 ~ entitydata @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=3,score_ACV_COLOR=3,dy=0] {Item:{Damage:7,id:"minecraft:filled_map",Count:1}}
/execute @e[type=item_frame,name=ACV_PortalMain] ~ ~ ~ scoreboard teams join ACV_RedPortal @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=3,score_ACV_COLOR=3,dy=1]
}



// Save the blocks that will be replaced by the portal connection
// Params: AEC-ACV_Main, AEC-ACV_PortalIn
process ACV_saveSurfaceBlocks {
ACV_loadChunks()
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ clone ~ ~ ~ ~ ~1 ~ 0 1 0
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ clone ~ ~ ~ ~ ~1 ~ 1 1 0
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ clone ~ ~ ~ ~ ~1 ~ 2 1 0
/execute @e[type=area_effect_cloud,name=ACV_Main,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ clone ~ ~ ~ ~ ~1 ~ 3 1 0
}



// Open the connection between the two portals if both exist (regardless weather they are currently beeing created)
// Params: AEC-ACV_Main, AEC-ACV_PortalIn, AS-ACV_PortalDisplay
process ACV_openConnections {
ACV_saveSurfaceBlocks()

// blue and orange
/execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ fill ~ ~ ~ ~ ~1 ~ piston_extension
// If only one of the portals exists set the surface of horizontal portals to barrier
invert: /execute @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ setblock ~ ~2 ~ barrier

// purple and red
/execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ execute @e[type=area_effect_cloud,name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ fill ~ ~ ~ ~ ~1 ~ piston_extension
// If only one of the portals exists set the surface of horizontal portals to barrier
invert: /execute @e[type=armor_stand,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ setblock ~ ~2 ~ barrier
}
