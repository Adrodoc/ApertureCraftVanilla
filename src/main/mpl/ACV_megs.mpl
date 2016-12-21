repeat process ACV_megs {
/execute @e[type=creeper,name=ACV_MEG] ~ ~ ~ kill @e[type=armor_stand,name=ACV_Cube,dy=0]

/scoreboard players tag @a[tag=ACV_Blue] remove ACV_Blue
/scoreboard players tag @a[tag=ACV_Orange] remove ACV_Orange
/scoreboard players tag @a[tag=ACV_Purple] remove ACV_Purple
/scoreboard players tag @a[tag=ACV_Red] remove ACV_Red

/scoreboard players tag @a add ACV_Blue {Inventory:[{id:"minecraft:bow",tag:{ench:[{id:48,lvl:6}]}}]}
/scoreboard players tag @a add ACV_Orange {Inventory:[{id:"minecraft:bow",tag:{ench:[{id:48,lvl:7}]}}]}
/scoreboard players tag @a add ACV_Purple {Inventory:[{id:"minecraft:bow",tag:{ench:[{id:48,lvl:8}]}}]}
/scoreboard players tag @a add ACV_Red {Inventory:[{id:"minecraft:bow",tag:{ench:[{id:48,lvl:9}]}}]}

/execute @e[type=creeper,name=ACV_MEG] ~ ~ ~ /scoreboard players tag @a[dy=0] add ACV_megDeletePortal_PARAM
conditional: /setblock ${this + 1} redstone_block

skip

impulse: /setblock ${this - 1} stone

/execute @p[tag=ACV_megDeletePortal_PARAM] ~ ~ ~ execute @p[tag=ACV_Blue,r=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM",Tags:["ACV_Blue"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @p[tag=ACV_megDeletePortal_PARAM] ~ ~ ~ execute @p[tag=ACV_Orange,r=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM",Tags:["ACV_Orange"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @p[tag=ACV_megDeletePortal_PARAM] ~ ~ ~ execute @p[tag=ACV_Purple,r=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM",Tags:["ACV_Purple"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @p[tag=ACV_megDeletePortal_PARAM] ~ ~ ~ execute @p[tag=ACV_Red,r=0] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM",Tags:["ACV_Red"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/scoreboard players tag @a remove ACV_megDeletePortal_PARAM
start ACV_remote_deletePortals
}
