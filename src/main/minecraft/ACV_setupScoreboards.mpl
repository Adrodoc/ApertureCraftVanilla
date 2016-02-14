process ACV_setupScoreboards (
/setblock ~ ~ ~-1 stone

/scoreboard objectives add ACV_Internal dummy
/scoreboard objectives add ACV_Interface dummy
/scoreboard objectives add ACV_COLOR dummy
/scoreboard objectives add ACV_DIRECTION dummy
/scoreboard objectives add ACV_CONSTANT dummy
/scoreboard players set 2 ACV_CONSTANT 2
/scoreboard players set 4 ACV_CONSTANT 4
/scoreboard players set 5 ACV_CONSTANT 5
/scoreboard objectives add ACV_TP_FROM dummy
/scoreboard objectives add ACV_TP_UNEVEN dummy
/scoreboard objectives add ACV_TP_TO dummy
/scoreboard objectives add ACV_TP_IR dummy
/scoreboard objectives add ACV_TP_OR dummy
/scoreboard objectives add ACV_TP_ER dummy
/scoreboard objectives add ACV_TP_AR dummy
/scoreboard objectives add ACV_CUBE_ID dummy
/scoreboard objectives add OnGround dummy
)
