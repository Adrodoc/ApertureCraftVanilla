execute if block ~ ~ ~ quartz_block run summon falling_block ~ ~ ~ {Tags:[acv_portal],BlockState:{Name:quartz_block},Time:-2147483648,NoGravity:1}
execute if block ~ ~ ~ quartz_pillar[axis=x] run summon falling_block ~ ~ ~ {Tags:[acv_portal],BlockState:{Name:quartz_pillar,Properties:{axis:x}},Time:-2147483648,NoGravity:1}
execute if block ~ ~ ~ quartz_pillar[axis=y] run summon falling_block ~ ~ ~ {Tags:[acv_portal],BlockState:{Name:quartz_pillar,Properties:{axis:y}},Time:-2147483648,NoGravity:1}
execute if block ~ ~ ~ quartz_pillar[axis=z] run summon falling_block ~ ~ ~ {Tags:[acv_portal],BlockState:{Name:quartz_pillar,Properties:{axis:z}},Time:-2147483648,NoGravity:1}
setblock ~ ~ ~ moving_piston
