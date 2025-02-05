# reset
data remove storage scheduler:internal/iter/clear/function args
data remove storage scheduler:internal/iter/clear/function index

# copy the function value
$data modify storage scheduler:internal/iter/clear/function args.function set value "$(function)"

# init the loop
scoreboard players set scheduler.clear.function.index z_scheduler 0
execute store result storage scheduler:internal/iter/clear/function index int 1 run scoreboard players get scheduler.clear.function.index z_scheduler

# iterate over all the elements and remove the ones that match
function scheduler:iter/clear_function/main with storage scheduler:internal/iter/clear/function