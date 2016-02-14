repeat process ACV_cubes (
/execute @e[name=Weighted_Storage_Cube] ~ ~ ~ detect ~ ~1 ~ minecraft:lava -1 /kill @e[r=0,c=1]

/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID=0] ~ ~ ~ detect ~ ~1 ~ minecraft:air 0 /tp @e[r=0,c=1] ~ ~-0.25 ~
/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID=0] ~ ~ ~ detect ~ ~1 ~ minecraft:stone_pressure_plate -1 /tp @e[r=0,c=1] ~ ~-0.25 ~
/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID=0] ~ ~ ~ detect ~ ~1 ~ minecraft:carpet -1 /tp @e[r=0,c=1] ~ ~-0.25 ~
#/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID=0] ~ ~ ~ detect ~ ~1 ~ minecraft:carpet 9 /tp @e[r=0,c=1] ~ ~-0.25 ~

/scoreboard players add @a ACV_CUBE_ID 0
/scoreboard players add @e[name=Weighted_Storage_Cube] ACV_CUBE_ID 0
/scoreboard players tag @a remove ACV_HoldingArrow
/scoreboard players tag @a add ACV_HoldingArrow {SelectedItem:{id:"minecraft:arrow",tag:{display:{Name:"Picking up Cubes"}}}}
/scoreboard players set @a[score_ACV_CUBE_ID_min=1,tag=!ACV_HoldingArrow] ACV_CUBE_ID 0
/execute @p[score_ACV_CUBE_ID=0,tag=ACV_HoldingArrow] ~ ~ ~ /scoreboard players operation ACV_Last_ID ACV_CUBE_ID %= 5 ACV_CONSTANT
/execute @p[score_ACV_CUBE_ID=0,tag=ACV_HoldingArrow] ~ ~ ~ /scoreboard players add ACV_Last_ID ACV_CUBE_ID 1
/scoreboard players operation @r[score_ACV_CUBE_ID=0,tag=ACV_HoldingArrow] ACV_CUBE_ID += ACV_Last_ID ACV_CUBE_ID

/scoreboard players tag @a remove ACV_CubeLinked
/scoreboard players tag @e[name=Weighted_Storage_Cube] remove ACV_CubeLinked
/execute @p[score_ACV_CUBE_ID_min=1,score_ACV_CUBE_ID=1] ~ ~ ~ /execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,score_ACV_CUBE_ID=1] ~ ~ ~ /scoreboard players tag @e[score_ACV_CUBE_ID_min=1,score_ACV_CUBE_ID=1] add ACV_CubeLinked
/execute @p[score_ACV_CUBE_ID_min=2,score_ACV_CUBE_ID=2] ~ ~ ~ /execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=2,score_ACV_CUBE_ID=2] ~ ~ ~ /scoreboard players tag @e[score_ACV_CUBE_ID_min=2,score_ACV_CUBE_ID=2] add ACV_CubeLinked
/execute @p[score_ACV_CUBE_ID_min=3,score_ACV_CUBE_ID=3] ~ ~ ~ /execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=3,score_ACV_CUBE_ID=3] ~ ~ ~ /scoreboard players tag @e[score_ACV_CUBE_ID_min=3,score_ACV_CUBE_ID=3] add ACV_CubeLinked
/execute @p[score_ACV_CUBE_ID_min=4,score_ACV_CUBE_ID=4] ~ ~ ~ /execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=4,score_ACV_CUBE_ID=4] ~ ~ ~ /scoreboard players tag @e[score_ACV_CUBE_ID_min=4,score_ACV_CUBE_ID=4] add ACV_CubeLinked
/execute @p[score_ACV_CUBE_ID_min=5,score_ACV_CUBE_ID=5] ~ ~ ~ /execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=5,score_ACV_CUBE_ID=5] ~ ~ ~ /scoreboard players tag @e[score_ACV_CUBE_ID_min=5,score_ACV_CUBE_ID=5] add ACV_CubeLinked

/scoreboard players set @e[name=Weighted_Storage_Cube,tag=!ACV_CubeLinked] ACV_CUBE_ID 0
/execute @a[tag=!ACV_CubeLinked] ~ ~ ~ /scoreboard players operation @e[name=Weighted_Storage_Cube,r=3,c=1] ACV_CUBE_ID += @p[tag=!ACV_CubeLinked] ACV_CUBE_ID

/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,score_ACV_CUBE_ID=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,c=1] @p[score_ACV_CUBE_ID_min=1,score_ACV_CUBE_ID=1]
/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=2,score_ACV_CUBE_ID=2] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,c=1] @p[score_ACV_CUBE_ID_min=2,score_ACV_CUBE_ID=2]
/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=3,score_ACV_CUBE_ID=3] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,c=1] @p[score_ACV_CUBE_ID_min=3,score_ACV_CUBE_ID=3]
/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=4,score_ACV_CUBE_ID=4] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,c=1] @p[score_ACV_CUBE_ID_min=4,score_ACV_CUBE_ID=4]
/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=5,score_ACV_CUBE_ID=5] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,c=1] @p[score_ACV_CUBE_ID_min=5,score_ACV_CUBE_ID=5]

