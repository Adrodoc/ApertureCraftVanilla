# workaround for https://bugs.mojang.com/browse/MC-128565
# without this bug we could just tick the force before the teleportation and rely on OnGround
tag @a[tag=acv_just_teleported] remove acv_just_teleported
tag @a[tag=!acv_portal,scores={acv_portal_id=1..}] add acv_just_teleported

scoreboard players reset @a[tag=!acv_just_teleported,nbt={OnGround:1b},scores={acv_force_x=-2147483648..2147483647}] acv_force_x
scoreboard players reset @a[tag=!acv_just_teleported,nbt={OnGround:1b},scores={acv_force_y=-2147483648..2147483647}] acv_force_y
scoreboard players reset @a[tag=!acv_just_teleported,nbt={OnGround:1b},scores={acv_force_z=-2147483648..2147483647}] acv_force_z

execute as @a[scores={acv_force_x=..-1}] run function acv:force/apply-x
execute as @a[scores={acv_force_y=..-1}] run function acv:force/apply-y
execute as @a[scores={acv_force_z=..-1}] run function acv:force/apply-z
execute as @a[scores={acv_force_x=1..}] run function acv:force/apply_x
execute as @a[scores={acv_force_y=1..}] run function acv:force/apply_y
execute as @a[scores={acv_force_z=1..}] run function acv:force/apply_z
