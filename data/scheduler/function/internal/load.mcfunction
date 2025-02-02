scoreboard objectives add z_scheduler dummy
# Makes sure that scheduler.array_length is always a non-null score
scoreboard players add scheduler.array_length z_scheduler 0

function gu:zzz/load