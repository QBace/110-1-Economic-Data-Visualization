library(readr)
library(ggmap)
library(dplyr)
sf_taiwan_simplified <- econDV2::sf_taiwan_simplified
mp <- econDV2::Map()
background$台灣本島$鄉鎮區 <- function(){
  sf_taiwan_simplified$台灣本島$鄉鎮區 |>
    sf::st_cast("MULTIPOLYGON") |>
    mp$sf$make_background_map(
      color="white",
      size=0.14
    )
}
econDV2::Object(taiwan_stamen)
taiwan_stamen$terrain <- 
  ggmap::get_stamenmap(bbox, maptype="terrain", zoom=9) 
background$台灣本島$terrain <- 
  function(){
    ggmap::ggmap(taiwan_stamen$terrain)
  }

econDV2::Object(singal)
singal$data <- read_csv("~/Desktop/行動通信業務基地臺統計.csv")
singal$data |>
  group_by(鄉鎮區)|>
  summarise(
    基地臺,
    基地臺2=cut(基地臺, c(0, 300,800, 2000))
  )|>
  ungroup()-> singal$data_frequency
left_data <-
  sf_taiwan_simplified$`台灣本島`$鄉鎮區
right_data <- 
  singal$data_frequency |>
  mutate(
    鄉鎮區=
      stringr::str_replace(鄉鎮區, '台', "臺"))

singal$join$left <- {
  left_data |> 
    dplyr::left_join(
      right_data, by=c("map_id"="鄉鎮區")
    )
}

singal$join$right <- {
  left_data |> 
    dplyr::right_join(
      right_data, by=c("map_id"="鄉鎮區")
    )
}
singal$join$inner <- {
  left_data |> 
    dplyr::inner_join(
      right_data, by=c("map_id"="鄉鎮區")
    )
}
singal$sf <- singal$join$inner
econDV2::ggmap2(taiwan_stamen$terrain)+
  econDV2::geom_sf_overggmap(
    data=singal$sf,
    mapping=aes(
      fill=基地臺
    ),
    color="white",
    size=0.15,
    alpha=0.8,
    inherit.aes = F
  ) +
  colorspace::scale_fill_continuous_sequential(
    palette="blue", 
    na.value="#dbd7a8"
  )+
  labs( title = "台灣110年行動通信業務基地臺統計",caption = "資料來源：國家通訊傳播委員會\n行動通信業務基地臺統計(區分鄉鎮)")

#plotly::ggplotly(abc)|> htmltools::save_html(file="myplotly.html")
