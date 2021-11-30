library(readr)
library(reshape)
library(ggplot2)
歷年台電系統發電廠裝置容量表 <- read_csv("~/Desktop/歷年台電系統發電廠裝置容量表.csv",col_types = cols(year = col_integer()))
select1<-select(歷年台電系統發電廠裝置容量表,1:7)

head(select1,10)

data5 <- melt(select1,id.vars= c("year"))

ggplot(data4, aes(x = year, y = value, fill = variable)) +
  geom_area(stat ="identity")+
  labs( x="民國",y = "佔比",size=10)+
  geom_hline(yintercept =25,color="red",linetype=5,size=0.3)+
  geom_hline(yintercept =50,color="red",linetype=5,size=0.3)+
  geom_hline(yintercept =75,color="red",linetype=5,size=0.3)+
  scale_y_continuous (expand = c(0,0))+
  scale_x_continuous (expand = c(0,0))+
  labs( title = "歷年台電系統發電廠裝置容量表",
        subtitle = "Structure of Electricity Installed Capacity")+
  scale_fill_manual(values =c("#5eb7b6","#73a74d","#c2604a","#e1872e","#57a9d5","#999b9f"),
                    names(NULL),
                    labels=c("抽蓄水力
Pumped Hydro","再生能源
Renewable Energy","燃油
Oil-Fired","核能
Nuclear","燃氣
LNG-Fired","燃煤
Coal-Fired"))