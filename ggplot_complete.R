#Data Visualization 18 de abril de 2020
library(tidyverse)
#-- Attaching packages --------------------------------------- tidyverse 1.3.0 --
#  v ggplot2 3.3.0     v purrr   0.3.3
#v tibble  2.1.3     v dplyr   0.8.5
#v tidyr   1.0.2     v stringr 1.4.0
#v readr   1.3.1     v forcats 0.5.0

#Los coches con motor mas grande consumen mas combustible
#que los coches con menor tamanio
#la reslacion consumo / tamanio es lineal? Es no lineal? Es exponencial?
#Es positiva? Es negativa?

#ggplot2::mpg

view(mpg)
# displ: tamanio del motor en litros
# hgw: numero de millas recorridas por galon de combustible (3.7 litros)
# ?mpg o help(mpg)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# Plantilla para hacer una representacion grafica con ggplot
#ggplot(data = <DATA_FRAME>) +
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = cty, y = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv))

#--------------------------------------------------------------
# ejemplo de color
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#ejemplo de size
#Warning message:
#Using size for a discrete variable is not advised.
#(Conviene que sea una variable numerica)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# ejemplo de transparencia
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# ejemplo de forma de los puntos (solo 6 formas a la vez)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#Eleccion manual de esteticas
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "red")
#color = nombre del color en formato string
#size = tamano del punto en mm
#shape = forma del punto con numeros del 0 al 25
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), 
             shape = 23, size = 10, color = "red", 
             fill = "yellow")
  
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), 
             shape = 23, size = 10, color = "red", 
             fill = "yellow")

##FACETS
# facet_wrap(~<FORMULA_VARIABLE>) : la variable debe ser discreta
#Ejemplo:
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~class, nrow = 3)

# facet_grid(<FORMULA_VARIABLE1>~<FORMULA_VARIABLE2>)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~cyl)

#Similar al facet wrap
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~cyl)

###--------------tarea-----------------------------------------------------------
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~cty, nrow = 3)


ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y = hwy)) +
  facet_grid(.~cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y = hwy)) +
  facet_grid(drv~.)
###------------------------------------------------------------------------------

#Diferentes Geometrias
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

#Varias geometrias super puestas
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv, color = drv),
              show.legend = T)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

#Mapeo local en cada geometria
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "suv"), se = F)


#----------------Tarea
ggplot(data = mpg, mapping = aes(x=displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth( se = F)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv, shape = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = F)


ggplot(data = mpg, mapping = aes(x=displ, y = hwy, color = drv)) + 
  geom_point(shape = 18, size = 3)


#---------------Ejemplo con dataset de diamantes
#Geom_bar utiliza el algoritmo stat por default se calcula el count
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut))

#otra forma
ggplot(data = diamonds)+
  stat_count(mapping = aes(x=cut))


#Cambiando las transformaciones estadisticas en las geometrias
demo_diamonds <- tribble(
  ~cut,          ~freqs,
  "Fair",        1610,
  "Good",        4906,
  "Very Good",   12082,
  "Premium",     12791,
  "Ideal",       21551
)

#otra forma del geom bar, revisar que es identity
ggplot(data = demo_diamonds)+
  geom_bar(mapping = aes(x = cut, y = freqs),
           stat = "identity")

#Geom bar con proporciones
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))


#stat summary
ggplot(data = diamonds)+
  stat_summary( 
    mapping = aes(x=cut, y = depth)
  )

ggplot(data = diamonds)+
  stat_summary( 
    mapping = aes(x=cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )


#colores y formas de los graficos
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, color = cut))

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = cut))

#en este ejemplo solo muestra las claridades que hay
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = color))

#En este ejemplo se muestran las proporciones de la claridad con respecto a cada
#cut
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity))+
  geom_bar(position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity))+
  geom_bar(alpha = 0.2, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, color = clarity))+
  geom_bar(fill = NA, position = "identity")

##position fill se muestra las proporciones con respecto a la proporcion total
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity))+
  geom_bar(position = "fill")

##position dodge
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity))+
  geom_bar(position = "dodge")

#En el scatterplot normal se pierden algunos puntos por lo que con jitter
#nos permite ver el total de los puntos de la distribucion
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(position = "jitter")

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_jitter()

#sistemas de coordenadas
ggplot(data = mpg, mapping = aes(x = class, y = hwy))+
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy))+
  geom_boxplot()+
  coord_flip()

#coord_quickmap() -> configura el aspect ratio para mapas
library(maps)

usa <- map_data("usa")

ggplot(usa, aes(long, lat, group = group))+
  geom_polygon(fill = "blue", color = "white")+
  coord_quickmap()

#otro ejemplo con Italia

italy <- map_data("italy")

ggplot(italy, aes(long, lat, group = group))+
  geom_polygon(fill = "blue", color = "white")+
  coord_quickmap()

#coord_polar

ggplot(data = diamonds)+
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = F,
    width = 1
  )+
  theme(aspect.ratio = 1)+
  labs(x = NULL, y = NULL)+
  coord_polar()


# Plantilla para hacer una representacion grafica con ggplot
#Con mas opciones la gramatica queda de la siguiente forma
#ggplot(data = <DATA_FRAME>) +
#  <GEOM_FUNCTION>(
#                  mapping = aes(<MAPPINGS>),
#                  stat = <STAT>,
#                  position = <POSITION>
#                 )+
#  <COORDINATE_FUNCTION>()+
#  <FACET_FUNCTION>()
#

#plot basico
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = clarity))
#mismo plot pero con opcion count
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = clarity, y = ..count..))
#mismo plot pero ahora con prop
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = clarity, y = ..prop.., group = 1))
#Usando fill
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = clarity, y = ..count.., fill = clarity))
#usando coord polar
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = clarity, y = ..count.., fill = clarity))+
  coord_polar()
#utilizando facets
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = clarity, y = ..count.., fill = clarity))+
  coord_polar()+
  facet_wrap(~cut)
#usando opciones para labels
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = clarity, y = ..count.., fill = clarity))+
  coord_polar()+
  facet_wrap(~cut)+
  labs(x = NULL, y = NULL, title = "Ejemplo final de ggplot con JB",
       caption = "Dos variables cruzadas de diamonds",
       subtitle = "Aprender ggplot es divertido")


#---------------------------------------------------
#Tarea final de ggplot
ggplot(data = mpg, mapping = aes(x = cty, y = hwy, color = class )) + 
  geom_point()+
  facet_wrap(~class)

ggplot(data = mpg, mapping = aes(x = cty, y = hwy )) + 
  geom_point() + 
  geom_abline() + 
  coord_fixed()
  
