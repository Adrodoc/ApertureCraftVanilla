repeat process ACV_teleportation {
/scoreboard players reset @e ACV_TP_FROM
/scoreboard players reset @e ACV_TP_UNEVEN
/scoreboard players reset @e ACV_TP_TO

/execute @e[type=area_effect_cloud,name=ACV_PortalIn] ~ ~ ~ scoreboard players operation @e[tag=!ACV_TpProof,dy=0] ACV_TP_FROM = @e[type=area_effect_cloud,name=ACV_PortalIn,r=0,c=1] ACV_COLOR
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~-500 ~ scoreboard players operation @e[tag=!ACV_TpProof,rm=500,dy=500] ACV_TP_FROM = @e[type=area_effect_cloud,name=ACV_PortalIn,dy=0,c=1] ACV_COLOR

// Calulate the target portal
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_FROM_min=0,r=0,c=1] ACV_TP_TO = @e[score_ACV_TP_FROM_min=0,r=0,c=1] ACV_TP_FROM
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ scoreboard players operation @e[score_ACV_TP_FROM_min=0,r=0,c=1] ACV_TP_UNEVEN = @e[score_ACV_TP_FROM_min=0,r=0,c=1] ACV_TP_FROM
/scoreboard players operation @e[score_ACV_TP_FROM_min=0] ACV_TP_UNEVEN %= 2 ACV_CONSTANT
/scoreboard players add @e[score_ACV_TP_UNEVEN_min=0,score_ACV_TP_UNEVEN=0] ACV_TP_TO 1
/scoreboard players remove @e[score_ACV_TP_UNEVEN_min=1,score_ACV_TP_UNEVEN=1] ACV_TP_TO 1

// Teleport the entity to the other portal
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] @e[type=area_effect_cloud,name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
/tp @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] @e[type=area_effect_cloud,name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
/tp @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] @e[type=area_effect_cloud,name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
/tp @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] @e[type=area_effect_cloud,name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3]

// Laser boats must be 500 blocks above the displayed laser
/tp @e[type=boat,name=ACV_LaserBoat,score_ACV_TP_TO_min=0] ~ ~500 ~ ~180 ~
}
