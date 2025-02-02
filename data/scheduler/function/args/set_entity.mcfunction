# Example:
# function scheduler:args/set_entity with entity @s

# Takes the current UUID from the entity and converts it into a hexadecimal version and stores it in args
$function gu:convert {UUID: $(UUID)}
data modify storage scheduler:args uuid set from storage gu:main out