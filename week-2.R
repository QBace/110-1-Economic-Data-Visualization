library(readr)
library(reshape2) 
library(dplyr)    
library(ggplot2)
library(scales)
台灣gdp <- read_csv("~/Desktop/台灣gdp.csv", col_types = cols(year1 = col_integer()))
select2<-select(台灣gdp,8:14) #圖取資料範圍
data6 <- melt(select2,id.vars= c("year1"))
ggplot(data6, aes(x = year1, y = value, color=variable)) + 
  geom_rect(aes(xmin = 2010,xmax = 2020,ymax = 0.73, ymin = -Inf),fill=alpha("grey",0.03),color=alpha("grey",0))+
  geom_rect(aes(xmin = 1990,xmax = 2000,ymax = 0.73, ymin = -Inf),fill=alpha("grey",0.03),color=alpha("grey",0))+
  geom_line(stat ="identity")+
  
  scale_y_continuous ("percent",labels = percent,expand = c(0,0))+
  scale_x_continuous ("西元",expand = c(0,1))+
  scale_color_manual(values =c("#499eb3","#e5c677","#3e4142","#6fc063","#b7524c","#F52318"), #圖示顏色
                     names(NULL), #圖示標題取消null
                     labels=c("民間消費","政府消費","資本形成","商品及服務輸出","商品及服務輸入","經濟成長"))+
  geom_hline(yintercept =0,color="black",linetype=5,size=0.3,alpha=0.5)+
  labs( title = "台灣歷年GDP與經濟成長走勢",caption = "資料來源：主計總處\n歷年台灣歷年GDP與經濟成長1981-2020年")