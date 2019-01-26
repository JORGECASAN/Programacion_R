misDatos <- read.csv("C:/Users/jcasa/OneDrive/Cunef - MDS/PROGRAMACION EN R/Practica2/ontariotopbabynames_female_1917-2013_english.csv",skip=1, header = T, sep = ",")

miNombre <- misDatos[misDatos$Name == "GEORGE",]

frequency <- as.integer(miNombre$Frequency)
years <- as.integer(miNombre$Year)

library(ggplot2)

ggplot(miNombre)+ geom_smooth(aes(x=years, y= frequency))

ggplot(miNombre)+ geom_smooth(aes(x=years, y= frequency),method= 'loess', se = FALSE, show.legend = FALSE)




