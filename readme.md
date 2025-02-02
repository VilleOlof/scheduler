# Scheduler

> /schedule but with entity context

##  Example
```mcfunction
# Vanilla
schedule function example:function 20t
```
The above vanilla function (with no entity context) becomes this
```mcfunction
# scheduler
function scheduler:args/set_entity with entity @r
function scheduler:args/set {function: "example_function", ticks: 20}
function scheduler:schedule with storage scheduler:args
```

You can take a look at `scheduler:args/clear` for documentation on every argument  
I recommend that you store your arguments via `schedule:args/set` & `schedule:args/set_entity`  
and call `scheduler:schedule with storage scheduler:args` and it will clear the args automatically.  
But you can call this function with any input as long as the required arguments are present.  