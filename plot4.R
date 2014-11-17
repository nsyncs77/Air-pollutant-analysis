  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")     
  
  scc1 <- SCC[grepl("Coal", SCC$EI.Sector),]
  coal <- NEI[NEI$SCC %in% scc1$SCC,]
  yeargroup <- tapply(coal$Emissions, coal$year, sum)
  group <- data.frame(total = yeargroup, year = c("1999", "2002", "2005", "2008"))
  png(filename="plot4.png", width=480, height=480)
  with(group, plot(year, total, ylab = "Total Year Emissions by Coal Combustion-related Sources", xlab="Year"))
  dev.off()
