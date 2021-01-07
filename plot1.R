### ------------------------ FIRST PLOT: TOTAL EMMISIONS BY YEAR ----------------------------------

## Read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate sums by year
sums <- aggregate(NEI$Emissions, list(NEI$year),sum)

## Create plot
png(filename = "plot1.png")

barplot((sums$x)/10^6, 
        names.arg = sums$Group.1, 
        ylab = "Total emissions (million tons)", 
        xlab = "Years", 
        main = "PM2.5 emissions in USA")
dev.off()