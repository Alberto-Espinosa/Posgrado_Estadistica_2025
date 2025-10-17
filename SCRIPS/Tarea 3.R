# Eusebio Alberto Espinosa Sauceda
# Matricula: 1854858
# Fecha: 22 de septiembre de 2025

# Analisis de Datos  ------------------------------------------------------------------

# Datos de concentración de estroncio (mg/ml)
estroncio <- data.frame(
  Sitio = rep(c("Graysons_Pond", "Beaver_Lake", "Anglers_Cove",
                "Appletree_Lake", "Rock_River"), each = 6),
  Valor = c(
    28.2, 33.2, 36.4, 34.6, 29.1, 31.0,  # Grayson's Pond
    39.6, 40.8, 37.9, 37.1, 43.6, 42.4,  # Beaver Lake
    46.3, 42.1, 43.5, 48.8, 43.7, 40.1,  # Angler's Cove
    41.0, 44.1, 46.4, 40.2, 38.6, 36.3,  # Appletree Lake
    56.3, 54.1, 59.4, 62.7, 60.0, 57.3   # Rock River
  )
)

# Ver los registros
head(estroncio)

# Grafico de comparaciones por sitio --------------------------------------

library(ggplot2)

ggplot(estroncio, aes(x = Sitio, y = Valor, fill = Sitio)) +
  geom_violin(trim = FALSE, alpha = 0.6) +   # Forma del violín
  geom_boxplot(width = 0.1, color = "salmon", alpha = 0.8) + # Caja dentro
  labs(title = "Concentración de estroncio en cuerpos de agua",
       x = "Cuerpo de agua", 
       y = "Concentración (mg/ml)") +
  theme_minimal()



# Hipótesis  --------------------------------------------------------------

# H₀ (nula): No existen diferencias significativas en la concentración media de
# estroncio entre los cinco cuerpos de agua.

# H₁ (alternativa): Al menos un cuerpo de agua presenta una concentración 
# media significativamente diferente.


# Prueba de Anova ---------------------------------------------------------

# ANOVA de una vía
modelo <- aov(Valor ~ Sitio, data = estroncio)

# Tabla de ANOVA
summary(modelo)


# Prueba LSD  -----------------------------------------------------

# Extraer MSE y gl de la tabla ANOVA
anova_tab <- anova(modelo)
MSE <- anova_tab["Residuals", "Mean Sq"]
gl_error <- anova_tab["Residuals", "Df"]

# Número de réplicas por sitio
n <- 6

# Valor crítico t
t_crit <- qt(0.975, df = gl_error) # 0.975 porque es bilateral con alfa=0.05

# LSD
LSD <- t_crit * sqrt(2 * MSE / n)
LSD

# Comparación de medias 
medias <- aggregate(Valor ~ Sitio, data = estroncio, mean)
medias

# Comparación par a par
comb <- combn(medias$Valor, 2)
diferencias <- abs(comb[1,] - comb[2,])
diferencias

# Ver si superan el LSD
diferencias > LSD


# Prueba de Tukey HSD -----------------------------------------------------

tukey <- TukeyHSD(modelo)
tukey


# Interpretación y analisis de resultados  -------------------------------------------
#El análisis ANOVA mostró diferencias significativas en las concentraciones de 
#estroncio entre los cinco cuerpos de agua evaluados, lo que indica que al menos 
#uno de ellos tiene un comportamiento distinto.

#Rock River registró los niveles más altos (por encima de 54 mg/ml, llegando 
#hasta 62.7 mg/ml), mientras que Grayson’s Pond tuvo las concentraciones más 
#bajas (28–36 mg/ml). Las pruebas post-hoc (LSD y Tukey) confirmaron que ambos 
#se diferencian significativamente del resto.

#En contraste, Beaver Lake, Angler’s Cove y Appletree Lake presentaron valores 
#similares entre sí, sin diferencias estadísticas relevantes.

#La alta concentración en Rock River podría deberse a fuentes de contaminación 
#como actividades industriales o agrícolas, mientras que los bajos niveles en 
#Grayson’s Pond podrían reflejar un entorno menos alterado o condiciones 
#naturales que limitan la presencia de estroncio.

#Estos resultados permiten identificar zonas prioritarias para vigilancia 
#ambiental. En particular, Rock River debería ser objeto de estudios más 
#detallados para determinar el origen del estroncio y evaluar posibles impactos
#ecológicos y sanitarios. Esta información es clave para apoyar decisiones en 
#gestión de recursos hídricos y protección de ecosistemas acuáticos.



