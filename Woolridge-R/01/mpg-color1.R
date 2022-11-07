ggplot(mpg, aes(displ, hwy)) + 
  geom_point(color=gray(0.5)) +
  geom_smooth(color="black")