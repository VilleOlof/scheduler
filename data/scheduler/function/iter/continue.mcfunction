
# Decrement the current indexed schedules tick and save it
scoreboard players remove scheduler.ticks z_scheduler 1
$execute store result storage scheduler:internal schedules[$(index)].ticks int 1 run scoreboard players get scheduler.ticks z_scheduler

# next iter
function scheduler:iter/next with storage scheduler:internal/iter