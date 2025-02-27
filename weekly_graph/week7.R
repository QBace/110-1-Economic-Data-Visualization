data0 <- data.frame(
  x=c(1, 1, 1),
  y=c(0.38, 1-0.38-0.57, 0.57),
  fill=factor(c("blue", "orange", "green"),levels=c("green", "orange", "blue"))
)
dx=2 #input$dx
h=0.8 #input$h
dy=0.08 #input$dy
ggplot()+
  geom_col(
    data=data0,
    mapping=aes(
      x=x, y=y, fill=fill
    )
  )+
  geom_text(
    mapping=
      aes(
        x=c(1+h, 1+h),
        y=c(0+dy, 1-dy),
        label=c("38%", "57%")
      ),
    size=16 #input$size
  )+
  xlim(1-dx,1+dx)+
  coord_flip()+
  theme_void()+
  theme(
    legend.position = "none"
  )
