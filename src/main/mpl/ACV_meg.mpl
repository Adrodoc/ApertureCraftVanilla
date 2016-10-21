repeat process ACV_meg {
/execute @e[type=Creeper,name=ACV_MEG] ~ ~ ~ kill @e[name=Weighted_Storage_Cube,dy=0]

/scoreboard players tag @a remove ACV_Blue
/scoreboard players tag @a remove ACV_Orange
/scoreboard players tag @a remove ACV_Purple
/scoreboard players tag @a remove ACV_Red

/scoreboard players tag @a add ACV_Blue {Inventory:[{id:"minecraft:bow",tag:{ench:[{id:48,lvl:6}]}}]}
/scoreboard players tag @a add ACV_Orange {Inventory:[{id:"minecraft:bow",tag:{ench:[{id:48,lvl:7}]}}]}
/scoreboard players tag @a add ACV_Purple {Inventory:[{id:"minecraft:bow",tag:{ench:[{id:48,lvl:8}]}}]}
/scoreboard players tag @a add ACV_Red {Inventory:[{id:"minecraft:bow",tag:{ench:[{id:48,lvl:9}]}}]}

/execute @e[name=ACV_MEG] ~ ~ ~ /scoreboard players tag @a[dy=0] add ACV_megDeletePortal_PARAM
conditional: /setblock ${this + 1} redstone_block

skip

impulse: /setblock ${this - 1} stone

/execute @p[tag=ACV_megDeletePortal_PARAM] ~ ~ ~ execute @p[tag=ACV_Blue,r=0] ~ ~ ~ summon ArmorStand ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM_blue",Tags:["ACV_deletePortal_PARAM"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @p[tag=ACV_megDeletePortal_PARAM] ~ ~ ~ execute @p[tag=ACV_Orange,r=0] ~ ~ ~ summon ArmorStand ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM_orange",Tags:["ACV_deletePortal_PARAM"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @p[tag=ACV_megDeletePortal_PARAM] ~ ~ ~ execute @p[tag=ACV_Purple,r=0] ~ ~ ~ summon ArmorStand ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM_purple",Tags:["ACV_deletePortal_PARAM"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @p[tag=ACV_megDeletePortal_PARAM] ~ ~ ~ execute @p[tag=ACV_Red,r=0] ~ ~ ~ summon ArmorStand ~ ~ ~ {CustomName:"ACV_remote_deletePortals_PARAM_red",Tags:["ACV_deletePortal_PARAM"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/scoreboard players tag @a remove ACV_megDeletePortal_PARAM
/execute @e[name=ACV_remote_deletePortals] ~ ~ ~ setblock ~ ~ ~ redstone_block
}
