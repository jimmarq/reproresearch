# The data is already clean.
# Put functions here to create factors, add computed columns, remove outliers,
# or do anything else that you need.
# It might be wise to create a new data frame that holds the clean data.
# This way, if you modify the cleaning process, you don't have to load the files
# from disk.

# Copy the raw data frame to one that we will manipulate.
animalData <- rawAnimalData

#rename the factor from "Block" to "Black"
levels(animalData$Color)[1] <- "Black"
