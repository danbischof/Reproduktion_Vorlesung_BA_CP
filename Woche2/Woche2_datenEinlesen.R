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

# Hier geht es los in Woche 2: 

# Wir laden die Daten vom VDem Projekt herunter:
## Das Vdem Projekt macht das gänzlich einfach: 

## Schauen wir uns kurz an was das Vdem Paket mit sich bringt: 
help(vdem)
### Einen Datensatz mit 27013 Observationen und 4108 Variablen

## um diesen in unser lokales R zu ziehen müssen wir "vdem" nur einem lokalen Datensatz zuordnen: 
vdem.raw <- vdem
### "<-" ordnet Dinge zueinander zu in R. Im Grunde steht hier gedanklich "=" 

## und nun können wir uns die Vdem Daten anschauen: 
dim(vdem.raw)

# nun können wir uns bsp. die ersten 10 
## but: you can also do that by clicking on "data" in the "Environment" field. 
names(vdem.raw)[1:10]
