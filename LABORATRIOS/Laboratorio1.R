300+240+1527+400+1500+1833
celular <- 300
celular
transporte <- 240
comestible <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833
5800*5*2

abs(10) 
abs(-4) 
sqrt(9) 
log(2) 

#Este es un comentario

2+9
4+5 #tambien se puede colocar un comentario

celular <- 300
Celular <- -300
CELULAR <- 8000

celular+Celular
CELULAR-celular

help(abs)
help(mean) 
?mean
?abs
help.search("absolute") 
??absolute

gastos <- c(celular, transporte, comestible, gimnasio, alquiler, otros) 

gastos

barplot(gastos) 
sort(gastos)
barplot(sort(gastos)) 

help(sort)
sort(gastos, decreasing = TRUE)
barplot(sort(gastos, decreasing = TRUE))

gastos_ordenados <- sort(gastos, decreasing = TRUE)        
barplot(gastos_ordenados)

gastos <- c(celular=300, transporte=240, comestible=1527, gimnasio=400, alquiler=1500, otros=1833) 
barplot(names(gastos ordenados)

names(gastos_ordenados) <- c("Otros","Comestibles", "Alquiler", "Gimnasio", "Celular", "Transporte" )
barplot(gastos_ordenados, main = "Gastos Mensuales", names.arg = names(gastos_ordenados), col = "green")

