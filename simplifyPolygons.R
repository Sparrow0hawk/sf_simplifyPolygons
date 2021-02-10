library(sf)
library(leaflet)
library(sp)
library(rgdal)

big_geojson <- st_read("../mynearestleedsmarginal2019/assets/data/2021_leeds_df1.geojson")

big_geojson2 <- st_simplify(big_geojson, dTolerance = 0.001)

sp_bigGeo <- as(st_zm(big_geojson2), "Spatial")

object.size(sp_bigGeo)


leaflet() %>%
  addPolygons(data = sp_bigGeo) %>%
  addTiles()

writeOGR(sp_bigGeo, 
         "../mynearestleedsmarginal2019/assets/data/2021_leeds_df3.geojson", 
         layer="meuse", 
         driver="GeoJSON")
