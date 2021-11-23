library(readr)
data <- read_csv("~/Documents/data.csv")

dy=6

ggplot(data=data,
)+ 
  geom_col(
    mapping=aes(
      x=系所,
      y=招生名額,
      fill=系所,
    )
  )+
  geom_text(
    mapping=aes(
      x=系所,
      y=招生名額+dy,
      label=招生名額
    ),
    size=3,
  )+
  coord_flip()+
  labs(title = "110學年度國立臺北大學各研究所招生名額"
  ) -> plot
plot