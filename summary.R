# Final analysis would go here.
p <- 3.141
fileConn<-file("tex/p.tex")
writeLines(as.character(p), fileConn)
close(fileConn)
