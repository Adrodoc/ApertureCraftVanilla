execute if entity @s[scores={acv_color=0}] at @e[name=acv_portal_in,scores={acv_color=0}] run clone ~ ~ ~ ~ ~1 ~ 0 1 0
execute if entity @s[scores={acv_color=1}] at @e[name=acv_portal_in,scores={acv_color=1}] run clone ~ ~ ~ ~ ~1 ~ 1 1 0
execute if entity @s[scores={acv_color=2}] at @e[name=acv_portal_in,scores={acv_color=2}] run clone ~ ~ ~ ~ ~1 ~ 2 1 0
execute if entity @s[scores={acv_color=3}] at @e[name=acv_portal_in,scores={acv_color=3}] run clone ~ ~ ~ ~ ~1 ~ 3 1 0

execute if entity @e[name=acv_portal_in,scores={acv_color=0}] if entity @e[name=acv_portal_in,scores={acv_color=1}] at @e[name=acv_portal_in,scores={acv_color=0..1}] run fill ~ ~ ~ ~ ~1 ~ moving_piston
execute if entity @e[name=acv_portal_in,scores={acv_color=2}] if entity @e[name=acv_portal_in,scores={acv_color=3}] at @e[name=acv_portal_in,scores={acv_color=2..3}] run fill ~ ~ ~ ~ ~1 ~ moving_piston
