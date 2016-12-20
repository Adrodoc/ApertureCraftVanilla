repeat process ACV_lasers {
/tp @e[type=armor_stand,name=Weighted_Storage_Cube] ~ ~ ~ ~ 0

/scoreboard players tag @e[type=armor_stand,name=ACV_Laser] remove ACV_InCube
/scoreboard players tag @e[type=armor_stand,name=ACV_Laser] remove ACV_EnteringCube
/scoreboard players tag @e[type=armor_stand,name=ACV_Laser] remove ACV_InAir
/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ particle reddust ~ ~ ~ 0.1 0.1 0.1 0 10 force
/execute @e[type=armor_stand,name=Weighted_Storage_Cube,tag=ACV_Redirecting] ~ ~2 ~ scoreboard players tag @e[type=armor_stand,name=ACV_Laser,dy=0] add ACV_InCube
/tp @e[type=armor_stand,name=ACV_Laser,rym=169,ry=-168,rxm=0,rx=0] ~0 ~ ~-0.5
/tp @e[type=armor_stand,name=ACV_Laser,rym=-167,ry=-146,rxm=0,rx=0] ~0.1913417161825448858642299920152 ~ ~-0.46193976625564337806409159469839
/tp @e[type=armor_stand,name=ACV_Laser,rym=-145,ry=-123,rxm=0,rx=0] ~0.35355339059327376220042218105242 ~ ~-0.35355339059327376220042218105242
/tp @e[type=armor_stand,name=ACV_Laser,rym=-122,ry=-101,rxm=0,rx=0] ~0.46193976625564337806409159469839 ~ ~-0.1913417161825448858642299920152
/tp @e[type=armor_stand,name=ACV_Laser,rym=-100,ry=-78,rxm=0,rx=0] ~0.5 ~ ~0
/tp @e[type=armor_stand,name=ACV_Laser,rym=-77,ry=-56,rxm=0,rx=0] ~0.46193976625564337806409159469839 ~ ~0.1913417161825448858642299920152
/tp @e[type=armor_stand,name=ACV_Laser,rym=-55,ry=-33,rxm=0,rx=0] ~0.35355339059327376220042218105242 ~ ~0.35355339059327376220042218105242
/tp @e[type=armor_stand,name=ACV_Laser,rym=-32,ry=-11,rxm=0,rx=0] ~0.1913417161825448858642299920152 ~ ~0.46193976625564337806409159469839
/tp @e[type=armor_stand,name=ACV_Laser,rym=-10,ry=11,rxm=0,rx=0] ~0 ~ ~0.5
/tp @e[type=armor_stand,name=ACV_Laser,rym=12,ry=33,rxm=0,rx=0] ~-0.1913417161825448858642299920152 ~ ~0.46193976625564337806409159469839
/tp @e[type=armor_stand,name=ACV_Laser,rym=34,ry=56,rxm=0,rx=0] ~-0.35355339059327376220042218105242 ~ ~0.35355339059327376220042218105242
/tp @e[type=armor_stand,name=ACV_Laser,rym=57,ry=78,rxm=0,rx=0] ~-0.46193976625564337806409159469839 ~ ~0.1913417161825448858642299920152
/tp @e[type=armor_stand,name=ACV_Laser,rym=79,ry=101,rxm=0,rx=0] ~-0.5 ~ ~0
/tp @e[type=armor_stand,name=ACV_Laser,rym=102,ry=123,rxm=0,rx=0] ~-0.46193976625564337806409159469839 ~ ~-0.1913417161825448858642299920152
/tp @e[type=armor_stand,name=ACV_Laser,rym=124,ry=146,rxm=0,rx=0] ~-0.35355339059327376220042218105242 ~ ~-0.35355339059327376220042218105242
/tp @e[type=armor_stand,name=ACV_Laser,rym=147,ry=168,rxm=0,rx=0] ~-0.1913417161825448858642299920152 ~ ~-0.46193976625564337806409159469839
/tp @e[type=armor_stand,name=ACV_Laser,rxm=1,rx=90] ~ ~-0.5 ~
/tp @e[type=armor_stand,name=ACV_Laser,rxm=-90,rx=-1] ~ ~0.5 ~
/execute @e[type=armor_stand,name=Weighted_Storage_Cube,tag=!ACV_Redirecting] ~ ~1.5 ~ kill @e[type=armor_stand,name=ACV_Laser,dy=0]
/execute @e[type=armor_stand,name=Weighted_Storage_Cube,tag=ACV_Redirecting] ~ ~1.5 ~ scoreboard players tag @e[type=armor_stand,name=ACV_Laser,tag=!ACV_InCube,dy=0] add ACV_EnteringCube
/execute @e[type=armor_stand,name=Weighted_Storage_Cube,tag=ACV_Redirecting] ~ ~1.5 ~ tp @e[type=armor_stand,name=ACV_Laser,tag=ACV_EnteringCube,dy=0] @e[type=armor_stand,name=Weighted_Storage_Cube,r=2,c=1]
/execute @e[type=armor_stand,name=Weighted_Storage_Cube,tag=ACV_Redirecting] ~ ~ ~ tp @e[type=armor_stand,name=ACV_Laser,tag=ACV_EnteringCube,dy=0] ~ ~1.7 ~

/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ detect ~ ~ ~ air -1 scoreboard players tag @e[type=armor_stand,name=ACV_Laser,r=1,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ detect ~ ~ ~ piston_extension -1 scoreboard players tag @e[type=armor_stand,name=ACV_Laser,r=1,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ detect ~ ~ ~ carpet -1 scoreboard players tag @e[type=armor_stand,name=ACV_Laser,r=1,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ detect ~ ~ ~ glass -1 scoreboard players tag @e[type=armor_stand,name=ACV_Laser,r=1,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ detect ~ ~ ~ stained_glass -1 scoreboard players tag @e[type=armor_stand,name=ACV_Laser,r=1,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ detect ~ ~ ~ glass_pane -1 scoreboard players tag @e[type=armor_stand,name=ACV_Laser,r=1,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ detect ~ ~ ~ stained_glass_pane -1 scoreboard players tag @e[type=armor_stand,name=ACV_Laser,r=1,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_Laser] ~ ~ ~ detect ~ ~ ~ iron_bars -1 scoreboard players tag @e[type=armor_stand,name=ACV_Laser,r=1,c=1] add ACV_InAir

/kill @e[type=armor_stand,name=ACV_Laser,tag=!ACV_InAir]
}
