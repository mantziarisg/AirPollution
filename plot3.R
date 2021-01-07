### ------------------------ THIRD PLOT: TOTAL EMMISIONS BY YEAR AND SOURCE TYPR IN BALTIMORE ----------------------------------

##Load ggplot
library(ggplot2)

## Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Baltimore city (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶")
baltimore <- subset(NEI, NEI$fips==24510)

## Calculate sums by year
baltsums <- aggregate(baltimore$Emissions, list(baltimore$year),sum)

## Create plot
png(filename = "plot3.png")

ggplot(baltimore, aes(factor(year), Emissions, fill=type))+
      facet_grid(.~type)+
      geom_bar(stat="identity")+
      labs(x="Year", y="Total emissions (tons)")+
      labs(title = "PM2.5 emissions in Baltimore, Maryland by source type" )
dev.off()