worldTrends <- read.csv(file.choose())
head(worldTrends)
head(stats)

filter1 <- worldTrends$Year == 1960

WT1960 <- worldTrends[worldTrends$Year== 1960,]
WT2013 <- worldTrends[worldTrends$Year == 2013,]

head(WT1960)

merged1960 <- merge(stats, WT1960, by.x = "Country.Code", by.y = "Country.Code")
head(merged1960)

merged2013 <- merge(stats, WT2013, by.x = "Country.Code", by.y = "Country.Code")
head(merged2013)

final_merge1960 <- merge(merged1960, Life_expectancies1960, by.x = "Country.Code", by.y = "Country_Code")
final_merge2013 <- merge(merged2013, Life_expectancies2013, by.x = "Country.Code", by.y = "Country_Code")
head(final_merge1960)
head(final_merge2013)

qplot(data = final_merge1960, x=Fertility.Rate, y=LE1960,
      colour=Region)

qplot(data = final_merge2013, x=Fertility.Rate, y=LE2013,
      colour=Region)
