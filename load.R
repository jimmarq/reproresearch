rawAnimalData <- read.table("data/animals.csv")

#These commands were originally used to create the data
#Animal <- c(rep(0, 42), rep(1, 48))
#Color <- c(rep(0, 15), rep(1, 20), rep(2, 30), rep(3, 25))
#Animal <- factor(Animal, labels = c("Dog", "Cat"))
#Color <- factor(Color, labels = c("Block", "Brown", "Yellow", "Gray"))
#animalData <- data.frame(Animal, Color)
#animalData$Height <- rnorm(90, 15, 10)
#animalData$Weight <- rnorm(90, 18, 8)
#write.table(animalData, file="data/animals.csv")