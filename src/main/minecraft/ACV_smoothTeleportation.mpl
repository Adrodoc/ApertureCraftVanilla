repeat process ACV_smoothTeleportation (
/scoreboard players reset @e ACV_TP_FROM
/scoreboard players reset @e ACV_TP_UNEVEN
/scoreboard players reset @e ACV_TP_TO
/scoreboard players reset @e ACV_TP_IR
/scoreboard players reset @e ACV_TP_OR
/scoreboard players reset @e ACV_TP_ER
/scoreboard players reset @e ACV_TP_AR

/scoreboard players set @a[rym=45,ry=135] ACV_TP_ER 0
/scoreboard players set @a[rym=135,ry=-135] ACV_TP_ER 1
/scoreboard players set @a[rym=-135,ry=-45] ACV_TP_ER 2
/scoreboard players set @a[rym=-45,ry=45] ACV_TP_ER 3

/execute @e[name=ACV_PortalIn] ~ ~ ~ /scoreboard players operation @e[name=!ACV_PortalIn,r=0] ACV_TP_FROM = @e[name=ACV_PortalIn,r=0,c=1] ACV_COLOR
/scoreboard players reset @e[name=ACV_LightBridge] ACV_TP_FROM
/scoreboard players reset @e[name=ACV_LightBridgeEnd] ACV_TP_FROM
/scoreboard players reset @e[name=ACV_AntiBridge] ACV_TP_FROM
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ /scoreboard players operation @e[r=0,c=1] ACV_TP_TO = @e[r=0,c=1] ACV_TP_FROM
/execute @e[score_ACV_TP_FROM_min=0] ~ ~ ~ /scoreboard players operation @e[r=0,c=1] ACV_TP_UNEVEN = @e[r=0,c=1] ACV_TP_FROM
/scoreboard players operation @e[score_ACV_TP_FROM_min=0] ACV_TP_UNEVEN %= 2 ACV_CONSTANT
/scoreboard players add @e[score_ACV_TP_UNEVEN_min=0,score_ACV_TP_UNEVEN=0] ACV_TP_TO 1
/scoreboard players remove @e[score_ACV_TP_UNEVEN_min=1,score_ACV_TP_UNEVEN=1] ACV_TP_TO 1

# /execute @e[name=ACV_PortalIn] ~ ~ ~ /scoreboard players operation @e[score_ACV_TP_TO_min=0,name=!ACV_PortalIn,r=0] ACV_TP_IR = @e[name=ACV_PortalIn,r=0,c=1] ACV_DIRECTION
/execute @e[name=ACV_PortalIn] ~ ~ ~ /scoreboard players operation @a[score_ACV_TP_TO_min=0,name=!ACV_PortalIn,r=0] ACV_TP_IR = @e[name=ACV_PortalIn,r=0,c=1] ACV_DIRECTION



# Bug Workaround: https://bugs.mojang.com/browse/MC-89667
# /tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
# /tp @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
# /tp @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
# /tp @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3]

# Bug Workaround: https://bugs.mojang.com/browse/MC-89667
#/execute @e[name=ACV_PortalOut] ~ ~ ~ /scoreboard players operation @e[score_ACV_TP_TO_min=0,name=!ACV_PortalOut,r=0] ACV_TP_OR = @e[name=ACV_PortalOut,r=0,c=1] ACV_DIRECTION
/scoreboard players operation @a[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0] ACV_DIRECTION
/scoreboard players operation @a[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1] ACV_DIRECTION
/scoreboard players operation @a[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2] ACV_DIRECTION
/scoreboard players operation @a[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] ACV_TP_OR = @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3] ACV_DIRECTION



# Rotation Calculation

# wenn id < 3 & od < 3
# rotdiff = pd - id + 6 mod 4
# wenn id > 3 & od < 3
# rotdiff = 0
# wenn od > 3
# rot = pd
/execute @a[score_ACV_TP_IR_min=0,score_ACV_TP_IR=3,score_ACV_TP_OR_min=0,score_ACV_TP_OR=3] ~ ~ ~ /scoreboard players operation @p ACV_TP_ER -= @e[r=0,c=1] ACV_TP_IR
/execute @a[score_ACV_TP_IR_min=0,score_ACV_TP_IR=3,score_ACV_TP_OR_min=0,score_ACV_TP_OR=3] ~ ~ ~ /scoreboard players add @p ACV_TP_ER 6
/execute @a[score_ACV_TP_IR_min=0,score_ACV_TP_IR=3,score_ACV_TP_OR_min=0,score_ACV_TP_OR=3] ~ ~ ~ /scoreboard players operation @p ACV_TP_ER %= 4 ACV_CONSTANT
/execute @a[score_ACV_TP_IR_min=4,score_ACV_TP_IR=5,score_ACV_TP_OR_min=0,score_ACV_TP_OR=3] ~ ~ ~ /scoreboard players set @p ACV_TP_ER 0
/execute @a[score_ACV_TP_OR_min=4,score_ACV_TP_OR=5] ~ ~ ~ /scoreboard players operation @p ACV_TP_AR = @p ACV_TP_ER




# Bug Workaround: https://bugs.mojang.com/browse/MC-89667
/tp @e[score_ACV_TP_TO_min=0,score_ACV_TP_TO=0] @e[name=ACV_PortalOut,score_ACV_COLOR_min=0,score_ACV_COLOR=0]
/tp @e[score_ACV_TP_TO_min=1,score_ACV_TP_TO=1] @e[name=ACV_PortalOut,score_ACV_COLOR_min=1,score_ACV_COLOR=1]
/tp @e[score_ACV_TP_TO_min=2,score_ACV_TP_TO=2] @e[name=ACV_PortalOut,score_ACV_COLOR_min=2,score_ACV_COLOR=2]
/tp @e[score_ACV_TP_TO_min=3,score_ACV_TP_TO=3] @e[name=ACV_PortalOut,score_ACV_COLOR_min=3,score_ACV_COLOR=3]



# /tp @e[score_ACV_TP_ER_min=0,score_ACV_TP_ER=0] ~ ~ ~ ~ ~
/tp @a[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=1,score_ACV_TP_ER=1] ~ ~ ~ ~90 ~
/tp @a[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=2,score_ACV_TP_ER=2] ~ ~ ~ ~180 ~
/tp @a[score_ACV_TP_TO_min=0,score_ACV_TP_ER_min=3,score_ACV_TP_ER=3] ~ ~ ~ ~-90 ~

/tp @a[score_ACV_TP_TO_min=0,score_ACV_TP_AR_min=0,score_ACV_TP_AR=0] ~ ~ ~ 90 ~
/tp @a[score_ACV_TP_TO_min=0,score_ACV_TP_AR_min=1,score_ACV_TP_AR=1] ~ ~ ~ 180 ~
/tp @a[score_ACV_TP_TO_min=0,score_ACV_TP_AR_min=2,score_ACV_TP_AR=2] ~ ~ ~ -90 ~
/tp @a[score_ACV_TP_TO_min=0,score_ACV_TP_AR_min=3,score_ACV_TP_AR=3] ~ ~ ~ 0 ~
)
