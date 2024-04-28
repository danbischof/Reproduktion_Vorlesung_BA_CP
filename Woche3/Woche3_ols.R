# The goal is to replicate Figure 3, left panel of Oh et al. (2022)

# First step in R-code is always to call packages. 
# Packages are small programmes which we need to download before we can use them: 
require(dplyr)
require(broom)
require(ggplot2)
require(haven)

# Dieses mal sind die Daten eine Stata Datei. R kann im Grunde alles lesen: 
## wir müssen in R jeweils nur das richtige Paket zum laden finden. 
## haven (oben geladen) kann im Grunde fast alles einlesen: 
Woche3_data <- read_dta("Woche3_data.dta")

## wie sehen die Daten aus?
View(Woche3_data)

# simple bivariate Regression: 
## abhängige Variable: Polarisierung wie bei Bischof, Wagner
## unabhängige Variable: Eintritt der radikal Rechten: 
model <- lm(polarization ~ rtreatment, data = Woche3_data)

# Resultate: 
summary(model)
## Ergebnisse halten obwohl anderer Datensatz: 
## Datensatz beinhaltet nur Länder die von 1973 bis 2016 immer beobachtet werden

# Man kann das auf graphisch darstellen: 
## wir interessieren uns nur für rtreatment, die Konstante kann raus: 
coefficients_rtreatment <- coefficients %>%
  filter(term == "rtreatment")

# Grafik erstellen: 
coefficient_plot <- ggplot(coefficients_rtreatment, aes(x = term, y = estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = estimate - std.error, ymax = estimate + std.error), width = 0.2) +
  labs(x = "", y = "Coefficient Estimate", angle = 90) +  # Rotate y-axis label
  theme_minimal() +
  coord_flip() +
  scale_x_discrete(labels = c("Entrance of the radical right into parliament")) +  # Change x-axis label
  geom_hline(yintercept = 0, linetype = "dashed") +  # Add dashed line at y = 0
  ylim(0, 0.2)  # Set y-axis limits

# Grafik rechts im Kasten "Plot" laden:
coefficient_plot