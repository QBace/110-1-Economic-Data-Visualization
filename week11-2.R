library(readr)
library(reshape2)
library(ggplot2)
歷年台電系統發電廠裝置容量表 <- read_csv("~/Desktop/歷年台電系統發電廠裝置容量表.csv",col_types = cols(year = col_integer()))
select1<-select(歷年台電系統發電廠裝置容量表,1:7) #圖取資料範圍

data5 <- melt(select1,id.vars= c("year")) #melt處理資料
ggplot(data5, aes(x = year, y = value, fill = variable)) + #依照x(year)做排序,固定抽蓄水力、燃煤、燃油、燃氣、再生能源、核能為variable,其餘值為value,
   geom_area(stat ="identity")+ #繪製面積圖
   geom_text(aes(x=2001,y=8,label="17.36%"),size=3.2,color="white")+ #左右文字
   geom_text(aes(x=2001,y=20,label="6.14%"),size=3.2,color="white")+
   geom_text(aes(x=2001,y=30,label="16.08%"),size=3.2,color="white")+
   geom_text(aes(x=2001,y=50,label="18.24%"),size=3.2,color="white")+
   geom_text(aes(x=2001,y=75,label="33.41%"),size=3.2,color="white")+
   geom_text(aes(x=2000.8,y=96,label="90%"),size=3.2,color="white")+
   geom_text(aes(x=2019,y=5,label="7.78%"),size=3.2,color="white")+
   geom_text(aes(x=2019,y=16,label="18.48%"),size=3.2,color="white")+
   geom_text(aes(x=2019,y=40,label="35.78%"),size=3.2,color="white")+
   geom_text(aes(x=2019.2,y=62,label="3.2%"),size=3.2,color="white")+
   geom_text(aes(x=2019,y=80,label="29.53%"),size=3.2,color="white")+
   geom_text(aes(x=2019,y=97,label="5.23%"),size=3.2,color="white")+
   geom_hline(yintercept =25,color="red",linetype=5,size=0.3,alpha=0.3)+
   geom_hline(yintercept =50,color="red",linetype=5,size=0.3,alpha=0.3)+
   geom_hline(yintercept =75,color="red",linetype=5,size=0.3,alpha=0.3)+
  scale_y_continuous ("佔比",expand = c(0,0))+ #y軸美學
  scale_x_continuous ("西元",expand = c(0,0))+ #x軸美學
  labs( title = "歷年台電系統發電廠裝置容量表",subtitle = "Structure of Electricity Installed Capacity")+ #標題與副標題
  scale_fill_manual(values =c("#57a9d5","#999b9f","#c2604a","#5eb7b6","#73a74d","#e1872e"), #圖示顏色
                    names(NULL), #圖示標題取消null
                    labels=c("抽蓄水力
Pumped Hydro","燃煤
Coal-Fired","燃油
Oil-Fired","燃氣
LNG-Fired","再生能源
Renewable Energy","核能
Nuclear")) #圖示文字
