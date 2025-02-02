
# If the current index is more or equal than how many items there is
# we can quit the loop since we have gone over every element
execute if score scheduler.index z_scheduler >= scheduler.array_length z_scheduler run return 1

# Store the current tick count into the scoreboard
$execute store result score scheduler.ticks z_scheduler run data get storage scheduler:internal schedules[$(index)].ticks 1

# If the current indexed schedule's tick isnt 0, we can just increment it and go onto the next one
execute if score scheduler.ticks z_scheduler matches 1.. run return run function scheduler:iter/continue with storage scheduler:internal/iter

# if we got here, that means the current schedule's ticks is 0
# which means we should execute it and remove it from the array

# execute the scheduled function
$function scheduler:internal/execute_schedule with storage scheduler:internal schedules[$(index)]

# decrease array length & remove its entry
scoreboard players remove scheduler.array_length z_scheduler 1
$data remove storage scheduler:internal schedules[$(index)]

# continue on in the loop
function scheduler:iter/next with storage scheduler:internal/iter