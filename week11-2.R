library(reshape)
library(ggplot2)
data3 <-data.frame("Year"=c(89:109),
                   "抽蓄水力"<-c(8.78,8.63,8.15,7.82,7.52,7.20,6.96,6.83,6.74,6.47,6.36,6.28,6.35,6.32,6.38,6.34,6.18,6.21,5.83,5.45,5.23),
                   "再生能源"<-c(6.14,6.05,5.99,5.74,5.53,5.34,5.37,5.52,5.65,5.73,5.99,7.80,8.31,8.73,9.25,9.80,10.26,11.43,13.16,14.97,18.48),
                   "燃油"<-c(18.24,15.39,11.21,10.70,10.18,9.99,9.66,9.48,9.34,8.97,8.86,8.03,8.12,8.08,8.15,8.10,7.89,6.14,5.76,5.38,3.20),
                   "核能"<-c(17.36,17.07,16.12,15.45,14.87,14.24,13.76,13.51,13.31,12.78,12.57,12.42,12.55,12.49,12.61,12.54,12.21,12.28,10.10,8.10,7.78),
                   "燃氣"<-c(16.08,20.01,23.44,26.65,29.54,30.71,31.34,33.42,34.16,36.49,37.14,36.72,37.10,36.95,37.38,37.15,36.18,34.58,35.80,35.34,35.78),
                   "燃煤"<-c(33.41,32.85,35.08,33.64,32.36,32.52,32.91,31.24,30.79,29.56,29.08,28.74,27.57,27.43,26.23,26.07,27.29,29.36,29.35,30.76,29.53)
)
data4 <- melt(data3,id.var ="Year")
plot(ggplot(data4, aes(x = Year, y = value, fill = variable)) +
       geom_area(stat ="identity")+
       labs( x="民國",y = "佔比",size=10)+
       geom_hline(yintercept =25,color="red",linetype=5,size=0.3)+
       geom_hline(yintercept =50,color="red",linetype=5,size=0.3)+
       geom_hline(yintercept =75,color="red",linetype=5,size=0.3))+
  scale_y_continuous (expand = c(0,0))+
  scale_x_continuous (expand = c(0,0))+
  labs( title = "歷年台電系統發電廠裝置容量表",subtitle = "Structure of Electricity Installed Capacity")+
  scale_fill_manual(values =c("#5eb7b6","#73a74d","#c2604a","#e1872e","#57a9d5","#999b9f"),names(NULL),
                    labels=c("抽蓄水力
Pumped Hydro","再生能源
Renewable Energy","燃油
Oil-Fired","核能
Nuclear","燃氣
LNG-Fired","燃煤
Coal-Fired"))