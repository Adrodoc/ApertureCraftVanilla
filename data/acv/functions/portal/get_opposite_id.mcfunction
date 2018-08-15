scoreboard players operation @s acv_opposite_id = @s acv_portal_id
scoreboard players operation @s acv_tmp = @s acv_portal_id
scoreboard players operation @s acv_tmp %= 2 acv_constant
scoreboard players remove @s[scores={acv_tmp=0}] acv_opposite_id 1
scoreboard players add @s[scores={acv_tmp=1}] acv_opposite_id 1
