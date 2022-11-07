ggplot(mpg, aes(displ, hwy)) + 
  geom_point( aes(color=class) ) +
  geom_smooth(color="black") +
  scale_color_grey()