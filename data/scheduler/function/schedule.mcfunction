# Entity Scheduler (`scheduler`)
# With this you can easily schedule function while executing the function as any entity.
#
# # Example:
# ```
# # Vanilla
# schedule function example:function 20t
# ```
# The above vanilla function (with no entity context) becomes this
# ```
# # scheduler
# function scheduler:args/set_entity with entity @r
# function scheduler:args/set {function: "example_function", ticks: 20}
# function scheduler:schedule with storage scheduler:args
# ```
#
# You can take a look at scheduler:args/clear for documentation on every argument
# I recommend that you store your arguments via "schedule:args/*"
# and call this function `with storage scheduler:args` and it will clear the args automatically.
# But you can call this function with any input as long as the required arguments are present

# By copying all arguments at first, we can both use it on instant_execute if needed
# but the function will instantly fail if any argument at all is missing so we can exit directly
data remove storage scheduler:internal/copy ticks
data remove storage scheduler:internal/copy function
data remove storage scheduler:internal/copy uuid
$data modify storage scheduler:internal/copy ticks set value $(ticks)
$data modify storage scheduler:internal/copy function set value "$(function)"
$data modify storage scheduler:internal/copy uuid set value "$(uuid)"

# If the scheduled function is 0 or less ticks we can instantly execute it and return
execute store result score scheduler.init_ticks z_scheduler run data get storage scheduler:internal/copy ticks 1
execute if score scheduler.init_ticks z_scheduler matches ..0 run return run function scheduler:internal/instant_execute with storage scheduler:internal/copy

# Append the argument object into the schedules field
data modify storage scheduler:internal schedules append from storage scheduler:args
# Since we now have appended the value, we gotta add to it
scoreboard players add scheduler.array_length z_scheduler 1
# And then we can reset args
function scheduler:args/clear