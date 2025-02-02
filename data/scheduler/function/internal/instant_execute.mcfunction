# I just placed the function in here to hide it from top scope mostly lol
# anyway this executes a function which has been scheduled for 0 ticks or less
# since there is no need to put it into the schedules array

# we can use the internal/copy storage since its a direct copy of the arguments from scheduler:schedule
function scheduler:internal/execute_schedule with storage scheduler:internal/copy
# and we can now clear args to be sure since we skipped it in scheduler:schedule
function scheduler:args/clear