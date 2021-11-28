library(reshape)
library(ggplot2)
data1 <- data.frame("Year"=c(105,106,107,108,109),
                    "再生能源"<-c(1.83, 1.76, 1.78, 1.95, 2.09),
                    "核能"<-c(6.25, 4.43, 5.39, 6.31, 6.57),
                    "天然氣"<-c(13.66, 15.15, 15.21, 14.97, 17.17),
                    "煤及煤產品"<-c(29.35, 30.19, 29.44, 29.85, 30.00),
                    "原油及石油產品"<-c(48.91, 48.47, 48.18, 46.92, 44.17)
)

mdata <- melt(data1,id.var ="Year")
plot(ggplot(mdata, aes(x = Year, y = value, fill = variable)) +
       geom_bar(stat ="identity",width=0.5)+
       labs( y = "佔比",size=10)+
       geom_text(aes(label=value),size=2.3,color="black",position = position_stack(0.5))
)+
  coord_flip()+
  scale_y_continuous (expand = c(0,0))+
  labs( title = "台灣能源供給",
        subtitle = "Energy Supply")+
  scale_fill_manual(values=c("#73a74d","#e0872e","#56a8d5","#9d9fa3","#c15f48"),
                    name="能源供給之原料",
                    labels=c("再生能源","核能","天然氣","煤及煤產品","原油及石油產品")
  )
