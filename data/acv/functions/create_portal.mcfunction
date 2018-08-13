execute if entity @s[tag=acv_ceiling] align xyz run summon area_effect_cloud ~.5 ~ ~.5 {CustomName:"\"acv_portal_out\"",Rotation:[0f,90f],Duration:2147483647}
execute if entity @s[tag=acv_ceiling] align xyz run summon area_effect_cloud ~.5 ~1 ~.5 {CustomName:"\"acv_portal_in\"",Duration:2147483647}

execute if entity @s[tag=acv_floor] align xyz run summon area_effect_cloud ~.5 ~ ~.5 {CustomName:"\"acv_portal_out\"",Rotation:[0f,-90f],Duration:2147483647}
execute if entity @s[tag=acv_floor] align xyz run summon area_effect_cloud ~.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Duration:2147483647}

execute if entity @s[tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Rotation:[180f,0f],Duration:2147483647}
execute if entity @s[tag=acv_south] align xyz run summon area_effect_cloud ~.5 ~-1 ~1.5 {CustomName:"\"acv_portal_in\"",Duration:2147483647}

execute if entity @s[tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Rotation:[0f,0f],Duration:2147483647}
execute if entity @s[tag=acv_north] align xyz run summon area_effect_cloud ~.5 ~-1 ~-.5 {CustomName:"\"acv_portal_in\"",Duration:2147483647}

execute if entity @s[tag=acv_east] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Rotation:[90f,0f],Duration:2147483647}
execute if entity @s[tag=acv_east] align xyz run summon area_effect_cloud ~1.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Duration:2147483647}

execute if entity @s[tag=acv_west] align xyz run summon area_effect_cloud ~.5 ~-.9375 ~.5 {CustomName:"\"acv_portal_out\"",Rotation:[-90f,0f],Duration:2147483647}
execute if entity @s[tag=acv_west] align xyz run summon area_effect_cloud ~-.5 ~-1 ~.5 {CustomName:"\"acv_portal_in\"",Duration:2147483647}

function acv:texture_portal

function acv:open_connection

kill @s
