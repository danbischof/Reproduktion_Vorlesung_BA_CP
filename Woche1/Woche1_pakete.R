# Dieser R-Code repliziert einige Grafiken aus Woche 5, schrittweise. 

# Erster Schritt in jedem R-Code ist das installieren und laden von Packages: 
# First, you need to have the devtools package installed
install.packages("devtools")
# now, install the vdemdata package directly from GitHub
devtools::install_github("vdeminstitute/vdemdata")
# To create a correlation matrix: 
install.packages("GGally")
# Paket, das verwendet wird um Pakete von Github zu installieren.
require(devtools)
require(vdemdata)
# Paket, das das Vdem Team geschrieben hat, um ihre Daten einfach zugänglich zu machen
require(dplyr)
# Paket, das verwendet wird um bestimmte Befehle und Funktionen zu verwenden
require(tidyr)
# Ähnlich wie dplyr
require(ggplot2)
# Paket, das verwendet wird um Grafiken zu erstellen

# Das war's es in Woche 1. Woche 2 übernimmt diesen Code und erweitert ihn: 
## wir laden die Daten vom Vdem Projekt mit R herunter.