# r=1 wegen https://bugs.mojang.com/browse/MC-90967
/execute @a[rym=169,ry=-168,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~0 ~-0.25 ~-2
/execute @a[rym=-167,ry=-146,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~0.7653668647301795434569199680608 ~-0.25 ~-1.8477590650225735122563663787936
/execute @a[rym=-145,ry=-123,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~1.4142135623730950488016887242097 ~-0.25 ~-1.4142135623730950488016887242097
/execute @a[rym=-122,ry=-101,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~1.8477590650225735122563663787936 ~-0.25 ~-0.7653668647301795434569199680608
/execute @a[rym=-100,ry=-78,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~2 ~-0.25 ~0
/execute @a[rym=-77,ry=-56,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~1.8477590650225735122563663787936 ~-0.25 ~0.7653668647301795434569199680608
/execute @a[rym=-55,ry=-33,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~1.4142135623730950488016887242097 ~-0.25 ~1.4142135623730950488016887242097
/execute @a[rym=-32,ry=-11,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~0.7653668647301795434569199680608 ~-0.25 ~1.8477590650225735122563663787936
/execute @a[rym=-10,ry=11,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~0 ~-0.25 ~2
/execute @a[rym=12,ry=33,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~-0.7653668647301795434569199680608 ~-0.25 ~1.8477590650225735122563663787936
/execute @a[rym=34,ry=56,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~-1.4142135623730950488016887242097 ~-0.25 ~1.4142135623730950488016887242097
/execute @a[rym=57,ry=78,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~-1.8477590650225735122563663787936 ~-0.25 ~0.7653668647301795434569199680608
/execute @a[rym=79,ry=101,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~-2 ~-0.25 ~0
/execute @a[rym=102,ry=123,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~-1.8477590650225735122563663787936 ~-0.25 ~-0.7653668647301795434569199680608
/execute @a[rym=124,ry=146,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~-1.4142135623730950488016887242097 ~-0.25 ~-1.4142135623730950488016887242097
/execute @a[rym=147,ry=168,score_ACV_CUBE_ID_min=1] ~ ~ ~ /tp @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID_min=1,r=1,c=1] ~-0.7653668647301795434569199680608 ~-0.25 ~-1.8477590650225735122563663787936

/kill @e[type=ArmorStand,name=cube_update]
/execute @e[name=Weighted_Storage_Cube,score_ACV_CUBE_ID=0] ~ ~ ~ /summon ArmorStand ~ ~ ~ {CustomName:"cube_update",Invisible:1b,Invulnerable:1b,Marker:1b}

# /scoreboard players tag @a remove ACV_CanPickupCube
# /scoreboard players tag @a add ACV_CanPickupCube {SelectedItem:{id:"minecraft:arrow",tag:{display:{Name:"Picking up Cubes"}}}}
# /execute @a[tag=ACV_CanPickupCube] ~ ~ ~ /execute @e[name=Weighted_Storage_Cube,r=2,c=-1] ~ ~ ~ /scoreboard players tag @e[r=0,c=1] ACV_HasClosePlayer
# /execute @e[name=Weighted_Storage_Cube,tag=ACV_HasClosePlayer] ~ ~ ~ /scoreboard players tag @e[type=Player,tag=ACV_CanPickupCube,r=2,c=-1] ACV_HasCloseCube
# /execute @e[name=Weighted_Storage_Cube,tag=ACV_HasClosePlayer] ~ ~ ~ /scoreboard players tag @a[tag=ACV_HasCloseCube,r=2,c=-1] remove ACV_CanPickupCube

# /execute @e[name=Weighted_Storage_Cube,tag=ACV_HasClosePlayer] ~ ~ ~ /tp @e[r=0,c=1] @e[type=Player,tag=ACV_HasCloseCube,r=2,c=-1]
# /execute @e[name=Weighted_Storage_Cube,tag=!ACV_HasClosePlayer] ~ ~ ~ /tp @p[tag=!ACV_HasCloseCube]


# /scoreboard players tag @a remove ACV_CanPickupCube
# /scoreboard players tag @e[name=Weighted_Storage_Cube] remove ACV_Held
# /scoreboard players tag @a add ACV_CanPickupCube {SelectedItem:{id:"minecraft:arrow",tag:{display:{Name:"Picking up Cubes"}}}}
# /execute @a[tag=ACV_CanPickupCube] ~ ~ ~ /scoreboard players tag @e[name=Weighted_Storage_Cube,tag=!ACV_Held,r=2,c=-1] add ACV_Held
# /execute @e[name=Weighted_Storage_Cube,tag=ACV_Held] ~ ~ ~ /scoreboard players tag @a[tag=ACV_CanPickupCube,r=2,c=-1] add ACV_HoldingCube
# /execute @e[name=Weighted_Storage_Cube,tag=ACV_Held] ~ ~ ~ /scoreboard players tag @a[tag=ACV_CanPickupCube,r=2,c=-1] remove ACV_CanPickupCube
# /execute @e[name=Weighted_Storage_Cube,tag=ACV_Held] ~ ~ ~ /tp @a[tag=ACV_HoldingCube,r=2,c=-1]
# /entitydata @e[name=Weighted_Storage_Cube,tag=!ACV_Held] {CustomName:"Weighted_Storage_Cube_Ground",NoGravity:0}
# /execute @a[tag=ACV_CanPickupCube] ~ ~ ~ /entitydata @e[name=Weighted_Storage_Cube_Ground,r=3,c=1] {CustomName:"Weighted_Storage_Cube"}
)
