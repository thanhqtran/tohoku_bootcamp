ggplot(mpg, aes(displ, hwy)) + 
  geom_point( aes(color=class, shape=class) ) +
  geom_smooth(color="black") +
  scale_color_grey() +
  scale_shape_manual(values=1:7)