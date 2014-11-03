
simulateMH <- function(switch=T) {

    doors <- 1:3
    selected.door <- sample(doors, 1)
    true.door <- sample(doors, 1)

    if (true.door == selected.door) shown.door <- sample(doors[-true.door], 1)
    else shown.door <- doors[-c(true.door, selected.door)]
    
    if (switch) selected.door <- doors[-c(selected.door, shown.door)]

    return(selected.door == true.door)
}

switch.strat <- replicate(10000, simulateMH())
nswitch.strat <- replicate(10000, simulateMH(F))
