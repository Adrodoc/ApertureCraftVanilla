repeat process ACV_smoothTeleportation (
/scoreboard players reset @e ACV_TP_FROM
/scoreboard players reset @e ACV_TP_UNEVEN
/scoreboard players reset @e ACV_TP_TO
/scoreboard players reset @e ACV_TP_IR
/scoreboard players reset @e ACV_TP_OR
/scoreboard players reset @e ACV_TP_ER

/execute @e[name=ACV_PortalIn] ~ ~ ~ /scoreboard players operation @e[tag=!ACV_TpProof,dy=0] ACV_TP_FROM = @e[r=0,c=1] ACV_COLOR

# Only idle bridges and stopping anti bridges may be teleported
/scoreboard players reset @e[name=ACV_LightBridge] ACV_TP_FROM
/scoreboard players reset @e[name=ACV_LightBridgeEnd] ACV_TP_FROM
/scoreboard players reset @e[name=ACV_AntiBridge] ACV_TP_FROM

/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=-10,ry=11] ACV_TP_ER 0
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=12,ry=33] ACV_TP_ER 1
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=34,ry=56] ACV_TP_ER 2
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=57,ry=78] ACV_TP_ER 3
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=79,ry=101] ACV_TP_ER 4
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=102,ry=123] ACV_TP_ER 5
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=124,ry=146] ACV_TP_ER 6
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=147,ry=168] ACV_TP_ER 7
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=169,ry=-168] ACV_TP_ER 8
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=-167,ry=-146] ACV_TP_ER 9
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=-145,ry=-123] ACV_TP_ER 10
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=-122,ry=-101] ACV_TP_ER 11
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=-100,ry=-78] ACV_TP_ER 12
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=-77,ry=-56] ACV_TP_ER 13
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=-55,ry=-33] ACV_TP_ER 14
/scoreboard players set @e[score_ACV_TP_FROM_min=0,rym=-32,ry=-11] ACV_TP_ER 15

# Calulate the target portal
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ /scoreboard players operation @e[r=0,c=1] ACV_TP_TO = @e[r=0,c=1] ACV_TP_FROM
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ /scoreboard players operation @e[r=0,c=1] ACV_TP_UNEVEN = @e[r=0,c=1] ACV_TP_FROM
/scoreboard players operation @e[score_ACV_TP_FROM_min=0] ACV_TP_UNEVEN %= 2 ACV_CONSTANT
/scoreboard players add @e[score_ACV_TP_UNEVEN_min=0,score_ACV_TP_UNEVEN=0] ACV_TP_TO 1
/scoreboard players remove @e[score_ACV_TP_UNEVEN_min=1,score_ACV_TP_UNEVEN=1] ACV_TP_TO 1



# Assign In-Rotation
/execute @e[name=ACV_PortalIn] ~ ~ ~ /scoreboard players operation @e[score_ACV_TP_TO_min=0,tag=!ACV_TpProof,dy=0] ACV_TP_IR = @e[r=0,c=1] ACV_DIRECTION

# Assign Out-Rotation

# Bug Workaround: https://bugs.mojang.com/browse/MC-89667
# /tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
# /tp @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
# /tp @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
# /tp @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3]

# Bug Workaround: https://bugs.mojang.com/browse/MC-89667
#/execute @e[name=ACV_PortalOut] ~ ~ ~ /scoreboard players operation @e[score_ACV_TP_TO_min=0,tag=!ACV_TpProof,dy=0] ACV_TP_OR = @e[r=0,c=1] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ACV_DIRECTION
/scoreboard players operation @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ACV_DIRECTION



# Rotation Calculation

# wenn id < 3 & od < 3
# rotdiff = pd - id + 6 mod 4
# wenn id > 3 & od < 3
# rotdiff = 0
# wenn od > 3
# rot = pd
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ /scoreboard players operation @e[r=0,c=1] ACV_TP_ER -= @e[r=0,c=1] ACV_TP_IR
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ /scoreboard players add @e[r=0,c=1] ACV_TP_ER 24
/execute @e[score_ACV_TP_IR_min=0,score_ACV_TP_OR_min=0] ~ ~ ~ /scoreboard players operation @e[r=0,c=1] ACV_TP_ER %= 16 ACV_CONSTANT
# when IR is up or down, but not OR
/execute @e[score_ACV_TP_IR=-1,score_ACV_TP_OR_min=0] ~ ~ ~ /scoreboard players set @e[r=0,c=1] ACV_TP_ER 0

# Lightbridges may not be rotated, because the idle bridge is a fresh summon that always looks south
/scoreboard players set @e[tag=ACV_RotationProof] ACV_TP_ER 0



# Teleport the entity to the other portal

# Bug Workaround: https://bugs.mojang.com/browse/MC-89667
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
/tp @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
/tp @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
/tp @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3]



# Rotate the entity

#/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=0,score_ACV_TP_ER=0] ~ ~ ~ ~0 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=1,score_ACV_TP_ER=1] ~ ~ ~ ~22.5 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=2,score_ACV_TP_ER=2] ~ ~ ~ ~45 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=3,score_ACV_TP_ER=3] ~ ~ ~ ~67.5 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=4,score_ACV_TP_ER=4] ~ ~ ~ ~90 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=5,score_ACV_TP_ER=5] ~ ~ ~ ~112.5 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=6,score_ACV_TP_ER=6] ~ ~ ~ ~135 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=7,score_ACV_TP_ER=7] ~ ~ ~ ~157.5 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=8,score_ACV_TP_ER=8] ~ ~ ~ ~180 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=9,score_ACV_TP_ER=9] ~ ~ ~ ~-157.5 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=10,score_ACV_TP_ER=10] ~ ~ ~ ~-135 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=11,score_ACV_TP_ER=11] ~ ~ ~ ~-112.5 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=12,score_ACV_TP_ER=12] ~ ~ ~ ~-90 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=13,score_ACV_TP_ER=13] ~ ~ ~ ~-67.5 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=14,score_ACV_TP_ER=14] ~ ~ ~ ~-45 ~
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=15,score_ACV_TP_ER=15] ~ ~ ~ ~-22.5 ~

)
