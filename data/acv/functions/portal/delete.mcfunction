function acv:portal/close_connection

#scoreboard players operation @e[tag=acv_portal] acv_color -= @s acv_color
#kill @e[tag=acv_portal,scores={acv_color=0}]
#scoreboard players operation @e[tag=acv_portal] acv_color += @s acv_color

execute if entity @s[scores={acv_color=1}] run kill @e[scores={acv_color=1}]
execute if entity @s[scores={acv_color=2}] run kill @e[scores={acv_color=2}]
execute if entity @s[scores={acv_color=3}] run kill @e[scores={acv_color=3}]
execute if entity @s[scores={acv_color=4}] run kill @e[scores={acv_color=4}]
