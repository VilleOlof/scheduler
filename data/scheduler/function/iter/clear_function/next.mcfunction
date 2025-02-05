# i++
scoreboard players add scheduler.clear.function.index z_scheduler 1
execute store result storage scheduler:internal/iter/clear/function index int 1 run scoreboard players get scheduler.clear.functio.index z_scheduler

function scheduler:iter/clear_function/main with storage scheduler:internal/iter/clear/function