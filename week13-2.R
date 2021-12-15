library(readr)
library(dplyr)    
library(ggplot2)
library(scales)
library(tidyr)
台灣gdp <- read_csv("~/Desktop/台灣gdp.csv", col_types = cols(year1 = col_integer()))
select2<-select(台灣gdp,8:14) 

p1<-mutate(select2,low_min = pmin(商品及服務輸出佔比, 商品及服務輸入佔比), low_max = pmax(商品及服務輸出佔比, 商品及服務輸入佔比),high_min = low_min, high_max = low_max)
p1$low_min[p1$商品及服務輸出佔比 > p1$ 商品及服務輸入佔比] = NA
p1$low_max[p1$商品及服務輸出佔比 > p1$ 商品及服務輸入佔比] = NA
p1$high_min[p1$商品及服務輸出佔比 <= p1$ 商品及服務輸入佔比] = NA
p1$high_max[p1$商品及服務輸出佔比 <= p1$ 商品及服務輸入佔比] = NA
  ggplot(p1,aes(x = year1))+
    geom_rect(aes(xmin = 1981,xmax = 1986,ymax = 0.9, ymin = -0.05),fill=alpha("grey",0.03),color=alpha("grey",0))+
    geom_rect(aes(xmin = 2010,xmax = 2020,ymax = 0.9, ymin = -0.05),fill=alpha("grey",0.03),color=alpha("grey",0))+
    geom_rect(aes(xmin = 1990,xmax = 2000,ymax = 0.9, ymin = -0.05),fill=alpha("grey",0.03),color=alpha("grey",0))+
    geom_ribbon(aes(ymin = low_min, ymax = low_max), fill = "#F52318", alpha = 0.4) +
    geom_ribbon(aes(ymin = high_min, ymax = high_max), fill = "#6fc063", alpha = 0.4)+
    geom_line(aes(y=商品及服務輸出佔比),colour = "#6fc063")+
    geom_line(aes(y=商品及服務輸入佔比),colour = "#b7524c")+
    geom_line(aes(y=民間消費佔比),colour = "#499eb3")+
    geom_line(aes(y=政府消費佔比),colour = "#F0C10F")+
    geom_line(aes(y=資本形成佔比),colour = "#3e4142")+
    geom_line(aes(y=經濟成長),colour = "#F52318",linetype=8)+
    geom_text(aes(x=2018,y=0.7,label="商品及服務輸出"),size=3.6,color="#6fc063")+
    geom_text(aes(x=2018,y=0.57,label="商品及服務輸入"),size=3.6,color="#b7524c")+
    geom_text(aes(x=2017,y=0.47,label="民間消費"),size=3.6,color="#499eb3")+
    geom_text(aes(x=2018,y=0.16,label="政府消費"),size=3.6,color="#F0C10F")+
    geom_text(aes(x=2018,y=0.25,label="資本形成"),size=3.6,color="#3e4142")+
    geom_text(aes(x=2018,y=0.06,label="經濟成長"),size=3.6,color="#F52318")+
    geom_label(aes(x=2014,y=0.62,label="貿易順差"),size=3.6,color="#6fc063")+
    geom_label(aes(x=1994,y=0.41,label="貿易逆差"),size=3.6,color="#b7524c")+
    geom_vline(xintercept = 2009,color ="#F067CF",linetype=5)+
    geom_label(aes(x=2009,y=0.74,label="次\n貸\n風\n暴"),size=2.5,color="#F067CF")+
    geom_vline(xintercept = 2001,color ="#F067CF",linetype=5)+
    geom_label(aes(x=2001,y=0.7,label="網\n路\n泡\n沫"),size=2.5,color="#F067CF")+
    geom_vline(xintercept = 1990,color ="#F067CF",linetype=5)+
    geom_label(aes(x=1990,y=0.6,label="第\n三\n次\n石\n油\n危\n機"),size=2.5,color="#F067CF")+
    geom_vline(xintercept = 1985,color ="#F067CF",linetype=5)+
    geom_label(aes(x=1985,y=0.6,label="廣\n場\n協\n議"),size=2.5,color="#F067CF")+
    geom_vline(xintercept = 1982,color ="#F067CF",linetype=5)+
    geom_label(aes(x=1982,y=0.59,label="第\n二\n次\n石\n油\n危\n機"),size=2.8,color="#F067CF")+
    geom_label(aes(x=1983.5,y=0.78,label="第二次的進口替代"),size=3,color="grey")+
    geom_label(aes(x=1988,y=0.835,label="經濟自由化"),size=3,color="grey")+
    geom_label(aes(x=1993,y=0.78,label="民 主 化 階 段"),size=3,color="grey")+
    
  scale_y_continuous ("percent",labels = percent,expand = c(0,0))+
  scale_x_continuous ("西元",expand = c(0,1))+
  scale_color_manual(values =c("#499eb3","#e5c677","#3e4142","#6fc063","#b7524c","#F52318"),
                     names(NULL),labels=c("民間消費","政府消費","資本形成","商品及服務輸出","商品及服務輸入","經濟成長"))+
  geom_hline(yintercept =0,color="black",linetype=5,size=0.3,alpha=0.5)+
  labs( title = "台灣歷年GDP與經濟成長走勢",caption = "資料來源：主計總處\n歷年台灣歷年GDP與經濟成長1981-2020年")
p1
