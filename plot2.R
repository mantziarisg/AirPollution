### ------------------------ SECOND PLOT: TOTAL EMMISIONS BY YEAR in BALTIMORE ----------------------------------

## Read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Baltimore city (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶")
baltimore <- subset(NEI, NEI$fips==24510)

## Calculate sums by year
baltsums <- aggregate(baltimore$Emissions, list(baltimore$year),sum)

## Create plot
png(filename = "plot2.png")

barplot(baltsums$x, 
        names.arg = baltsums$Group.1, 
        ylab = "Total emissions (tons)", 
        xlab = "Years", 
        main = "PM2.5 emissions in Baltimore, Maryland")
dev.off()