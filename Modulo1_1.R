## Código para el  módulo 1

prot_conc <- c(0.000, 0.016, 0.031, 0.063, 0.125, 0.250, 0.500, 1.000, 
               0.000, 0.016, 0.031, 0.063, 0.125, 0.250, 0.500, 1.000) 

abs <- c(0.329, 0.352, 0.349, 0.379, 0.417, 0.491, 0.668, 0.956, 
         0.327, 0.341, 0.355, 0.383, 0.417, 0.446, 0.655, 0.905)

plot(prot_conc, abs)
 
install.packages("ggplot2") # si queremos ejecutar una línea que está "comentada" hay que quitarle la marca de comentario, "#": 
# no queremos que esta linea se ejecute todo el tiempo. 
library(ggplot2)

# ggplot2 requiere que reformateemos los datos en forma de data.frame, lo hacemos de esta manera:
data <- as.data.frame(prot_conc)

# la función str() nos da información acerca de la estructura de los datos que están en el data.frame llamado data, que acabamos de crear.
str(data)

data$abs <- abs

View(data)

### hacer una g´rfica con ggplot2

## Paso 1: añade los datos y después la "estética" ('aesthetics', por eso la función se llama 'aes')
  
p <- ggplot(data=data,          # Especifica el nombre del dataframe que tiene los datos - en este caso el dataframe se llama data
            aes(x=prot_conc, y=abs)) # especifica que os valores de concentración de proteínas se graficaran en el eje x, y que los valores de absorbancia serán el eje y
p  # muestra la gráfica

## Paso 2: añade un tipo de gráfica**
p <- p + geom_point()

p # muestra la gráfica nuevamente

# muestra la gráfica pero no la modifica
p + stat_smooth(method = "lm", formula = y ~ x)

p # muestra la gráfica - sin línea...

# añade algunas etiquetas. 
p +  xlab("[Proteína] (microg/ml)") +   # etiqueta del eje de las x
  ylab("Absorbancia (570nm)") +      # etiqueta para el eje de las y
  ggtitle("Ensayo de proteína")          # añadir título

p <- p + stat_smooth(method = "lm", formula = y ~ x) +
         xlab("[Proteína] (microg/ml)") +   # etiqueta del eje x
         ylab("Absorbancia (570nm)") +      # etiqueta del eje y
         ggtitle("Ensayo de proteína")          # añadir título

p

# puedes guardar tus resultados con Export, o

# quítale el comentario a la línea siguiente para guardar la gráfica
ggsave("ProteinStandardCurve.pdf", plot0 = p)


