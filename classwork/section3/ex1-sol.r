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
n.non.europe <- nrow(wc.data[!wc.data$region == 'Europe', ])


# 2) What proportion of the teams came from Europe?
# prop.europe <- your code here
n.teams <- nrow(wc.data)
prop.europe <- (n.teams-n.non.europe) / n.teams


# 3) How many teams came from the Americas (North, Central, South)?
# n.americas <- your code here
americas <- c('North America', 'South America', 'Central America')
n.americas <- sum(wc.data$region %in% americas)


# 4) How many goals did a team need to score to be in the 95th percentile of
# goals scored? How many to be in the 5th percentile of goals against?
# cutoff.gs.95 <- your code here
# cutoff.ga.05 <- your code here
cutoff.gs.95 <- quantile(wc.data$gs, 0.95)
cutoff.ga.05 <- quantile(wc.data$ga, 0.05)


# 5) Create a subset of the dataframe <wc.data>. Include teams that were neither
# above the 95th percentile of goals scored nor below the 5th percentile of
# goals against.
# wc.subset<- your code here
wc.subset <- wc.data[wc.data$gs<cutoff.gs.95 & wc.data$ga>cutoff.ga.05, ]


# 6) Calculate the ratio of goals scored to goals against for teams in the
# subset you just created. In addition, calculate this ratio for teams not in
# the subset
# g.ratio.subset <- your code here
# g.ratio.non.subset <- your code here
g.ratio.subset <- wc.subset$gs / wc.subset$ga
non.subset.idcs <- !wc.data$teams %in% wc.subset$teams
non.subset <- wc.data[non.subset.idcs, ]
g.ratio.non.subset <- non.subset$gs / non.subset$ga


# 7) Calculate the shooting percentage for each team. Find the average shooting
# percentage for teams with more than the average number of fouls and less than
# the average number of fouls.
# avg.shooting.percent <- your code here
# avg.shooting.high.foul <- your code here
# avg.shooting.low.foul <- your code here
avg.shooting.percent <- wc.data$gs / wc.data$shots
foul.avg <- mean(wc.data$fouls)
avg.shooting.high.foul <- avg.shooting.percent[wc.data$fouls > foul.avg]
avg.shooting.low.foul <- avg.shooting.percent[wc.data$fouls < foul.avg]


# 8) Please produce a plot with the following features:
# * Total number of cards (yellow or red) per game played plotted against
#    total number of fouls per game played
# * x and y axis labels fouls per game and cards per game
# * points colored according to region (using the rainbow color palette)
# * a legend indicating the region for each color
# * plotting character 20
col.pal <- rainbow(length(unique(wc.data$region)))
region.colors <- col.pal[wc.data$region]
fouls.per.game <- wc.data$fouls / wc.data$gp
cards.per.game <- (wc.data$rc + wc.data$yc) / wc.data$gp
plot(fouls.per.game, cards.per.game, pch=20, col=region.colors,
     xlab='fouls per game', ylab='fouls per game')
legend('topleft', levels(wc.data$region), col=col.pal, pch=20)
