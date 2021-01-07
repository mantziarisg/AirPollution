### ------------------------ FIFTH PLOT: TOTAL EMMISIONS IN BALTIMORE BY MOTOR VEHICLES ----------------------------------

##Load ggplot
library(ggplot2)

## Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Baltimore city (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶")
baltimore <- subset(NEI, NEI$fips==24510)

## Subset SCC that contain VEHICLE (SCC LVL 2) 
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
  
## Subset baltimore from the SCC found above
baltimoreVEH <- baltimore[baltimore$SCC %in% vehicleSCC,]

## Create plot
png(filename = "plot5.png")

ggplot(baltimoreVEH,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill ="orange") +
  labs(x="Year", y="Total emissions (tons)") + 
  labs(title="PM2.5 Vehicle emissions in Baltimore, Maryland")

dev.off()