# i++
scoreboard players add scheduler.clear.entity.index z_scheduler 1
execute store result storage scheduler:internal/iter/clear/entity index int 1 run scoreboard players get scheduler.clear.entity.index z_scheduler

function scheduler:iter/clear_entity/main with storage scheduler:internal/iter/clear/entity