# Semana 8
# Eusebio Alberto Espinosa Sauceda 
# 1854858  
# 25 de septiembre de 2025

# Datos 
datos <- data.frame(trigo = c(30, 28, 32, 25, 25, 25, 22, 24, 35, 40), 
                    harina = c(25, 30, 27, 40, 42, 40, 50, 45, 30, 25))

# Sumatoria de xi*yi
sumxi_yi <- sum(datos$trigo*datos$harina)
30*25
28*30

nxy <- length(datos$trigo)*mean(datos$trigo)*mean(datos$harina)
sumxi_yi-nxy

# Sumatoria elevado al 2
xi2 <- sum(datos$trigo^2)
nx2 <- length(datos$trigo)*mean(datos$trigo)^2
nx2

# Beta 1
b1 <- (sumxi_yi - nxy)/(xi2-nx2)
b1

# Beta 0
bo <- mean(datos$harina) - b1*mean(datos$trigo)
bo

# Revision de datos residuales
fit.lm <- lm(datos$harina ~ datos$trigo)
summary(fit.lm)
fit.lm$model
fit.lm$coefficients
fit.lm$residuals
mean(fit.lm$residuals)

# Aplicacion de Anova
anova(fit.lm)

# Paquetes
library(lmtest)

#Datos
x <- c(datos$trigo)
y <- c(datos$harina)

# Modelo
m <- lm(y ~ x)

# Breusch-Pagan (varianza ~ x)
bptest (m)

# Raiz cuadrada de r ajustada
sqrt(0.6824)

# Datos de suma de cuadrados de los errores
datos$yprima <- 74.11 - 1.3536*datos$trigo
View(datos)

datos$recta <- fit.lm$fitted.values

datos$prima <- bo + b1 * datos$trigo

datos$residuales <- datos$harina-datos$recta

# Sumar los residuales
sum(datos$residuales^2)
SSE <- sum(datos$residuales^2)
SSE/8
sqrt(SSE/8) 
