impulse process ACV_confirmBlockOption {
  ACV_loadChunks()
  /clone ${origin + (1 1 -6)} ${origin + (7 2 -6)} 0 1 1
  /fill 0 1 2 6 2 2 air
  /tellraw @a [{"text":"[","color":"gold"},{"text":"Info","color":"gold","italic":"true"},{"text":"] ","color":"gold"},{"text":"Block-Option confirmed","color":"yellow"}]
}