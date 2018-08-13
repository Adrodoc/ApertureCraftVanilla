execute if entity @s[tag=acv_blue] at @e[name=acv_portal_in] run clone ~ ~ ~ ~ ~1 ~ 0 1 0
execute if entity @s[tag=acv_orange] at @e[name=acv_portal_in] run clone ~ ~ ~ ~ ~1 ~ 1 1 0
execute if entity @s[tag=acv_purple] at @e[name=acv_portal_in] run clone ~ ~ ~ ~ ~1 ~ 2 1 0
execute if entity @s[tag=acv_red] at @e[name=acv_portal_in] run clone ~ ~ ~ ~ ~1 ~ 3 1 0

execute if entity @e[type=area_effect_cloud,name=acv_portal_in,tag=acv_blue] at @e[type=area_effect_cloud,name=acv_portal_in,tag=acv_orange] run fill ~ ~ ~ ~ ~1 ~ moving_piston
execute if entity @e[type=area_effect_cloud,name=acv_portal_in,tag=acv_orange] at @e[type=area_effect_cloud,name=acv_portal_in,tag=acv_blue] run fill ~ ~ ~ ~ ~1 ~ moving_piston

execute if entity @e[type=area_effect_cloud,name=acv_portal_in,tag=acv_purple] at @e[type=area_effect_cloud,name=acv_portal_in,tag=acv_red] run fill ~ ~ ~ ~ ~1 ~ moving_piston
execute if entity @e[type=area_effect_cloud,name=acv_portal_in,tag=acv_red] at @e[type=area_effect_cloud,name=acv_portal_in,tag=acv_purple] run fill ~ ~ ~ ~ ~1 ~ moving_piston
