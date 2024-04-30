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
map_data <- merge(shape_data, signal_data, by = "AGS")


# Find the range of the signal_strength values
range_vals <- range(map_data$dis_brd, na.rm = TRUE)

# Define breaks and labels
breaks <- c(0, 15, 30, 60, 90, 120)
labels <- c("0-15", "15-30", "30-60", "60-90", "90-120", ">120")

# Plot the map with specified color scale
ggplot(data = map_data) +
  geom_sf(aes(fill = dis_brd)) +
  scale_fill_gradientn(
    colors = rev(gray.colors(length(breaks) - 1)),  # Gray scale for map colors
    breaks = breaks,
    labels = labels,
    limits = c(0, 120),
    na.value = "black"
  ) +
  labs(title = "Signal Strength (ARD) in East German Municipalities, 1989", fill = "Distance to BRD (km)") +
  theme_minimal() +
  theme(legend.position = "right", text = element_text(size = 12))




# Load the shapefile for regions
region_data <- st_read("vg-hist.utm32s.shape/daten/utm32s/shape/VG-Hist_1989-12-31_LAN.shp")

region_data <- region_data %>%
  filter(STG == "DDR")

# Define breaks and labels
breaks <- c(0, 15, 30, 60, 90, 120)
labels <- c("0-15", "15-30", "30-60", "60-90", "90-120", ">120")

# Ok, first plot is distance to the border which in essence seems to be the same as signal strength...
map <- ggplot(data = map_data) +
  geom_sf(aes(fill = dis_brd)) +
  geom_sf(data = region_data, fill = NA, color = "white", size = 0.5) + # Add regional borders
  scale_fill_gradientn(
    colors = rev(gray.colors(length(breaks) - 1)),  # Gray scale for map colors
    breaks = breaks,
    labels = labels,
    limits = c(0, 120),
    na.value = "black"
  ) +
  labs(title = "Signal Strength (ARD) in East German Municipalities, 1989", fill = "Distance to BRD (km)") +
  theme_minimal() +
  theme(legend.position = "right", text = element_text(size = 12))

ggsave("fig1_distance.pdf", plot = map, device = "pdf")


# Now signal strength: 
map2 <- ggplot(data = map_data) +
  geom_sf(aes(fill = signal_strength)) +
  geom_sf(data = region_data, fill = NA, color = "white", size = 0.5) + # Add regional borders
  labs(title = "Signal Strength (ARD) in East German Municipalities, 1989", fill = "") +
  scale_fill_gradientn(
    colors = c("black", "white"),  # Gradient from black to white
    values = scales::rescale(c(-120, -85, -60, -40, -30, 0)),  # Match scale to data range
    limits = range(map_data$signal_strength, na.rm = TRUE), # Ensure the limits match the range in the data
    na.value = "white" # Handle NA values gracefully
  ) +
  theme_minimal() +
  theme(legend.position = "right", text = element_text(size = 12))

ggsave("fig1_signal.pdf", plot = map2, device = "pdf")

