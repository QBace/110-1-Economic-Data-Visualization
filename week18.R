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
singal$data <- read_excel("~/Desktop/行動通信業務基地臺統計1.xlsx")
singal$inner <- {
  sf_taiwan_simplified$台灣本島$鄉鎮區 |>
    dplyr::inner_join(
      singal$data, by=c("map_id"="鄉鎮區")
    )
}
singal$cut_inner<-singal$inner
singal$cut_inner$基地臺 |> cut(c(0,200,500,1200,2000),ordered_result = T) -> .cut
levels(.cut) <- c("1-200","200-500","500-1200","1200-2000")
singal$cut_inner$基地臺 <- .cut
abc<-function(){
econDV2::ggmap2(taiwan_stamen$terrain)+
  econDV2::geom_sf_overggmap(
    data=singal$cut_inner,
    mapping=aes(
      fill=基地臺
    ),
    color="white",
    size=0.15,
    alpha=0.6,
    inherit.aes = F
  ) +
colorspace::scale_fill_discrete_sequential(
  palette="blue", 
  na.value="#dbd7a8"
)+
  theme_void()+
  labs( title = "台灣110年行動通信業務基地臺統計",caption = "資料來源：國家通訊傳播委員會\n行動通信業務基地臺統計(區分鄉鎮)")
}
#plotly::ggplotly(abc)|> htmltools::save_html(file="myplotly.html")
