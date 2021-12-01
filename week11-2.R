library(readr)
library(reshape2) 
library(dplyr)    
library(ggplot2)
library(scales)
歷年台電發電量 <- read_csv("~/Desktop/發電量1.csv", col_types = cols(year = col_integer()))
select1<-select(歷年台電發電量,1:7) #圖取資料範圍

data5 <- melt(select1,id.vars= c("year")) #melt處理資料
ggplot(data5, aes(x = year, y = value, fill = variable)) + #依照x(year)做排序,固定抽蓄水力、燃煤、燃油、燃氣、再生能源、核能為variable,其餘值為value,
   geom_area(stat ="identity")+ #繪製面積圖
   geom_text(aes(x=2003,y=0.08,label="19.89%"),size=3,color="white")+   #2000年核能
   geom_text(aes(x=2003,y=0.2,label="2.81%"),size=3,color="white")+     #2000年再生能源
   geom_text(aes(x=2003,y=0.30,label="13.19%"),size=3,color="white")+   #2000年燃氣
   geom_text(aes(x=2003,y=0.40,label="10.56%"),size=3,color="white")+   #2000年燃油
   geom_text(aes(x=2003,y=0.75,label="51.75%"),size=3,color="white")+   #2000年燃煤
   geom_text(aes(x=2002.8,y=0.96,label="1.8%"),size=3,color="#57a9d5")+ #2000年抽蓄水力
   geom_text(aes(x=2019,y=0.05,label="11.22%"),size=3,color="white")+   #2020年核能
   geom_text(aes(x=2019,y=0.14,label="5.47%"),size=3,color="white")+    #2020年再生能源
   geom_text(aes(x=2019,y=0.35,label="35.66%"),size=3,color="white")+   #2020年燃氣
   geom_text(aes(x=2019,y=0.55,label="1.58%"),size=3,color="#c2604a")+  #2020年燃油
   geom_text(aes(x=2019,y=0.75,label="44.95%"),size=3,color="white")+   #2020年燃煤
   geom_text(aes(x=2019,y=0.97,label="1.13%"),size=3,color="#57a9d5")+  #2020年抽蓄水力
   geom_hline(yintercept =0.25,color="red",linetype=5,size=0.3,alpha=0.3)+  #25%虛線
   geom_hline(yintercept =0.50,color="red",linetype=5,size=0.3,alpha=0.3)+  #50%虛線
   geom_hline(yintercept =0.75,color="red",linetype=5,size=0.3,alpha=0.3)+  #75%虛線
  scale_y_continuous ("佔比",labels = percent,expand = c(0,0))+ #y軸美學
  scale_x_continuous ("西元",expand = c(0,0))+ #x軸美學
  labs( title = "歷年台電發電量",subtitle = "Electricity Generation",caption = "資料來源：經濟部能源局\n歷年台電發電量2002-2020年")+ #標題與副標題
  scale_fill_manual(values =c("#57a9d5","#999b9f","#c2604a","#5eb7b6","#73a74d","#e1872e"), #圖示顏色
                    names(NULL), #圖示標題取消null
                    labels=c("抽蓄水力\nPumped Hydro","燃煤\nCoal-Fired","燃油\nOil-Fired","燃氣LNG-Fired","再生能源\nRenewable Energy","核能\nNuclear")#圖示文字
)
