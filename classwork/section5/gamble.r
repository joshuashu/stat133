# Implement the function betFun. Your function should take the following
# arguments:
#
# <current.wealth>: a numeric value indicating your wealth at the current
#   iteration of a simulation.
# <previous.winnings>: (optional) a numeric value indicating the amount won or
#   lost in the previous iteration of a simulation
#
# Your function should return the amount of your bet for the current iteration
# of a simulation. The bet must be between 0 and <current.wealth>.
betFun <- function(current.wealth,  previous.winnings=NA) {

    # your code here
    bet <- max(bet, 0)
    return(min(bet, current.wealth))
}

# Implement a function that runs a gambling simulation with the following
# parameters:
#
# <bet.FUN>: a betting function that returns a numeric value based on inputs of
#   current wealth and previous winnings
# <init.wealth>: a numeric value giving starting wealth
# <prob.win>: a numeric value between 0 and 1 giving the probability of winning
#   each round
# <max.turns>: an integer giving the maximum number of turns to be played
#
# Your function should return the difference between your initial and final
# wealth after playing a game for <max.turns> rounds. If your wealth falls below
# 0, the simulation should end.
gamble <- function(bet.FUN, init.wealth=50, prob.win=0.52, max.turns=25) {


}



