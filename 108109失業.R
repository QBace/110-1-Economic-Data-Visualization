library(ggplot2)

df <- data.frame(name = c( '109男高中\n18.5%', '109男大學\n19.1%','109其他\n29.3%', '109女大學\n22%', '109女高中\n11.1%','108男高中\n19.6%', '108男大學\n18.4%','108其他\n30.1%' , '108女大學\n21.1%','108女高中\n10.8%'),
                 
                 value = c(0.1848,0.1913,0.2935,0.2196,0.1109,0.1955,0.1843,0.3011,0.2112,0.1079),
                 level = c('2','2','2','2','2','1', '1', '1', '1', '1'))

ggplot(df, aes(x = level, y = value, fill = name, alpha = level)) +
  geom_col(width = 1, color = 'white', size = 0.25, position = position_stack()) +
  geom_text(aes(label = name), size = 2.5, position = position_stack(vjust = 0.55)) +
  coord_polar(theta = 'y') +
  scale_alpha_manual(values = c('0' = 0, '1' = 1, '2' = 0.7), guide = F) +
  scale_fill_manual(values = c("#BED3D4","#F02B4D","#FA6129","#0080F0","#0001E0","#E0F4F5","#FA8897","#F5A183","#86C2FA","#8283FA"),
                    names(NULL),
                    breaks = NULL
  )+
  scale_x_discrete(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  
  labs(x = NULL, y = NULL,title = "108 、109年按性別教育程度分類佔總體失業率比率") +
  theme_minimal()