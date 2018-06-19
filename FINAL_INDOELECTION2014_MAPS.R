library('sf')
library('ggplot2')
library('dplyr')
library('utils')
library('magrittr')
indoelection14 <- "~/Data/ELECTIONRESULT_INDO2014"
indoelection09 <- "~/Data/ELECTIONRESULT_INDO2009"
library(read_sf("archive"))
mapindo <-read_sf("~/Data/archive/archive.shp")
is.data.frame(indoelection09)
is.data.frame(indoelection14)
head(indoelection09)
head(indoelection14)
is.data.frame(indoelection09)
indoelection09 <- read.csv("~/Data/ELECTIONRESULT_INDO2009.csv")
indoelection14 <- read.csv("~/Data/ELECTIONRESULT_INDO2014.csv")
is.data.frame(indoelection09)
head(indoelection09)
is.data.frame(indoelection14)
head(indoelection14)
mapindo <-read_sf("https://unl.app.box.com/s/0rcria7w75wgqictphah3bb17ftlc7x0")
map <- read_sf('~/Downloads/utami/simplified.shp')
map_df <- fortify(map)
map_df <- as.data.frame (map)
nrow(map_df)
View(map_df)
write.csv(map_df, "map_sf.csv")
View(map_df)
results14 <- read.csv('~/Downloads/utami/results14.csv') 
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
resultsmap <- map %>% inner_join(results14, by="A1NAME")
ggplot(resultsmap) + theme_map + geom_sf(col="transparent", aes(fill=Winner), color=NA) + scale_fill_brewer(type = 'qual', palette = 6) + theme(plot.title = element_text (size = 12, face = "bold"), plot.subtitle = element_text(size=9, face = "plain"), plot.caption = element_text(size=5, face = "plain")) + labs (title="2014 Presidential Election Result in Indonesia", subtitle="Joko Widodo and Jusuf Kalla won by 53.15 percent", caption="Source: The Indonesian General Commission Committee (KPU) I By Utami Diah Kusumawati")
library(RColorBrewer)
display.brewer.all()

forestfireINDbyyear <- forestfireIND %>% mutate(
  year = format(as.POSIXct(ACQ_DATE, format="%Y-%m-%dT%H:%M%OSZ"), "%Y")
) %>%
group_by(A1NAME) %>%
summarize(
    count = n(),
    avg_brightness = mean(BRIGHTNESS)
)

