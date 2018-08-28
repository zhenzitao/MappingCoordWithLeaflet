library(tidyverse)
library(leaflet) 
library(leafletCN)
# package to Convert coordinates
# devtools::install_github("caijun/geoChina")
library(geoChina)

# 经纬度：度分秒转换为十进制
lng_lat <- function(x,y){
  
  dat <- data.frame(lng = (as.numeric(substr(x,1,3)) + 
                             as.numeric(substr(x,4,5))/60 + 
                             as.numeric(substr(x,6,7))/3600) %>% 
                      round(5),
                    lat = (as.numeric(substr(y,1,2)) + 
                             as.numeric(substr(y,3,4))/60 + 
                             as.numeric(substr(y,5,6))/3600) %>% 
                      round(5))
  
  dat
}


gps <- lng_lat(1162527,395521)

# Convert Coordinates
gps_new <- conv(lon = gps$lng,lat = gps$lat, from = c("WGS-84"), to = c("GCJ-02"))

# leaflet
gps_new %>% 
leaflet() %>% 
  amap() %>%
  addAwesomeMarkers(lng = ~lng,
                    lat = ~lat)
