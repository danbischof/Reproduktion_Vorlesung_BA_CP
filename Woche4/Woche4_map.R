# The goal is to replicate Figure 3, left panel of Oh et al. (2022)
rm(list = ls())
# packages: 
library(dplyr)
library(readxl)
library(ggplot2)
library(sf)
library(viridis)
library(scales)
library(maps)
library(tmap)


# Load the data
signal_data <- read_excel("/Users/danielbischof/Documents/GitHub/Reproduktion_Vorlesung_BA_CP/Woche4/Iron Curtain TV Data/match_signalanddistance_GKZ19971231.xlsx")

# Load the shapefile or spatial data for the map
shape_data <- st_read("vg1000_1997-12-31.utm32w.shape.ebenen/vg1000_ebenen-historisch/de9712/vg1000gem.shp") # or another format as appropriate

shape_data <- shape_data %>%
  filter(KEY >= 01054078)

# Ok, damit wir die Datensätze miteinander verbinden können, brauchen wir Variablen die gleich heißen und identisch sind: 
## AGS scheint gleich aber unterschiedlich benannt. Ändern wir: 
signal_data <- signal_data %>%
  rename(AGS = `AGS 19971231`) %>% 
    rename(signal_strength = `ARD Signalstaerke (durchschn)`) %>% 
      rename(dis_brd = `Entfernung zur BRD (km)`) %>% 
        rename(GEN = Name)

shape_data <- shape_data %>%
  rename(AGS = KEY)

#signal_data <- signal_data[signal_data$AGS > 11000000, ]
#shape_data <- shape_data[shape_data$AGS > 11000000, ]


# Wir cleanen die Daten etwas, da ist viel drin was wir nicht brauchen: 


# Merge the signal data with the spatial data if needed
map_data <- merge(shape_data, signal_data, by = "GEN")


# Find the range of the signal_strength values
range_vals <- range(map_data$dis_brd, na.rm = TRUE)

# Plot the map with adjustments for scale_fill_viridis_c
ggplot(data = map_data) +
  geom_sf(aes(fill = dis_brd)) +
  scale_fill_viridis_c(
    limits = c(0, 254),  # Extend the limits to include the full range of your data
    na.value = "white"  # Set a color for NA values
  ) +
  labs(title = "Signal Strength (ARD) in East German Municipalities, 1989") +
  theme_minimal() +
  theme(legend.position = "right", text = element_text(size = 12))

# Plot the map with grayscale colors
ggplot(data = map_data) +
  geom_sf(aes(fill = dis_brd), lwd = 0.1, color = "black") +  # lwd = 0.1 makes the border lines thin
  scale_fill_gradient(
    low = "black",  # Close to border
    high = "white",  # Far from border
    na.value = NA,  # No fill for missing values
    name = "Distance to West Germany (km)"
  ) +
  labs(title = "Signal Strength (ARD) in East German Municipalities, 1989") +
  theme_void() +  # Removes most theme elements
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.position = "none"  # Turns off the legend
  )

ggplot(data = map_data) +
  geom_sf(aes(fill = dis_brd)) +
  scale_fill_gradient(low = "black", high = "white") +
  theme_void()
