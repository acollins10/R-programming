# MoneyBall Project
# This project I will help Oakland A's recruit under-valued players
#Datasource: http://www.seanlahman.com/baseball-archive/statistics/
#For more information https://en.wikipedia.org/wiki/Moneyball

batting <- read.csv('Batting.csv')
head(batting)
str(batting)
head(batting$AB)
head(batting$X2B)
#Batting Avg=Hits/At Base
batting$BA <- batting$H / batting$AB #Batting Avg=Hits/At Base
tail(batting$BA,5) 
# On Base Percentage
batting$OBP <- (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)
# Creating X1B (Singles)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR
# Creating Slugging Average (SLG)
batting$SLG <- ((1 * batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR) ) / batting$AB
str(batting)

sal <- read.csv('Salaries.csv')
summary(batting)
batting <- subset(batting,yearID >= 1985)
summary(batting)
combo <- merge(batting,sal,by=c('playerID','yearID'))
summary(combo)
#create dataframe of the lostplayers
lost_players <- subset(combo,playerID %in% c('giambja01','damonjo01','saenzol01') )
lost_players

lost_players <- subset(lost_players,yearID == 2001)
lost_players <- lost_players[,c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB')]

head(lost_players)
#Replacement players criteria:
#The total combined salary of the three players can not exceed 15 million dollars.
#Their combined number of At Bats (AB) needs to be equal to or greater than the lost players.
#Their mean OBP had to equal to or greater than the mean OBP of the lost players
install.packages("dplyr")

library(dplyr)
avail.players <- filter(combo,yearID==2001)

install.packages("ggplot2")
library(ggplot2)
ggplot(avail.players,aes(x=OBP,y=salary)) + geom_point()


avail.players <- filter(avail.players,salary<8000000,OBP>0)

avail.players <- filter(avail.players,AB >= 500)

possible <- head(arrange(avail.players,desc(OBP)),10)
possible <- possible[,c('playerID','OBP','AB','salary')]
possible

possible[2:4,]

