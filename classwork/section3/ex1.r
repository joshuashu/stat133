# Included in this folder, you will find the dataset "world-cup.csv". This file
# contains data on the 2010 World Cup. The dataset contains the following
# variables:
#
# <region>: One of seven regions identifying where each team is from
# <team>: the name of the team for each of the wc participants
# <gp>: the number of games played by a team over the entire tournament
# <gs> the number of goals scored by a team over the entire tournament
# <shots>: the number of shots taken by a team over the course of the tournament
# <ga>: the number of goals scored against a team over the course of the
#   tournament
# <fouls>: the number of fouls commited by a team over the course of the
#   tournament
# <yc>: the total numer of yellow cards earned by a team over the course of the
#   tournament
# <rc>: the number of red cards earned by a team over the course of the
#   tournament

wc.data <- read.csv('world-cup.csv', header=T)


# 1) How many of the teams come from a region other than Europe?
# n.non.europe <- your code here



# 2) What proportion of the teams came from Europe?
# prop.europe <- your code here



# 3) How many teams came from the Americas (North, Central, South)?
# n.americas <- your code here



# 4) How many goals did a team need to score to be in the 95th percentile of
# goals scored? How many to be in the 5th percentile of goals against?
# cutoff.gs.95 <- your code here
# cutoff.ga.05 <- your code here



# 5) Create a subset of the dataframe <wc.data>. Include teams that were neither
# above the 95th percentile of goals scored nor below the 5th percentile of
# goals against.
# wc.subset<- your code here



# 6) Calculate the ratio of goals scored to goals against for teams in the
# subset you just created. In addition, calculate this ratio for teams not in
# the subset
# g.ratio.subset <- your code here
# g.ratio.non.subset <- your code here



# 7) Calculate the shooting percentage for each team. Find the average shooting
# percentage for teams with more than the average number of fouls and less than
# the average number of fouls.
# avg.shooting.percent <- your code here
# avg.shooting.high.foul <- your code here
# avg.shooting.low.foul <- your code here



# 8) Please produce a plot with the following features:
# * Total number of cards (yellow or red) per game played plotted against
#    total number of fouls per game played
# * x and y axis labels fouls per game and cards per game
# * points colored according to region (using the rainbow color palette)
# * a legend indicating the region for each color
# * plotting character 20

