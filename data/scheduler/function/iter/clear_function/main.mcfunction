
# if we have iterated over all elements, we can go out
execute if score scheduler.clear.function.index z_scheduler >= scheduler.array_length z_scheduler run return 1

# Copy the value, and if we try and modify it. And its the same value, it wont successfully set it so we can store that change
$data modify storage scheduler:internal/iter/clear/function args.copy set from storage scheduler:internal schedules[$(index)].function
execute store success score scheduler.clear.function.is_different z_scheduler run data modify storage scheduler:internal/iter/clear/function args.copy set from storage scheduler:internal/iter/clear/function args.function

# if the values are different, we just continue to iterate
execute if score scheduler.clear.function.is_different z_scheduler matches 1 run return run function scheduler:iter/clear_function/next

# but at this point, the values match which means we should remove it and continue

# i-- on the array length and remove the element from schedules
scoreboard players remove scheduler.array_length z_scheduler 1
$data remove storage scheduler:internal schedules[$(index)]

# and then we can just continue
function scheduler:iter/clear_function/next