execute if block 0 1 0 air run tag @s add acv_transfer_chunk_loaded
execute unless block 0 1 0 air run tag @s add acv_transfer_chunk_loaded
execute if entity @s[tag=!acv_transfer_chunk_loaded] run function acv:storage/load_transfer_chunk
tag @s remove acv_transfer_chunk_loaded
