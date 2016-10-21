// Description:
// Params: AS-ACV_Main, dASwT-ACV_DV_PARAM, SCV-color-Color
// Return: ASwS-ACV_COLOR, IFwS-ACV_COLOR
impulse process ACV_createPortal {
start ACV_validateDirections
/summon ArmorStand ${this + 1} {CustomName:"ACV_validateDirections_return",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
skip
impulse: /setblock ${this - 1} stone
if not: /testfor @e[type=ArmorStand,tag=ACV_DV_RESULT]
then {
  start ACV_createPortalFailed
} else {
  start ACV_createNewPortal
}
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

impulse process ACV_createNewPortal {
/summon ArmorStand ~ ~ ~ {CustomName:"ACV_deletePortal_PARAM",Tags:["ACV_deletePortal_PARAM"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/scoreboard players operation @e[name=ACV_deletePortal_PARAM] ACV_COLOR = Color ACV_Internal
ACV_deletePortal()

// Description: Creates a Portal
// Params: AS-ACV_Main, dAS, SCV-color-Color
// Return: AS-ACV_PortalOut, AS-ACV_PortalIn, AS-ACV_PortalDisplay, IF-ACV_PortalDisplay
//CREATE_PORTAL {
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~-1 ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalMain",Facing:0b,Invulnerable:1b}
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~1 ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalMain",Facing:0b,Invulnerable:1b}
/execute @e[name=ACV_South] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~-1 ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalMain",Facing:0b,Invulnerable:1b}
/execute @e[name=ACV_East] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~-1 ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalMain",Facing:3b,Invulnerable:1b}
/execute @e[name=ACV_North] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~-1 ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalMain",Facing:2b,Invulnerable:1b}
/execute @e[name=ACV_West] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~-1 ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalMain",Facing:1b,Invulnerable:1b}

/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~0.46875 /summon ArmorStand ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_TpProof],Rotation:[0:0f,1:-90f],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~0.46875 /summon ArmorStand ~ ~ ~ {CustomName:"ACV_PortalIn",Tags:[ACV_TpProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ArmorStand ~-0.21 ~-1.51 ~0.7 {CustomName:"ACV_PortalDisplay",Tags:[ACV_TpProof],Rotation:[0:-90f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ArmorStand ~-0.21 ~-1.51 ~0.25 {CustomName:"ACV_PortalDisplay",Tags:[ACV_TpProof],Rotation:[0:0f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ArmorStand ~0.23 ~-1.51 ~0.25 {CustomName:"ACV_PortalDisplay",Tags:[ACV_TpProof],Rotation:[0:90f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ArmorStand ~0.23 ~-1.51 ~0.7 {CustomName:"ACV_PortalDisplay",Tags:[ACV_TpProof],Rotation:[0:180f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}

/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~0.46875 /summon ArmorStand ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_TpProof],Rotation:[0:0f,1:90f],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~0.46875 /summon ArmorStand ~ ~ ~ {CustomName:"ACV_PortalIn",Tags:[ACV_TpProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ArmorStand ~-0.21 ~-1.95 ~0.7 {CustomName:"ACV_PortalDisplay",Tags:[ACV_TpProof],Rotation:[0:-90f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ArmorStand ~-0.21 ~-1.95 ~0.25 {CustomName:"ACV_PortalDisplay",Tags:[ACV_TpProof],Rotation:[0:0f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ArmorStand ~0.23 ~-1.95 ~0.25 {CustomName:"ACV_PortalDisplay",Tags:[ACV_TpProof],Rotation:[0:90f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ArmorStand ~0.23 ~-1.95 ~0.7 {CustomName:"ACV_PortalDisplay",Tags:[ACV_TpProof],Rotation:[0:180f,1:0f],DisabledSlots:2035728,NoGravity:1b,Invisible:1b,Invulnerable:1b}

/execute @e[name=ACV_South] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~0.46875 /summon ArmorStand ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_TpProof],Rotation:[0:0f,1:0f],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_South] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~0.46875 /summon ArmorStand ~ ~ ~-1 {CustomName:"ACV_PortalIn",Tags:[ACV_TpProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_South] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalDisplay",Facing:0b,Invulnerable:1b,Glowing:1b}
/execute @e[name=ACV_South] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ItemFrame ~ ~1 ~ {CustomName:"ACV_PortalDisplay",Facing:0b,Invulnerable:1b,Glowing:1b}

/execute @e[name=ACV_East] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~0.46875 ~ ~ /summon ArmorStand ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_TpProof],Rotation:[0:-90f,1:0f],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_East] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~0.46875 ~ ~ /summon ArmorStand ~-1 ~ ~ {CustomName:"ACV_PortalIn",Tags:[ACV_TpProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_East] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalDisplay",Facing:3b,Invulnerable:1b,Glowing:1b}
/execute @e[name=ACV_East] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ItemFrame ~ ~1 ~ {CustomName:"ACV_PortalDisplay",Facing:3b,Invulnerable:1b,Glowing:1b}

/execute @e[name=ACV_North] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~-0.46875 /summon ArmorStand ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_TpProof],Rotation:[0:180f,1:0f],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_North] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~-0.46875 /summon ArmorStand ~ ~ ~1 {CustomName:"ACV_PortalIn",Tags:[ACV_TpProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_North] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalDisplay",Facing:2b,Invulnerable:1b,Glowing:1b}
/execute @e[name=ACV_North] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ItemFrame ~ ~1 ~ {CustomName:"ACV_PortalDisplay",Facing:2b,Invulnerable:1b,Glowing:1b}

/execute @e[name=ACV_West] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~-0.46875 ~ ~ /summon ArmorStand ~ ~-0.43 ~ {CustomName:"ACV_PortalOut",Tags:[ACV_TpProof],Rotation:[0:90f,1:0f],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_West] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~-0.46875 ~ ~ /summon ArmorStand ~1 ~ ~ {CustomName:"ACV_PortalIn",Tags:[ACV_TpProof],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_West] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ItemFrame ~ ~ ~ {CustomName:"ACV_PortalDisplay",Facing:1b,Invulnerable:1b,Glowing:1b}
/execute @e[name=ACV_West] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /summon ItemFrame ~ ~1 ~ {CustomName:"ACV_PortalDisplay",Facing:1b,Invulnerable:1b,Glowing:1b}

// Set the scores to -1 so -1 can be used as a constant since there is no variable tunneling
/execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~-0.43 ~ /scoreboard players set @e[type=ArmorStand,name=ACV_PortalOut,dy=0] ACV_COLOR -1
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~-0.43 ~0.46875 /tp @e[name=ArmorStand,name=ACV_PortalOut,dy=0] ~ ~2 ~
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~-0.43 ~0.46875 /tp @e[name=ArmorStand,name=ACV_PortalOut,dy=0] ~ ~-2 ~
/execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /scoreboard players set @e[type=ItemFrame,name=ACV_PortalDisplay,dy=0] ACV_COLOR -1
/execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~1 ~ /scoreboard players set @e[type=ItemFrame,name=ACV_PortalDisplay,dy=0] ACV_COLOR -1
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~-1.51 ~ /scoreboard players set @e[type=ArmorStand,name=ACV_PortalDisplay,dy=0] ACV_COLOR -1
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~-1.95 ~ /scoreboard players set @e[type=ArmorStand,name=ACV_PortalDisplay,dy=0] ACV_COLOR -1
/execute @e[name=ACV_Up] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /scoreboard players set @e[type=ArmorStand,name=ACV_PortalIn,dy=0] ACV_COLOR -1
/execute @e[name=ACV_Down] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /scoreboard players set @e[type=ArmorStand,name=ACV_PortalIn,dy=0] ACV_COLOR -1
/execute @e[name=ACV_South] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~-1 /scoreboard players set @e[type=ArmorStand,name=ACV_PortalIn,dy=0] ACV_COLOR -1
/execute @e[name=ACV_East] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~-1 ~ ~ /scoreboard players set @e[type=ArmorStand,name=ACV_PortalIn,dy=0] ACV_COLOR -1
/execute @e[name=ACV_North] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~1 /scoreboard players set @e[type=ArmorStand,name=ACV_PortalIn,dy=0] ACV_COLOR -1
/execute @e[name=ACV_West] ~ ~ ~ /execute @e[type=ItemFrame,name=ACV_PortalMain] ~1 ~ ~ /scoreboard players set @e[type=ArmorStand,name=ACV_PortalIn,dy=0] ACV_COLOR -1

/execute @e[name=ACV_Up] ~ ~ ~ /scoreboard players set @e[score_ACV_COLOR=-1,type=ArmorStand] ACV_DIRECTION -1
/execute @e[name=ACV_Down] ~ ~ ~ /scoreboard players set @e[score_ACV_COLOR=-1,type=ArmorStand] ACV_DIRECTION -2
/execute @e[name=ACV_South] ~ ~ ~ /scoreboard players set @e[score_ACV_COLOR=-1,type=ArmorStand] ACV_DIRECTION 0
/execute @e[name=ACV_East] ~ ~ ~ /scoreboard players set @e[score_ACV_COLOR=-1,type=ArmorStand] ACV_DIRECTION 12
/execute @e[name=ACV_North] ~ ~ ~ /scoreboard players set @e[score_ACV_COLOR=-1,type=ArmorStand] ACV_DIRECTION 8
/execute @e[name=ACV_West] ~ ~ ~ /scoreboard players set @e[score_ACV_COLOR=-1,type=ArmorStand] ACV_DIRECTION 4



//TEXTURE PORTALS {
if: /scoreboard players test Color ACV_Internal 0 0
then {
  /entitydata @e[score_ACV_COLOR=-1,type=ArmorStand,name=ACV_PortalDisplay] {ArmorItems:[{},{},{},{id:"minecraft:skull",Count:1,Damage:3,tag:{SkullOwner:{Id:"cc01bc38-881f-420e-86d9-2308d28b5840",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmRhNmZiN2RlNzFhZjMyNTZhNjEzNWRjNjQ0NDRiNTY1ZGQ5YjkxMjM5NGUyNTU0MzViOWI3ZmQxYzU4MGFiIn19fQ=="}]}}}}]}

               /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /entitydata @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay,dy=0] {Item:{Damage:0,id:"minecraft:filled_map",Count:1}}
  conditional: /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~1 ~ /entitydata @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay,dy=0] {Item:{Damage:1,id:"minecraft:filled_map",Count:1}}
  conditional: /scoreboard teams join ACV_BluePortal @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay]
}

if: /scoreboard players test Color ACV_Internal 1 1
then {
  /entitydata @e[score_ACV_COLOR=-1,type=ArmorStand,name=ACV_PortalDisplay] {ArmorItems:[{},{},{},{id:"minecraft:skull",Count:1,Damage:3,tag:{SkullOwner:{Id:"ff0f945d-8ef9-46f8-914d-53e0b5182a9e",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFlOTlhMjllYTc0YzUzOTdjOTQ3YWE5ZWQyMWE2NGYxMzUxMzIzNGZjYzFkYThmZDkwYjc5NWZkOTA4NSJ9fX0="}]}}}}]}

               /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /entitydata @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay,dy=0] {Item:{Damage:2,id:"minecraft:filled_map",Count:1}}
  conditional: /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~1 ~ /entitydata @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay,dy=0] {Item:{Damage:3,id:"minecraft:filled_map",Count:1}}
  conditional: /scoreboard teams join ACV_OrangePortal @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay]
}

if: /scoreboard players test Color ACV_Internal 2 2
then {
  /entitydata @e[score_ACV_COLOR=-1,type=ArmorStand,name=ACV_PortalDisplay] {ArmorItems:[{},{},{},{id:"minecraft:skull",Count:1,Damage:3,tag:{SkullOwner:{Id:"f6937a89-7e05-4eb0-9928-ec8664e3d21a",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTlmODI4ODgyYjIyOTZmNzU1ZjY2YjY5NWM5YjQ4NGZkMjQzYzFiZmNmMjMxMzdmMTlhYzVhNTIxN2FmZGYifX19"}]}}}}]}

               /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /entitydata @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay,dy=0] {Item:{Damage:4,id:"minecraft:filled_map",Count:1}}
  conditional: /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~1 ~ /entitydata @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay,dy=0] {Item:{Damage:5,id:"minecraft:filled_map",Count:1}}
  conditional: /scoreboard teams join ACV_PurplePortal @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay]
}

if: /scoreboard players test Color ACV_Internal 3 3
then {
  /entitydata @e[score_ACV_COLOR=-1,type=ArmorStand,name=ACV_PortalDisplay] {ArmorItems:[{},{},{},{id:"minecraft:skull",Count:1,Damage:3,tag:{SkullOwner:{Id:"409b8064-7097-4059-b208-99f53f7d6bc3",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTIxYzg5YWM0ODI4YjcyNzllMmJlZWZkZWI1NzVjZmQ3YzEyNTU1M2VhMmMzZjZiNTNhNjUxODRlNTY4NTYifX19"}]}}}}]}

               /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~ ~ /entitydata @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay,dy=0] {Item:{Damage:6,id:"minecraft:filled_map",Count:1}}
  conditional: /execute @e[type=ItemFrame,name=ACV_PortalMain] ~ ~1 ~ /entitydata @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay,dy=0] {Item:{Damage:7,id:"minecraft:filled_map",Count:1}}
  conditional: /scoreboard teams join ACV_RedPortal @e[score_ACV_COLOR=-1,type=ItemFrame,name=ACV_PortalDisplay]
}
//TEXTURE PORTALS }



// Set the scores fom -1 to their actual value
/scoreboard players operation @e[score_ACV_COLOR=-1] ACV_COLOR = Color ACV_Internal

/kill @e[type=ItemFrame,name=ACV_PortalMain]
//CREATE_PORTAL }



// Description: Saves the blocks that will be replaced by the portal
// Params: AS-ACV_PortalIn, SCV-color-Color
// Return:
//SAVE_BLOCK_SURFACE {
/scoreboard players test Color ACV_Internal 0 0
conditional: /execute @e[name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ /clone ~ ~ ~ ~ ~1 ~ 0 1 0
/scoreboard players test Color ACV_Internal 1 1
conditional: /execute @e[name=ACV_PortalIn,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ /clone ~ ~ ~ ~ ~1 ~ 1 1 0
/scoreboard players test Color ACV_Internal 2 2
conditional: /execute @e[name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ /clone ~ ~ ~ ~ ~1 ~ 2 1 0
/scoreboard players test Color ACV_Internal 3 3
conditional: /execute @e[name=ACV_PortalIn,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ /clone ~ ~ ~ ~ ~1 ~ 3 1 0
//SAVE_BLOCK_SURFACE }



// Description: Opens the connection between the two portals specified by the color if both exist
// Params: SCV-color-Color
// Return:
//OPEN_CONNECTION {
/scoreboard players test Color ACV_Internal 0 1
conditional: /testfor @e[name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
conditional: /testfor @e[name=ACV_PortalIn,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
conditional: /execute @e[name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ /fill ~ ~ ~ ~ ~1 ~ piston_extension
// If only one of the portals exists set the surface to barrier if is a horizontal portal
invert: /scoreboard players test Color ACV_Internal 0 1
conditional: /execute @e[type=ArmorStand,name=ACV_PortalDisplay,score_ACV_COLOR_min=0,score_ACV_COLOR=1] ~ ~ ~ /setblock ~ ~2 ~ barrier

/scoreboard players test Color ACV_Internal 2 3
conditional: /testfor @e[name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
conditional: /testfor @e[name=ACV_PortalIn,score_ACV_COLOR_min=3,score_ACV_COLOR=3]
conditional: /execute @e[name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ /fill ~ ~ ~ ~ ~1 ~ piston_extension
// If only one of the portals exists set the surface to barrier if is a horizontal portal
invert: /scoreboard players test Color ACV_Internal 2 3
conditional: /execute @e[type=ArmorStand,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,score_ACV_COLOR=3] ~ ~ ~ /setblock ~ ~2 ~ barrier
//OPEN_CONNECTION }



ACV_createPortalSucceeded()
/scoreboard players test Color ACV_Internal 0 1
conditional: /scoreboard players tag @e[name=ACV_PortalIn,score_ACV_COLOR_min=0,score_ACV_COLOR=1] add ACV_CLB_PARAM
/scoreboard players test Color ACV_Internal 2 3
conditional: /scoreboard players tag @e[name=ACV_PortalIn,score_ACV_COLOR_min=2,score_ACV_COLOR=3] add ACV_CLB_PARAM
start ACV_calculateLightBridges
}
