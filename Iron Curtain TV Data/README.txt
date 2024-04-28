The following files replicate the regressions in: 

Leonardo Bursztyn, Davide Cantoni: "A Tear in the Iron Curtain: The Impact of Western Television on Consumption Behavior" 
Forthcoming in The Review of Economics and Statistics.

The main analysis of the paper is conducted using the German Income and Expenditure Survey (Einkommens- und Verbrauchsstichprobe, EVS). Information on the EVS can be found on the website of the German statistical office, Destatis:

https://www.destatis.de/

The "Forschungsdatenzentrum" (research data centre) of the German statistical office provides access to different versions of the EVS:

http://www.forschungsdatenzentrum.de/bestand/evs/index.asp

Note that for the analyses conducted in the paper, on site access in necessary. This is because we use an augmented version of the EVS with sensitive personal data: the Western TV access data, which have been added to the EVS through the linkage of municipality codes.

The complete list of variables in the scientific use files of the EVS can be found here:

https://www.destatis.de/DE/ZahlenFakten/GesellschaftStaat/EinkommenKonsumLebensbedingungen/SUF_Listen/Metadaten_SUF_EVS.html

The replication files will be described in the following. Please note that all of these files can only be used for replication if the customized version of the EVS including the "Western TV access" variable is used. These data have only been made available to us under an agreement with the German Statistical Office. We are happy to help anyone interested in running a replication. Please contact us via email with any questions. Note that the scientific use files that are publicly accessible (or accessible without cost, after signing an agreement with the German Statistical Office) provide information about the place of residence only up to the level of a state ("Land"). This makes these scientific use files available without our help only partially useful for the research questions at hand.

Given the nature of the data, in this replication package we provide all the do files and log files used to generate the Tables in the paper. 

The following files are used to prepare the data. 

- evs93_cantoni_20140812preparedata.do 
	/* prepares the data for the EVS 1993 */
- evs98_cantoni_20140812preparedata.do 
	/* prepares the data for the EVS 1998 */
- evs_cantoni_advertising8089
	/* adds information about advertising intensity in 1980-1989 */
- evs93_cantoni_20140812reshape8089.do
	/* prepares the data for the "recomposition" (panel) analysis, EVS 1993 */
- evs98_cantoni_20140812reshape8089.do
	/* prepares the data for the "recomposition" (panel) analysis, EVS 1998 */

(For the variables' definitions, please refer to the list of metadata of the EVS provided through the link above)

The following files conduct the actual analyses. Please refer to the corresponding log files for the output:

- evs93_cantoni_20140812tables5_6.do
	/* conducts the "levels" analysis of Tables 5 and 6, EVS 1993 */
- evs98_cantoni_20140812tables5_6.do
	/* conducts the "levels" analysis of Tables 5 and 6, EVS 1998 */
- evs93_cantoni_20140812tables8_9_10_11.do
	/* conducts the "recomposition" analysis of Tables 8 through 11, EVS 1993 */
- evs98_cantoni_20140812tables8_9_10_11.do
	/* conducts the "recomposition" analysis of Tables 8 through 11, EVS 1998 */





NOTE: All hyperlinks checked on 2014/11/10.