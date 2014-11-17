  NEI <- readRDS("summarySCC_PM25.rds")
  
  yeargroup <- tapply(NEI$Emissions, NEI$year, sum)
  group <- data.frame(total = yeargroup, year = c("1999", "2002", "2005", "2008"))
  png(filename="plot1.png", width=480, height=480)
  with(group, plot(year, total, ylab = "Total Year Emissions", xlab="Year"))
  dev.off()
