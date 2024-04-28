*** Aufzeichung in Protokoll starten

clear
capture log close
log using "Z:\GWA4 - Cantoni\D_Ergebnisse\evs_cantoni_20140812table4.log", replace

***************************************************************************
***************************************************************************
*** Titel des Projekts: <Clueless? The impact of television on consumption behavior.>
*** Datengrundlage: <EVS 1993, EVS1998>
*** Dateiname des Programmcodes: evs_cantoni_20140812table4.do
*** erstellt: <2014/08/12> 
*** von: <Davide Cantoni> 
*** E-Mail: <cantoni@lmu.de> 
*** Tel.: <0176/21816773> 
*** Dateiname der Output-Files: <evs_cantoni_20140812table4.log> 
*** 
*** Grundriss des Programms: <Programm zur Untersuchung von 
*** Unterschieden im Konsumverhalten zwischen ehem. DDR-Regionen mit Zugang 
*** zu westlichen Fernsehsendern und solchen ohne.>
*** 
*** Verwendete Variablen: 
*** Originalvariablen: 	<mehrere>
*** 
*** Neu angelegte Variablen: <bula*: Bundesland-Dummy
***				berlinost: Dummy fuer Haushalte in Ostberlin
***				smallcity: Kleinstadt-Dummy
***				age: Ungefaehres Alter 
***				agesq: (Ungefaehres Alter)^2
***				single: Alleinstehend-Dummy
***				german: Dummy fuer deutsche Nationalitaet
***				female: Dummy fuer Frauen
***				employed: Dummy fuer Vollzeitbeschaeftigte 
***				retired: Dummy fuer Rentner 
***				onwelfare: Dummy fuer Sozialhilfeempfaenger 
***				treat: Neucodierung von ard_signalstaerke
***				netincome: Umbenennung von ef19 (EVS1993)
***				disposableincome: Umbenennung von ef21 (EVS1993)
***				weight: Umbenennung von ef66 (EVS1993)>
***
*** Gewichtungsvariablen: <ef66: Umbenannt als "weight" (EVS1993)>
***
***************************************************************************
***************************************************************************

	
	*** Version festlegen

version 9.1

	*** Bildschirmausgabe steuern

set more off

	*** Arbeitsspeicher festlegen

set mem 750m

	*** Arbeitsverzeichnis festlegen

cd "Z:\GWA4 - Cantoni\D_Ergebnisse\"

	*** Datensatz vorbereiten - EVS 1993
	*** (prepare dataset - EVS 1993)

do "Z:\GWA4 - Cantoni\C_Programm\evs93_cantoni_20140812preparedata.do"

	*** Testen der Vergleichbarkeit der "Treatment"-Gruppen
	*** unter Beruecksichtigung der Gewichtungsvariable
	*** (testing balancedness of the sample, weighted)
	
drop if berlinost==1

svyset [w=weight]

tempname p
postfile `p' str12 variable float ncont ntreat mucont mutreat diff sediff pvalue using ttests_evs93, replace

foreach X of varlist disposableincome age kids single female german employed retired onwelfare smallcity {
	local counter=`=`counter'+1'
	disp in white  ""
	disp in white  "Two-sample t test of variable `X'"
	disp in white  "========================================"
	svy: mean `X', over(treat)
	matrix means=e(b)
	local mucont=means[1,1] 
	local mutreat=means[1,2] 

	lincom [`X']1 - [`X']0
	local diff=r(estimate) 
	local sediff=r(se) 
	local pvalue=2*ttail(r(df), abs(r(estimate)/r(se))) 
	
	count if `X'<. & treat==1
	local ntreat=r(N)
	count if `X'<. & treat==0
	local ncont=r(N)

	post `p' ("`X'") (`ncont') (`ntreat') (`mucont') (`mutreat') (`diff') (`sediff') (`pvalue') 

}

postclose `p'

	*** Ausgabe einer Zusammenfassung der Ergebnisse der t-tests
	*** (print summary of t-tests)

preserve

use "Z:\GWA4 - Cantoni\D_Ergebnisse\ttests_evs93.dta", clear

format mucont mutreat diff sediff pvalue %9.3f
list variable ntreat ncont mutreat mucont diff sediff pvalue, clean

restore

erase "Z:\GWA4 - Cantoni\D_Ergebnisse\ttests_evs93.dta"



	*** Datensatz vorbereiten - EVS 1998
	*** (prepare dataset - EVS 1998)

clear
do "Z:\GWA4 - Cantoni\C_Programm\evs98_cantoni_20140812preparedata.do"
replace disposableincome=4*disposableincome // values are defined per quarter in EVS98

	*** Testen der Vergleichbarkeit der "Treatment"-Gruppen
	*** unter Beruecksichtigung der Gewichtungsvariable
	*** (testing balancedness of the sample, weighted)
	
drop if berlinost==1

svyset [w=weight]

tempname p
postfile `p' str12 variable float ncont ntreat mucont mutreat diff sediff pvalue using ttests_evs98, replace

foreach X of varlist disposableincome age kids single female german employed retired onwelfare smallcity {
	local counter=`=`counter'+1'
	disp in white  ""
	disp in white  "Two-sample t test of variable `X'"
	disp in white  "========================================"
	svy: mean `X', over(treat)
	matrix means=e(b)
	local mucont=means[1,1] 
	local mutreat=means[1,2] 

	lincom [`X']1 - [`X']0
	local diff=r(estimate) 
	local sediff=r(se) 
	local pvalue=2*ttail(r(df), abs(r(estimate)/r(se))) 
	
	count if `X'<. & treat==1
	local ntreat=r(N)
	count if `X'<. & treat==0
	local ncont=r(N)

	post `p' ("`X'") (`ncont') (`ntreat') (`mucont') (`mutreat') (`diff') (`sediff') (`pvalue') 

}

postclose `p'

	*** Ausgabe einer Zusammenfassung der Ergebnisse der t-tests
	*** (print summary of t-tests)

preserve

use "Z:\GWA4 - Cantoni\D_Ergebnisse\ttests_evs98.dta", clear

format mucont mutreat diff sediff pvalue %9.3f
list variable ntreat ncont mutreat mucont diff sediff pvalue, clean

restore

erase "Z:\GWA4 - Cantoni\D_Ergebnisse\ttests_evs98.dta"

log close
