library ('sf')
library('ggplot2')
library('dplyr')
library('utils')
library('magrittr')
INDfires <- read.csv ('~/Data/Archive_fires_for_IndonesiaedtWed.csv')
#IMPORT THE JOINED HEXBIN MAP FROM THE FOLDER, SET IT FIRST LAYER
INDOmap <- read_sf('~/Downloads/utami_hex_map/selected.shp')
#IMPORT THE SIMPLIFIED MAP NEXT, AS THE SECOND LAYER
provinces <- read_sf('~/Downloads/utami-2/simplified.shp')
#CREATING THEME FOR THE MAP
theme_map <- theme(
  panel.background = element_blank(),
  plot.background = element_blank(),
  panel.grid.minor = element_blank(),
  text = element_text(family = "Helvetica", size=8),
  axis.title = element_text(size=12),
  axis.ticks = element_blank(),
  strip.background = element_blank(),
  panel.grid.major = element_line(colour = 'transparent'),
  axis.text = element_blank()
)
#CALLING THE MAP
ggplot() + geom_sf(data=INDOmap, aes(fill=NUMPOINTS), color=NA) + scale_fill_gradient(low="white", high="red", name="Fires") + theme_map + geom_sf(data=provinces, fill=NA, lwd=.15) + theme(plot.title = element_text (size = 12, face = "bold"), plot.subtitle = element_text(size=7, face = "plain"), plot.caption = element_text(size=7, face = "plain")) + labs (title="Forest Fires in Indonesia from 2012 to 2018", subtitle="Fire incidents spotted the most in Sumatera and Kalimantan Islands", caption="Source: The World Resource Institute (WRI) I By Utami Diah Kusumawati")
#YOU DONT NEED TO USE INNER JOINS BECAUSE IT IS ALREADY BEEN DONE IN THE QGIS (SELECTED.SHP. FILE)

