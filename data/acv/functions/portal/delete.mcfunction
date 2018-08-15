function acv:portal/close_connection

scoreboard players operation @e[tag=acv_portal] acv_color -= @s acv_color
kill @e[tag=acv_portal,scores={acv_color=0}]
scoreboard players operation @e[tag=acv_portal] acv_color += @s acv_color
