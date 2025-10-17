# Script 4
# 28/08/2025
# Alberto Espinosa Sauceda

# Importar ----------------------------------------------------------------

Calidad_plantula <- read.csv("Calidad-plantula.csv", header = T)
View(Calidad_plantula)

# Creación de factor ------------------------------------------------------

Calidad_plantula$Tratamiento <- as.factor(Calidad_plantula$Tratamiento)
class(Calidad_plantula$Tratamiento)
summary(Calidad_plantula)

# Media de IE -------------------------------------------------------------
mean(Calidad_plantula$IE)

# Calculo de media, desviación estándar y varianza ------------------------

tapply(Calidad_plantula$IE, Calidad_plantula$Tratamiento, mean)
tapply(Calidad_plantula$IE, Calidad_plantula$Tratamiento, sd)
tapply(Calidad_plantula$IE, Calidad_plantula$Tratamiento, var)

# Crear objeto colores ----------------------------------------------------
colores <- c("salmon3", "skyblue3")

# Boxplot con índice de esbeltez y tratamiento ----------------------------
boxplot(Calidad_plantula$IE~ Calidad_plantula$Tratamiento)

# Boxplot de datos de vivero (IE-Tratamiento) -----------------------------
boxplot(Calidad_plantula$IE~ Calidad_plantula$Tratamiento, 
        col =colores, main = "Calidad de la plantula", xlab = "Tratamiento", 
        ylab = "Índice de esbeltez", ylim = c(0.4,1.2) )

# Aplicar un subconjunto para cada tratamiento ----------------------------

df_Ctrl <- subset(Calidad_plantula$IE, Calidad_plantula$Tratamiento == "Ctrl")
df_Ctrl <- subset(Calidad_plantula, Tratamiento == "Ctrl")
df_Fert <- subset(Calidad_plantula, Tratamiento == "Fert")

# Graficos de normalidad --------------------------------------------------

par(mfrow=c(1,2)) # Ver graficos juntos
qqnorm(df_Ctrl$IE); qqline(df_Ctrl$IE)
qqnorm(df_Fert$IE); qqline(df_Fert$IE)
par(mfrow=c(1,1)) # Volver a ver un solo grafico

# Prueba de normalidad ----------------------------------------------------
shapiro.test(df_Ctrl$IE)
shapiro.test(df_Fert$IE)

# Revisar Homogeneidad (Varianza) -----------------------------------------
var.test(Calidad_plantula$IE ~ Calidad_plantula$Tratamiento)

# Prueba de t -------------------------------------------------------------
t.test(Calidad_plantula$IE ~ Calidad_plantula$Tratamiento,
       alternative = "two.sided", var.equal = T) # Prueba con dos colas

t.test(Calidad_plantula$IE ~ Calidad_plantula$Tratamiento,
       alternative = "two.sided", var.equal = F) # Prueba de Welch

t.test(Calidad_plantula$IE ~ Calidad_plantula$Tratamiento,
       alternative = "greater", var.equal = T) # Prueba con greater

# Crear funcion para medir efecto de cohens --------------------------------
cohens_efecto <- function(x, y) {
  n1 <- length(x); n2 <- length(y)
  s1 <- sd(x); s2 <- sd(y) 
  sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2)) 
  (mean(x) - mean(y)) / sp
  }

# Efecto ------------------------------------------------------------------
d1_cal <- cohens_efecto(df_Ctrl$IE, df_Fert$IE)  
d1_cal   
round(d1_cal,2) # Redondear resultado
