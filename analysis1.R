library(ggplot2)

scatter <- ggplot(animalData, aes(Weight, Height)) + geom_point()
ggsave(scatter, filename="figures/scatter.pdf", width=6, height=4)

#Do other analysis here
