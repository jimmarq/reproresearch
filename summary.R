# Final analysis would go here.
p <- 3.141
fileConn<-file("p.tex")
writeLines(as.character(p), fileConn)
close(fileConn)
