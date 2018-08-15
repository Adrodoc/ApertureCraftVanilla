# workaround for https://bugs.mojang.com/browse/MC-104494
# without this bug we could just read the motion nbt
execute as @a run function acv:motion/refresh
