function acv:storage/load_transfer_chunk_if_neccessary
function acv:storage/provide_marker
scoreboard players operation @e[tag=acv_storage] acv_storage_id -= @s acv_storage_id
execute at @e[tag=acv_storage,scores={acv_storage_id=0}] run clone 0 1 0 0 16 0 ~ ~ ~ replace move
scoreboard players operation @e[tag=acv_storage] acv_storage_id += @s acv_storage_id
