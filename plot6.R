  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  
  baltimore <- NEI[grepl("24510", NEI$fips),]
  la <- NEI[grepl("06037", NEI$fips),]
  
  scc2 <- SCC[grepl("Vehicle", SCC$EI.Sector),]
  vba <- baltimore[baltimore$SCC %in% scc2$SCC,]
  vla <- la[la$SCC %in% scc2$SCC,]
  mvba  <- vba[vba$type %in% "ON-ROAD",]
  mvla  <- vla[vla$type %in% "ON-ROAD",]
  sumba <- tapply(mvba$Emissions, mvba$year, sum)
  sumla <- tapply(mvla$Emissions, mvla$year, sum)
  groupba <- data.frame(total = sumba, year = c("1999", "2002", "2005", "2008"), type = rep("Baltimore", len = 4))
  groupla <- data.frame(total = sumla, year = c("1999", "2002", "2005", "2008"), type = rep("Los Angles", len = 4))
  group <- rbind(groupba, groupla)
  
  png(filename="plot6.png", width=480, height=480)
  g <- ggplot(group, aes(year, total, group = type ))
  g+geom_point(aes(color = type), size = 4, alpha = 1/2)+ labs(x = "Year", y = "Total Year Emissions")+geom_line(aes(color = type))
  dev.off()
