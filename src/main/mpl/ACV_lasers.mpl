repeat process ACV_lasers {
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~-499.7 ~ particle reddust ~ ~ ~ 0.1 0.1 0.1 0 10 force

// Kill redundant laser boats to avoid interlocking
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=-1] add ACV_notRedundant
/tp @e[type=boat,name=ACV_LaserBoat,tag=!ACV_notRedundant] ~ -100 ~

// Redirection
/scoreboard players tag @e[type=boat,name=ACV_LaserBoat,tag=ACV_InCube] remove ACV_InCube
/execute @e[type=armor_stand,name=ACV_Cube,tag=ACV_Redirecting] ~ ~501.65 ~ scoreboard players tag @e[type=boat,name=ACV_LaserBoat,dy=0] add ACV_InCube

// Movement
/scoreboard players tag @e[type=armor_stand,name=ACV_LaserPassenger2,tag=!ACV_VerticalLaser] add ACV_VerticalLaser
/execute @e[type=boat,name=ACV_LaserBoat,rxm=0,rx=0] ~ ~.7999999 ~ scoreboard players tag @e[type=armor_stand,name=ACV_LaserPassenger2,c=-1,r=1] remove ACV_VerticalLaser
/execute @e[type=armor_stand,name=ACV_LaserPassenger2,tag=!ACV_VerticalLaser] ~ ~.7999999 ~ teleport @e[type=boat,name=ACV_LaserBoat,c=-1,r=1] ~ ~-.7999999 ~
/tp @e[type=boat,name=ACV_LaserBoat,rxm=1,rx=90] ~ ~-0.6 ~
/tp @e[type=boat,name=ACV_LaserBoat,rxm=-90,rx=-1] ~ ~0.6 ~

// Collission Detection
/scoreboard players tag @e[type=boat,name=ACV_LaserBoat,tag=ACV_InAir] remove ACV_InAir
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ detect ~ ~-500 ~ air * scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=1] add ACV_InAir
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ detect ~ ~-500 ~ piston_extension * scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=1] add ACV_InAir
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ detect ~ ~-500 ~ carpet * scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=1] add ACV_InAir
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ detect ~ ~-500 ~ glass * scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=1] add ACV_InAir
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ detect ~ ~-500 ~ stained_glass * scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=1] add ACV_InAir
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ detect ~ ~-500 ~ glass_pane * scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=1] add ACV_InAir
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ detect ~ ~-500 ~ stained_glass_pane * scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=1] add ACV_InAir
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ detect ~ ~-500 ~ iron_bars * scoreboard players tag @e[type=boat,name=ACV_LaserBoat,r=1,c=1] add ACV_InAir
/tp @e[type=boat,name=ACV_LaserBoat,tag=!ACV_InAir] ~ -100 ~

// Redirection
/execute @e[type=armor_stand,name=ACV_Cube,tag=!ACV_Redirecting] ~ ~501.65 ~ tp @e[type=boat,name=ACV_LaserBoat,dy=0] ~ -100 ~

/scoreboard players tag @e[type=boat,name=ACV_LaserBoat,tag=ACV_EnteringCube] remove ACV_EnteringCube
/execute @e[type=armor_stand,name=ACV_Cube,tag=ACV_Redirecting] ~ ~501.65 ~ scoreboard players tag @e[type=boat,name=ACV_LaserBoat,tag=!ACV_InCube,dy=0] add ACV_EnteringCube
/execute @e[type=armor_stand,name=ACV_Cube,tag=ACV_Redirecting] ~ ~501.65 ~ teleport @e[type=boat,name=ACV_LaserBoat,tag=ACV_EnteringCube,dy=0] ~ ~-0.3 ~ ~180 0

// Summoning
/execute @e[type=area_effect_cloud,name=ACV_Laser] ~ ~ ~ summon boat ~ ~ ~ {CustomName:ACV_LaserBoat,Tags:[ACV_new],NoGravity:1,Invulnerable:1,Passengers:[{id:armor_stand,CustomName:ACV_LaserPassenger1,Tags:[ACV_TpProof]},{id:armor_stand,CustomName:ACV_LaserPassenger2,Tags:[ACV_TpProof]}]}
/execute @e[type=boat,name=ACV_LaserBoat] ~ ~ ~ tp @e[type=boat,name=ACV_LaserBoat,r=0,c=1] @e[type=area_effect_cloud,name=ACV_Laser,r=0,c=1]
/tp @e[type=area_effect_cloud,name=ACV_Laser] ~ -100 ~
/tp @e[type=boat,name=ACV_LaserBoat,tag=ACV_new] ~ ~499.7 ~ ~180 ~
/scoreboard players tag @e[type=boat,name=ACV_LaserBoat,tag=ACV_new] remove ACV_new
}
