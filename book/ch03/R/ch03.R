setwd("~/projects/book/ch03")
pkg = c("ggplot2", "lattice")
new.pkg <- pkg[!(pkg %in% installed.packages())]
if (length(new.pkg)) {
  install.packages(new.pkg)  
}

library(ggplot2)

avURL <- "http://datadrivensecurity.info/book/ch03/data/reputation.data"
avRep <- "data/reputation.data"
if (file.access(avRep)) {
  download.file(avURL, avRep) 
}

av <- read.csv(avRep,sep="#", header=FALSE)
colnames(av) <- c("IP", "Reliability", "Risk", "Type",
                  "Country", "Locale", "Coords", "x")
str(av)
head(av)
summary(av$Reliability)

country.top20 = names(summary(av$Country))[1:20]
summary(av$Risk)
table(av$Reliability)
table(av$Risk)
summary(av$Type, maxsum=10)
summary(av$Country, maxsum=40)

country.top20 = names(summary(av$Country))[1:20]
gg = ggplot(data=subset(av,Country %in% country.top20), 
            aes(x=reorder(Country, Country, length)))
gg = gg + geom_bar(fill="#000099")
gg = gg + labs(title="Country Counts", x="Country", y="Count")
gg = gg + coord_flip()
gg = gg + theme(panel.grid=element_blank(),
                 panel.background=element_blank())
print(gg)

gg = ggplot(data=av, aes(x=Risk))
gg = gg + geom_bar(fill="#000099")
g = gg + scale_x_discrete(limits=seq(max(av$Risk)))
gg = gg + labs(title="'Risk' Counts", x="Risk Score", y="Count")
gg = gg + theme(panel.grid=element_blank(),
                 panel.background=element_blank())
print(gg)

gg <- ggplot(data=av, aes(x=Reliability))
gg <- gg + geom_bar(fill="#000099")
gg <- gg + scale_x_discrete(limits=seq(max(av$Reliability)))
gg <- gg + labs(title="'Reliabiity' Counts", x="Reliability Score",
                y="Count")
gg <- gg + theme(panel.grid=element_blank(),
                 panel.background=element_blank())
print(gg)

country10 <- summary(av$Country, maxsum=10)
country.perc10 <- country10/nrow(av)
print(country.perc10)
