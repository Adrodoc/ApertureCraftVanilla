repeat process ACV_smoothTeleportation {
/scoreboard players reset @e ACV_TP_FROM
/scoreboard players reset @e ACV_TP_UNEVEN
/scoreboard players reset @e ACV_TP_TO
/scoreboard players reset @e ACV_TP_IR
/scoreboard players reset @e ACV_TP_OR

/execute @e[name=ACV_PortalIn] ~ ~ ~ scoreboard players operation @e[tag=!ACV_TpProof,dy=0] ACV_TP_FROM = @e[r=0,c=1] ACV_COLOR

// Only idle bridges and stopping anti bridges may be teleported
/scoreboard players reset @e[name=ACV_LightBridge] ACV_TP_FROM
/scoreboard players reset @e[name=ACV_LightBridgeEnd] ACV_TP_FROM
/scoreboard players reset @e[name=ACV_AntiBridge] ACV_TP_FROM

// Calulate the target portal
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ scoreboard players operation @e[r=0,c=1] ACV_TP_TO = @e[r=0,c=1] ACV_TP_FROM
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ scoreboard players operation @e[r=0,c=1] ACV_TP_UNEVEN = @e[r=0,c=1] ACV_TP_FROM
/scoreboard players operation @e[score_ACV_TP_FROM_min=0] ACV_TP_UNEVEN %= 2 ACV_CONSTANT
/scoreboard players add @e[score_ACV_TP_UNEVEN_min=0,score_ACV_TP_UNEVEN=0] ACV_TP_TO 1
/scoreboard players remove @e[score_ACV_TP_UNEVEN_min=1,score_ACV_TP_UNEVEN=1] ACV_TP_TO 1

// Assign In-Rotation
/execute @e[name=ACV_PortalIn] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_TO_min=0,tag=!ACV_TpProof,dy=0] ACV_TP_IR = @e[r=0,c=1] ACV_DIRECTION

// Assign Out-Rotation

// Bug Workaround: https://bugs.mojang.com/browse/MC-89667
// /tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
// /tp @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
// /tp @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
// /tp @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3]

// Bug Workaround: https://bugs.mojang.com/browse/MC-89667
///execute @e[name=ACV_PortalOut] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_TO_min=0,tag=!ACV_TpProof,dy=0] ACV_TP_OR = @e[r=0,c=1] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ACV_DIRECTION



// Rotation Calculation

// wenn id < 3 & od < 3
// rotdiff = pd - id + 6 mod 4
// wenn id > 3 & od < 3
// rotdiff = 0
// wenn od > 3
// rot = pd
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ scoreboard players operation @e[r=0,c=1] ACV_TP_RD = @e[r=0,c=1] ACV_TP_IR
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ scoreboard players operation @e[r=0,c=1] ACV_TP_RD -= @e[r=0,c=1] ACV_TP_OR
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ scoreboard players add @e[r=0,c=1] ACV_TP_RD 4
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ scoreboard players operation @e[r=0,c=1] ACV_TP_RD %= 4 ACV_CONSTANT

// Lightbridges may not be rotated, because the idle bridge is a fresh summon that always looks south
/scoreboard players set @e[tag=ACV_RotationProof] ACV_TP_IR -1

// when IR is up or down, but OR is on a wall (or it is a lightbridge)
/tp @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=0,score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
/tp @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=0,score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
/tp @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=0,score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
/tp @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=0,score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3]
/scoreboard players reset @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=0,score_ACV_TP_TO_min=0] ACV_TP_TO



// Teleport the entity to the other portal

// Bug Workaround: https://bugs.mojang.com/browse/MC-89667
/execute @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ teleport @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] ~ ~ ~
/execute @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ teleport @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] ~ ~ ~
/execute @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ teleport @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] ~ ~ ~
/execute @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ teleport @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] ~ ~ ~

// Rotate the entity

///tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=0,score_ACV_TP_ER=0] ~ ~ ~ ~0 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_RD_min=1,score_ACV_TP_RD=1] ~ ~ ~ ~90 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_RD_min=2,score_ACV_TP_RD=2] ~ ~ ~ ~180 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_RD_min=3,score_ACV_TP_RD=3] ~ ~ ~ ~-90 ~

}
