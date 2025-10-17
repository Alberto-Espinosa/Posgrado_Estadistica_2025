# Tarea 1 -----------------------------------------------------------------
#  - Eusebio Alberto Espinosa Sauceda
#  - 1854858
#  - 01/Septiembre/2025


# Parte 1 R y Rstudio  ----------------------------------------------------


# Primer Contacto con R ---------------------------------------------------

# Gastos totales 
300+240+1527+400+1500+1833

# Objetos para almacenar uno o mas valores  -------------------------------
celular <- 300
celular 

# Objetos creados ---------------------------------------------------------
transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833
5800*5*2

# Funciones ---------------------------------------------------------------
abs(10)
abs(-4)
sqrt(9)
log(2)

# Comentarios en R --------------------------------------------------------

# Este es un comentario 

2*9 # Prueba de R como calculadora 

4+5 #Este es un comentario de prueba

# R distingue mayusculas y minisculas -------------------------------------
celular <- 300
Celular <--300
CELULAR <- 8000

celular+Celular
CELULAR-celular

# Obtener ayuda -----------------------------------------------------------
help(abs)
help(mean)
?mean
help.search("absolute")

# Autoevaluacion ----------------------------------------------------------

# Creación de objeto 
gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)

gastos

barplot(gastos)

sort(gastos)

# Creación de grafico (Barplot)
barplot(sort(gastos))
sort(gastos, decreasing = TRUE)        
barplot(sort(gastos, decreasing = TRUE))

gastos_ordenados <- sort(gastos, decreasing = TRUE)
barplot(gastos_ordenados)
?name

# Cración de grafico con titulo y leyenda. 
names(gastos_ordenados) <- c("Otros","Comestibles", "Alquiler", 
                             "Gimnasio", "Celular", "Transporte")
barplot(gastos_ordenados, main = "Gastos Mensuales", names.arg = 
          names(gastos_ordenados), col = "salmon1")
 


# Parte 2 Variables  -----------------------------------------------------

# Problema 1 --------------------------------------------------------------

# Identifique el tipo de variable (cualitativa o cuantitativa) para la lista de 
# preguntas de una encuesta aplicada a estudiantes universitarios en una clase
# de estadística:
  
  # Nombre de estudiante. 
  # - Cualitativa
  # Fecha de nacimiento (p. Ej., 21/10/1995). 
  # - Cuantitativa 
  # Edad (en años). 
  # - Cuantitativa 
  # Dirección de casa (por ejemplo, 1234 Ave. Alamo). 
  # - Cualitativa 
  # Número de teléfono (por ejemplo, 510-123-4567).
  # - Cualitativa 
  # Área principal de estudio. - 
  # - Cualitativa 
  # Grado de año universitario: primer año, segundo año, tercer año, último año.
  # - Cualitativa 
  # Puntaje en la prueba de mitad de período (basado en 100 puntos posibles).
  # - Cuantitativa 
  # Calificación general: A, B, C, D, F. 
  # - Cualitativa 
  # Tiempo (en minutos) para completar la prueba final de MCF 202.
  # - Cuantitativa 
  # Numero de hermanos.
  # - Cuantitativa 


# Problema 2 --------------------------------------------------------------

# Elija un objeto (cualquier objeto, por ejemplo, animales, plantas, países, 
# instituciones, etc.) y obtenga una lista de 14 variables: 7 cuantitativas
# y 7 categóricas.

# Crear un data frame con variables cuantitativas y categóricas para países
variables <- data.frame(Variables = c("Nombre comun","Tipo de planta",
                                      "Color de flor","Habitat",
                                      "Origen","Ciclo de vida",
                                      "Tipo de hoja","Altura", "Numero de hojas",
                                      "Diametro de flor","Tiempo de floracion",
                                      "Edad maxima","Cantidad de agua semanal",
                                      "Temperatura optima"), 
                        Tipo = c(rep("Cuantitativa", 7),rep("Cualitativa", 7)))
  
print(variables)

# Problema 3 --------------------------------------------------------------

# Considere una variable con valores numéricos que describen formas electrónicas 
# de expresar opiniones personales: 1 = Twitter; 2 = correo electrónico;
# 3 = mensaje de texto; 4 = Facebook; 5 = blog. ¿Es esta una variable 
# cuantitativa o cualitativa? Explique.

# Los números (1, 2, 3, etc.) solo codifican categorías (Twitter, correo, etc.), 
# no representan cantidades ni orden lógico. No tiene sentido hacer operaciones 
# matemáticas con ellos. Por eso, es cualitativa nominal.

# Problema 4 --------------------------------------------------------------

# Para cada pregunta de investigación, (1) identifique a los individuos de interés
# (el grupo o grupos que se están estudiando), (2) identifique la (s) variable (s) 
# (la característica sobre la que recopilaríamos datos) y (3) determine si cada 
# variable es categórico o cuantitativo.                                                                                                                                            
# 1. ¿Cuál es la cantidad promedio de horas que los estudiantes de universidades 
#    públicas trabajan cada semana?
# - Los estudiantes son los individuos de interes.
# - Variable: Horas trabajadas por semana. 
# - Tipo de variables: Cuantitativa.


# 2. ¿Qué proporción de todos los estudiantes universitarios de México están 
#    inscritos en una universidad pública?
# - Los individuos de interés son los Estudiantes universitarios de México. 
# - Variable: Tipo de universidad.
# - Tipo de variable: Cualitativa.


# 3. En los universidades públicas, ¿las estudiantes femeninas tienen un 
#    promedio de CENEVAL más alto que los estudiantes varones?
# - Los estudiantes son los individuos de interes.
# - Variable: Sexo y Puntaje de examen. 
# - Tipo de vairable: Sexo (Cualitativa) y Puntaje (Cuantitativa).


# 4. ¿Es más probable que los atletas universitarios reciban asesoramiento 
#    académico que los atletas no universitarios?
# - Individuos de interés son los Estudiantes 
# - Variable: Condición del atleta y Recepción de asesoramiento académico. 
# - Tipo de variable: Condición (Cualitativa) y Recepción (Cualitativa).


# 5. Si reuniéramos datos para responder a las preguntas de la investigación 
#    anterior, ¿qué datos podrían analizarse mediante un histograma?
#    ¿Cómo lo sabes?.
# - El histograma es utilizado para variables cuantitativas. 
# - Horas trabajadas semanalmente y puntaje de examen.
# - Esto se debe a que un histograma representa la distribución de frecuencias
#   de los datos númericos. 



       
