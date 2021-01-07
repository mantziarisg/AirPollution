### ------------------------ SIXTH PLOT: COMPARE TOTAL EMMISIONS BY MOTOR VEHICLES BETWEEN BALTIMORE AND LA ----------------------------------

##Load ggplot
library(ggplot2)

## Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset SCC that contain VEHICLE (SCC LVL 2) 
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehicleSCC,]

## Subset the vehicles NEI data by each city's fip and add city name.
vehiclesBaltimore <- subset(vehiclesNEI, vehiclesNEI$fips == "24510")
vehiclesBaltimore$city <- "Baltimore City"

vehiclesLA <- subset(vehiclesNEI, vehiclesNEI$fips == "06037")
vehiclesLA$city <- "Los Angeles"

## Combine cities into one data frame
bothNEI <- rbind(vehiclesBaltimore,vehiclesLA)

## Create plot
png(filename = "plot6.png")

ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  labs(x="Year", y="Total emissions (tons)") + 
  labs(title="Comparison of PM2.5 Vehicle emissions in Baltimore and Los Angeles")+
  theme(legend.position = "none")

dev.off()

