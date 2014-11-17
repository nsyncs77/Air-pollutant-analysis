  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  scc2 <- SCC[grepl("Vehicle", SCC$EI.Sector),]
  vehicle <- NEI[NEI$SCC %in% scc2$SCC,]
  motor  <- vehicle[vehicle$type %in% "ON-ROAD",]
  yeargroup <- tapply(motor$Emissions, motor$year, sum)
  group <- data.frame(total = yeargroup, year = c("1999", "2002", "2005", "2008"))
  png(filename="plot5.png", width=480, height=480)
  with(group, plot(year, total, ylab = "Total Year Emissions by Motor Vehicles", xlab="Year"))
  dev.off()
