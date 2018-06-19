library ('sf')
library('ggplot2')
library('dplyr')
library('utils')
library('magrittr')
INDfires <- read.csv ('~/Data/Archive_fires_for_IndonesiaedtWed.csv')
points <- read_sf('~/Downloads/utami-2/centroids.shp')
INDOmap <- read_sf('~/Downloads/utami_hex_map/selected.shp')
firesbyprovince <- INDfires %>%mutate(
  year= format(as.POSIXct (ACQ_DATE, format="%Y-%m-%dT%H:%M%OSZ"), "%Y"),
)%>%group_by(A1NAME) %>% summarize(
  count=n(),
  avg_brightness = mean (BRIGHTNESS)
)%>% filter( (count>1)
)
bubblemap <- points %>% inner_join(firesbyprovince, by="A1NAME")
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
ggplot(INDOmap) + theme_map + geom_sf() + geom_sf(data=bubblemap, aes(size=count, color=avg_brightness)) + scale_color_gradient(low="yellow", high="red") + scale_size(range=c(0,15)) + theme(plot.title = element_text (size = 12, face = "bold"), plot.subtitle = element_text(size=9, face = "plain"), plot.caption = element_text(size=7, face = "plain")) + labs (title="Forest Fires in Indonesia from 2012 to 2018", subtitle="Fire incidents spotted the most in Sumatera and Kalimantan Islands", caption="Source: The World Resource Institute (WRI) I By Utami Diah Kusumawati")
x11();dev.off()
