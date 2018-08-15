function acv:portal/close_connection

scoreboard players operation @e[tag=acv_portal] acv_portal_id -= @s acv_portal_id
kill @e[tag=acv_portal,scores={acv_portal_id=0}]
scoreboard players operation @e[tag=acv_portal] acv_portal_id += @s acv_portal_id
