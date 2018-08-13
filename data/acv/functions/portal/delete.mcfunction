function acv:portal/close_connection

execute if entity @s[scores={acv_color=0}] run kill @e[scores={acv_color=0}]
execute if entity @s[scores={acv_color=1}] run kill @e[scores={acv_color=1}]
execute if entity @s[scores={acv_color=2}] run kill @e[scores={acv_color=2}]
execute if entity @s[scores={acv_color=3}] run kill @e[scores={acv_color=3}]
