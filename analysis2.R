library(xtable)

# Output counts of the categorical data
xout <- xtable(table(catsData$Animal, catsData$Color),
               caption="Pets and Color.\\label{tab:petColor}")
align(xout) <- "|l|l|l|l|l|"
print(xout, file="tex/petColor.tex")

