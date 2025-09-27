%let pgm=utl-annotate-points-on-a-map-using-the-personal-edition-of-the-altair-slc;

%stop_submission;

Annotate points on a map using the personal edition of the altair slc

High res graphic
https://tinyurl.com/ym56k8u7
https://github.com/rogerjdeangelis/utl-annotate-points-on-a-map-using-the-personal-edition-of-the-altair-slc/blob/main/slov_map.pdf

github
https://tinyurl.com/4fjnmtr7
https://github.com/rogerjdeangelis/utl-annotate-points-on-a-map-using-the-personal-edition-of-the-altair-slc

community.altair
https://tinyurl.com/muacxxy
https://community.altair.com/discussion/64140/managing-maps-in-altair-wrap?tab=accepted#latest

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

have

 X     Y    LABEL

18    48    Lake
18    48.5  City
19    49    Town


&_init_;
options validvarname=upcase;
libname sd1 sas7bdat "d:/sd1";
data sd1.have;
  INPUT x y label$;
cards4;
18 48 Lake
18 48.5 City
19 49 Town
;;;;
run;quit;

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

&_init_ ;
%utlfkil(d:/pdf/slov_map.pdf);

libname sd1 sas7bdat "d:/sd1";
options set=RHOME "D:\d451";
proc r;
export data=sd1.have r=slov_df;
submit;
library(sqldf)
library(ggplot2)
library(terra)
library(geodata)
library(tidyterra)
options(sqldf.dll = "d:/dll/sqlean.dll")
print(have)

# Load Slovakia map data
slovakia_level_1 <- gadm(country = "SVK", level = 1, path = "d:/sd1")
slovakia_level_2 <- gadm(country = "SVK", level = 2, path = "d:/sd1")

# Plot with labels
slov_map<-ggplot() +
  geom_spatvector(data = slovakia_level_1, fill = "lightblue", color = "blue") +
  geom_spatvector(data = slovakia_level_2, fill = NA, color = "grey") +
  geom_point(data = slov_df, aes(x = X, y = Y), color = "black", size = 3) +
  geom_text(data = slov_df, aes(x = X, y = Y, label = LABEL),
            vjust = -0.9, color = "darkred", size = 5) +  # vjust positions text above points
  theme_minimal()
ggsave(slov_map,file="d:/pdf/slov_map.pdf");
endsubmit;
;quit;run;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

https://tinyurl.com/ym56k8u7



                       gwT3VW  nru4KT                   wQ  pE
                     VYnnTg q7gD    PbJu     yq3JiHQ sJ0Kkwo6IKuRS
                  fV4C                IX  ApNZ     RgN           LCB
                  v                   gedyz                        YwQMtV
                 cO  _                   _                             xr
              lJeW  (_) City            (_) Town                      v5
      zJSpEjj32                                                       M
    bok                                                         _    AY
   wO                  _                         cIzI5t J1F6R       b
   d                  (_)  Lake                o0S   5202   Psx     KI
  sb                                          CK              vy6mDN8
  B8                              A nm     Gx1m
   Stq                             zLaPdgXwf
     iXo                  q1pQyGprAz
       uOO                U
         LAY1 FIq5d   lGMjmI
            fmNb  zW7s8


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
