NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- NEI[grepl("24510", NEI$fips),]
yeargroup <- tapply(baltimore$Emissions, baltimore$year, sum)
group <- data.frame(total = yeargroup, year = c("1999", "2002", "2005", "2008"))
png(filename="plot2.png", width=480, height=480)
with(group, plot(year, total, ylab = "Total Year Emissions from Baltimore", xlab="Year"))
dev.off()
