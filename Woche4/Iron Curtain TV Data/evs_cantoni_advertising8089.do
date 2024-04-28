
	**** Advertising quantities for 1980-1989, ARD

gen seconds8089=.
replace seconds8089=19197 if good==100001 // Media, leisure 
replace seconds8089=38621 if good==100002 // Cleaning and washing 
replace seconds8089=62802 if good==100004 // Body care + mouth care
replace seconds8089=10358 if good==100005 // Cars, accessories
replace seconds8089=2741 if good==100006 // Clothes, textiles
replace seconds8089=149202 if good==100007 // All(food and drinks)
replace seconds8089=12863 if good==100008 // Home and garden
replace seconds8089=11210 if good==100012 // Pharmaceuticals
replace seconds8089=2898 if good==100013 // Photo, optics, watches, jewelry
replace seconds8089=4024 if good==100014 // Transportation and tourism
replace seconds8089=0 if good==100015 // All other private consumption

gen minpd8089=seconds8089/(60*365) // minutes per day

gen share8089=.
replace share8089=5.47 if good==100001 // Media, leisure 
replace share8089=11.00 if good==100002 // Cleaning and washing 
replace share8089=17.89 if good==100004 // Body care + mouth care
replace share8089=2.95 if good==100005 // Cars, accessories
replace share8089=0.78 if good==100006 // Clothes, textiles
replace share8089=42.50 if good==100007 // All(food and drinks)
replace share8089=3.66 if good==100008 // Home and garden
replace share8089=3.19 if good==100012 // Pharmaceuticals
replace share8089=0.83 if good==100013 // Photo, optics, watches, jewelry
replace share8089=1.15 if good==100014 // Transportation and tourism
replace share8089=0 if good==100015 // All other private consumption

gen ln_minpd8089=log(minpd8089)
replace ln_minpd8089=0 if good==100015


	**** Advertising quantities for 1980-1989, ZDF

gen seconds8089zdf=.
replace seconds8089zdf=27279 if good==100001 // Media, leisure 
replace seconds8089zdf=41870 if good==100002 // Cleaning and washing 
replace seconds8089zdf=66919 if good==100004 // Body care + mouth care
replace seconds8089zdf=9215 if good==100005 // Cars, accessories
replace seconds8089zdf=3840 if good==100006 // Clothes, textiles
replace seconds8089zdf=124586 if good==100007 // All(food and drinks)
replace seconds8089zdf=20039 if good==100008 // Home and garden
replace seconds8089zdf=18320 if good==100012 // Pharmaceuticals
replace seconds8089zdf=3035 if good==100013 // Photo, optics, watches, jewelry
replace seconds8089zdf=2304 if good==100014 // Transportation and tourism
replace seconds8089zdf=0 if good==100015 // All other private consumption

gen minpd8089zdf=seconds8089zdf/(60*365) // minutes per day

gen share8089zdf=.
replace share8089zdf=7.46 if good==100001 // Media, leisure 
replace share8089zdf=11.45 if good==100002 // Cleaning and washing 
replace share8089zdf=18.30 if good==100004 // Body care + mouth care
replace share8089zdf=2.52 if good==100005 // Cars, accessories
replace share8089zdf=1.05 if good==100006 // Clothes, textiles
replace share8089zdf=34.07 if good==100007 // All(food and drinks)
replace share8089zdf=5.48 if good==100008 // Home and garden
replace share8089zdf=5.01 if good==100012 // Pharmaceuticals
replace share8089zdf=0.83 if good==100013 // Photo, optics, watches, jewelry
replace share8089zdf=0.63 if good==100014 // Transportation and tourism
replace share8089zdf=0 if good==100015 // All other private consumption

gen ln_minpd8089zdf=log(minpd8089zdf)
replace ln_minpd8089zdf=0 if good==100015


	**** Advertising quantities for 1991-1997, ARD/MDR

gen seconds9197=.
replace seconds9197=11948 if good==100001 // Media, leisure 
replace seconds9197=29214 if good==100002 // Cleaning and washing 
replace seconds9197=34571 if good==100004 // Body care + mouth care
replace seconds9197=18303 if good==100005 // Cars, accessories
replace seconds9197=2256 if good==100006 // Clothes, textiles
replace seconds9197=134904 if good==100007 // All(food and drinks)
replace seconds9197=8717 if good==100008 // Home and garden
replace seconds9197=13026 if good==100012 // Pharmaceuticals
replace seconds9197=4202 if good==100013 // Photo, optics, watches, jewelry
replace seconds9197=5569 if good==100014 // Transportation and tourism
replace seconds9197=0 if good==100015 // All other private consumption

gen minpd9197=seconds9197/(60*365) // minutes per day

gen share9197=.
replace share9197=3.90 if good==100001 // Media, leisure 
replace share9197=9.54 if good==100002 // Cleaning and washing 
replace share9197=11.30 if good==100004 // Body care + mouth care
replace share9197=5.98 if good==100005 // Cars, accessories
replace share9197=0.74 if good==100006 // Clothes, textiles
replace share9197=44.08 if good==100007 // All(food and drinks)
replace share9197=2.85 if good==100008 // Home and garden
replace share9197=4.26 if good==100012 // Pharmaceuticals
replace share9197=1.37 if good==100013 // Photo, optics, watches, jewelry
replace share9197=1.82 if good==100014 // Transportation and tourism
replace share9197=0 if good==100015 // All other private consumption

gen ln_minpd9197=log(minpd9197)
replace ln_minpd9197=0 if good==100015

