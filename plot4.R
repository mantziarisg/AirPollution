### ------------------------ FOURTH PLOT: TOTAL EMMISIONS BY YEAR FROM COAL COMBUSTION ----------------------------------

##Load ggplot
library(ggplot2)

## Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset SCC that contain COMBUSTION (SCC LVL 1) AND COAL (SCC LVL 4)
combustion <- grepl("combust", SCC$SCC.Level.One, ignore.case = TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE)
merged <- (combustion & coal)
SCCneed <- SCC[merged, ]$SCC

## Subset NEI from the SCC found above
NEIneed <- NEI[NEI$SCC %in% SCCneed,]

## Create plot
png(filename = "plot4.png")

ggplot(NEIneed,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="orange") +
  labs(x="Year", y="Total emissions (thousand tons)") + 
  labs(title="PM2.5 emissions from coal combustion engines in USA")
  
  dev.off()