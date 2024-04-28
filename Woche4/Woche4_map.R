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
signal_data <- read_excel("Iron Curtain TV Data/match_signalanddistance_GKZ19921231.xlsx")

# Load the shapefile or spatial data for the map
shape_data <- st_read("vg-hist.utm32s.shape/daten/utm32s/shape/GEM_2013_ew.shp") # or another format as appropriate

# Ok, damit wir die Datensätze miteinander verbinden können, brauchen wir Variablen die gleich heißen und identisch sind: 
## AGS scheint gleich aber unterschiedlich benannt. Ändern wir: 
signal_data <- signal_data %>%
  rename(AGS = `AGS 19921231`) %>% 
    rename(signal_strength = `ARD Signalstaerke (durchschn)`) %>% 
      rename(dis_brd = `Entfernung zur BRD (km)`) %>% 
        rename(GEN = Name)

signal_data <- signal_data[signal_data$AGS > 11000000, ]
shape_data <- shape_data[shape_data$AGS > 11000000, ]

## some of the AGS are not correct: 
signal_data <- signal_data %>%
  mutate(
    AGS = ifelse(
      AGS == 1.1e+07,
      "11000000",
      AGS
    ),
    AGS = ifelse(
      substr(AGS, 1, 2) == '15' & grepl("^15[123]", AGS),
      paste0('15', '0', substr(AGS, 4, nchar(AGS))),
      AGS
    )
  ) %>%
  # Ensure AGS is a character and remove any scientific notation
  mutate(AGS = format(AGS, scientific = FALSE)) %>%
  # If AGS must be numeric, convert it and ensure leading zeros where needed
  mutate(AGS = as.character(sprintf("%08d", as.numeric(AGS))))


# Wir cleanen die Daten etwas, da ist viel drin was wir nicht brauchen: 


# Merge the signal data with the spatial data if needed
map_data <- merge(shape_data, signal_data, by = "GEN")

# Remove rows with NA in signal_strength
map_data <- map_data[!is.na(map_data$dis_brd), ]

na_count <- sum(is.na(map_data$signal_strength))
print(na_count)

unique(map_data$STG)

geometry_na_count <- sum(is.na(st_geometry(map_data)))
print(paste("NA in geometry:", geometry_na_count))

# Find the range of the signal_strength values
range_vals <- range(map_data$dis_brd, na.rm = TRUE)

duplicates <- signal_data[duplicated(signal_data$AGS), ]
print(duplicates)

signal_data <- signal_data[!duplicated(signal_data$AGS), ]

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
