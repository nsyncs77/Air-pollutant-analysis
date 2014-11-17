  NEI <- readRDS("summarySCC_PM25.rds") 
  
  baltimore <- NEI[grepl("24510", NEI$fips),]
  
  point = baltimore[baltimore$type %in% "POINT",]
  nonpoint = baltimore[baltimore$type %in% "NONPOINT",]
  onroad = baltimore[baltimore$type %in% "ON-ROAD",]
  nonroad = baltimore[baltimore$type %in% "NON-ROAD",]
  
  yearpoint <- tapply(point$Emissions, point$year, sum)
  yearnonpoint <- tapply(nonpoint$Emissions, nonpoint$year, sum)
  yearonroad <- tapply(onroad$Emissions, onroad$year, sum)
  yearnonroad <- tapply(nonroad$Emissions, nonroad$year, sum)
  
  pointgroup <- data.frame(total = yearpoint, year = c("1999", "2002", "2005", "2008"), type = rep("point", len = 4))
  nonpointgroup <- data.frame(total = yearnonpoint, year = c("1999", "2002", "2005", "2008"), type = rep("nonpoint", len = 4))
  pointonroad <- data.frame(total = yearonroad, year = c("1999", "2002", "2005", "2008"), type = rep("onroad", len = 4))
  pointnonroad <- data.frame(total = yearnonroad, year = c("1999", "2002", "2005", "2008"), type = rep("nonroad", len = 4))
  
  group <- rbind(pointgroup, nonpointgroup, pointonroad, pointnonroad)
  png(filename="plot3.png", width=480, height=480)
  g <- ggplot(group, aes(year, total, group = type ))
  g+geom_point(aes(color = type), size = 4, alpha = 1/2)+ labs(x = "Year", y = "Total Year Emissions")+geom_line(aes(color = type))
  dev.off()               
