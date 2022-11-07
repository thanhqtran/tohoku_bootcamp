ggplot(mpg, aes(displ, hwy, color=class, shape=class)) + 
  geom_point() +
  geom_smooth(se=FALSE) +
  scale_color_grey() +
  scale_shape_manual(values=1:7) +
  theme_light() +
  labs(title="Displacement vs. Mileage",
       subtitle="Model years 1988 - 2008",
       caption="Source: EPA through the ggplot2 package",
       x = "Displacement [liters]",
       y = "Miles/Gallon (Highway)",
       color="Car type",
       shape="Car type"
       ) +
  coord_cartesian(xlim=c(0,7), ylim=c(0,45))
  
ggsave("my_ggplot.png", width = 7, height = 5)