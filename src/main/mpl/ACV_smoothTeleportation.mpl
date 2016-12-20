repeat process ACV_smoothTeleportation {
/scoreboard players reset @e ACV_TP_FROM
/scoreboard players reset @e ACV_TP_UNEVEN
/scoreboard players reset @e ACV_TP_TO
/scoreboard players reset @e ACV_TP_IR
/scoreboard players reset @e ACV_TP_OR
/scoreboard players reset @e ACV_TP_RD

/execute @e[type=armor_stand,name=ACV_PortalIn] ~ ~ ~ scoreboard players operation @e[tag=!ACV_TpProof,dy=0] ACV_TP_FROM = @e[type=armor_stand,name=ACV_PortalIn,r=0,c=1] ACV_COLOR

// Calulate the target portal
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_FROM_min=0,r=0,c=1] ACV_TP_TO = @e[score_ACV_TP_FROM_min=0,r=0,c=1] ACV_TP_FROM
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_FROM_min=0,r=0,c=1] ACV_TP_UNEVEN = @e[score_ACV_TP_FROM_min=0,r=0,c=1] ACV_TP_FROM
/scoreboard players operation @e[score_ACV_TP_FROM_min=0] ACV_TP_UNEVEN %= 2 ACV_CONSTANT
/scoreboard players add @e[score_ACV_TP_UNEVEN_min=0,score_ACV_TP_UNEVEN=0] ACV_TP_TO 1
/scoreboard players remove @e[score_ACV_TP_UNEVEN_min=1,score_ACV_TP_UNEVEN=1] ACV_TP_TO 1

// Assign In-Rotation
/execute @e[type=armor_stand,name=ACV_PortalIn] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_TO_min=0,dy=0] ACV_TP_IR = @e[type=armor_stand,name=ACV_PortalIn,r=0,c=1] ACV_DIRECTION

// Lightbridges must be rotated to look away from the portal, because the idle bridge is a fresh summon that always looks south
/scoreboard players set @e[tag=ACV_RotationProof] ACV_TP_IR -1

// Assign Out-Rotation

// Bug Workaround: https://bugs.mojang.com/browse/MC-89667
// /tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
// /tp @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
// /tp @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
// /tp @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3]
///execute @e[name=ACV_PortalOut] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_TO_min=0,tag=!ACV_TpProof,dy=0] ACV_TP_OR = @e[r=0,c=1] ACV_DIRECTION

// Bug Workaround: https://bugs.mojang.com/browse/MC-89667
/scoreboard players operation @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] ACV_TP_OR = @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] ACV_TP_OR = @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] ACV_TP_OR = @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] ACV_TP_OR = @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ACV_DIRECTION

// Rotation Calculation
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0,r=0,c=1] ACV_TP_RD = @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0,r=0,c=1] ACV_TP_IR
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0,r=0,c=1] ACV_TP_RD -= @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0,r=0,c=1] ACV_TP_OR
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ scoreboard players add @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0,r=0,c=1] ACV_TP_RD 4
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0,r=0,c=1] ACV_TP_RD %= 4 ACV_CONSTANT

// Teleport the entity to the other portal

// Bug Workaround: https://bugs.mojang.com/browse/MC-89667
/execute @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ~ ~ ~ teleport @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] ~ ~ ~
/execute @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ~ ~ ~ teleport @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] ~ ~ ~
/execute @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ~ ~ ~ teleport @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] ~ ~ ~
/execute @e[type=armor_stand,name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ~ ~ ~ teleport @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] ~ ~ ~

// Rotate the entity
/tp @e[score_ACV_TP_RD_min=0,score_ACV_TP_RD=0] ~ ~ ~ ~180 ~
/tp @e[score_ACV_TP_RD_min=1,score_ACV_TP_RD=1] ~ ~ ~ ~90 ~
//tp @e[score_ACV_TP_RD_min=2,score_ACV_TP_RD=2] ~ ~ ~ ~0 ~
/tp @e[score_ACV_TP_RD_min=3,score_ACV_TP_RD=3] ~ ~ ~ ~-90 ~

// when IR is up or down, but OR is on a wall (or it is a lightbridge)
/tp @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=0,score_ACV_TP_OR=0] ~ ~ ~ 0 ~
/tp @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=1,score_ACV_TP_OR=1] ~ ~ ~ 90 ~
/tp @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=2,score_ACV_TP_OR=2] ~ ~ ~ 180 ~
/tp @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=3,score_ACV_TP_OR=3] ~ ~ ~ -90 ~

// Lightbridges must look also look away from horizontal portals
/tp @e[tag=ACV_RotationProof,score_ACV_TP_OR_min=-1,score_ACV_TP_OR=-1] ~ ~ ~ ~ -90
/tp @e[tag=ACV_RotationProof,score_ACV_TP_OR_min=-2,score_ACV_TP_OR=-2] ~ ~ ~ ~ 90
}
