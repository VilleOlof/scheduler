# Removes any stored arguments

# How many ticks the function should be scheduled into the future
data remove storage scheduler:args ticks
# What function to schedule
data remove storage scheduler:args function
# A hexadecimal representation of the targets uuid
# Use `function scheduler:args/set_entity with entity @p` to easily set this value
data remove storage scheduler:args uuid