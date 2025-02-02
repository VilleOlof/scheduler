# i++
scoreboard players add scheduler.index z_scheduler 1
execute store result storage scheduler:internal/iter index int 1 run scoreboard players get scheduler.index z_scheduler

# next iter
function scheduler:iter/main with storage scheduler:internal/iter