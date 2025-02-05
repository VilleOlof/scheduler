# Clears all functions with the same uuid as the given entity
#
# Example:
# ```
# # This would clear all scheduled functions with the same uuid as @s
# function scheduler:clear_entity with entity @s
# ```

# reset
data remove storage scheduler:internal/iter/clear/entity args
data remove storage scheduler:internal/iter/clear/entity index

# Save the uuid
$function gu:convert {UUID: $(UUID)}
data modify storage scheduler:internal/iter/clear/entity args.uuid set from storage gu:main out

# init the loop
scoreboard players set scheduler.clear.entity.index z_scheduler 0
execute store result storage scheduler:internal/iter/clear/entity index int 1 run scoreboard players get scheduler.clear.entity.index z_scheduler

# iterate over all the elements and remove the ones that match
function scheduler:iter/clear_entity/main with storage scheduler:internal/iter/clear/entity