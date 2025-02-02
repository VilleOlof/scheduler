
# If theres nothing to handle or tick, return right away
execute if score scheduler.array_length z_scheduler matches 0 run return fail

scoreboard players set scheduler.index z_scheduler 0
data modify storage scheduler:internal/iter index set value 0

function scheduler:iter/main with storage scheduler:internal/iter