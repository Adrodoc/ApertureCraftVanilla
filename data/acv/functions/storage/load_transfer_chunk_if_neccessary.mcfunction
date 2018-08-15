# x=2,y=0,z=2,dx=13,dy=0,dz=13 to look only in a single chunk
execute unless entity @e[type=area_effect_cloud,tag=acv_transfer_chunk_loader,x=2,y=0,z=2,dx=13,dy=0,dz=13] run function acv:storage/load_transfer_chunk
