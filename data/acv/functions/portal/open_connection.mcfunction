execute if entity @s[scores={acv_color=0}] at @e[tag=acv_portal_in,tag=acv_corner,scores={acv_color=0}] run clone ~ ~ ~ ~ ~ ~ 0 1 0
execute if entity @s[scores={acv_color=0}] at @e[tag=acv_portal_in,tag=!acv_corner,scores={acv_color=0}] run clone ~ ~ ~ ~ ~ ~ 0 2 0
execute if entity @s[scores={acv_color=1}] at @e[tag=acv_portal_in,tag=acv_corner,scores={acv_color=1}] run clone ~ ~ ~ ~ ~ ~ 1 1 0
execute if entity @s[scores={acv_color=1}] at @e[tag=acv_portal_in,tag=!acv_corner,scores={acv_color=1}] run clone ~ ~ ~ ~ ~ ~ 1 2 0
execute if entity @s[scores={acv_color=2}] at @e[tag=acv_portal_in,tag=acv_corner,scores={acv_color=2}] run clone ~ ~ ~ ~ ~ ~ 2 1 0
execute if entity @s[scores={acv_color=2}] at @e[tag=acv_portal_in,tag=!acv_corner,scores={acv_color=2}] run clone ~ ~ ~ ~ ~ ~ 2 2 0
execute if entity @s[scores={acv_color=3}] at @e[tag=acv_portal_in,tag=acv_corner,scores={acv_color=3}] run clone ~ ~ ~ ~ ~ ~ 3 1 0
execute if entity @s[scores={acv_color=3}] at @e[tag=acv_portal_in,tag=!acv_corner,scores={acv_color=3}] run clone ~ ~ ~ ~ ~ ~ 3 2 0

execute if entity @e[tag=acv_portal_in,scores={acv_color=0}] if entity @e[tag=acv_portal_in,scores={acv_color=1}] at @e[tag=acv_portal_in,scores={acv_color=0..1}] run setblock ~ ~ ~ moving_piston
execute if entity @e[tag=acv_portal_in,scores={acv_color=2}] if entity @e[tag=acv_portal_in,scores={acv_color=3}] at @e[tag=acv_portal_in,scores={acv_color=2..3}] run setblock ~ ~ ~ moving_piston
