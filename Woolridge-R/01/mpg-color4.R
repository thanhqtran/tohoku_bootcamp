ggplot(mpg, aes(displ, hwy, color=class, shape=class)) + 
  geom_point() +
  geom_smooth(se=FALSE) +
  scale_color_grey() +
  scale_shape_manual(values=1:7)