library(tidyverse)
library(nycflights13)

#tibble es un data frame mejorado para tidyverse

## Tipos de datos en Tibble

## * int -> n�meros enteros
## * dbl -> n�meros reales(double)
## * chr -> vector de caracteres o string
## * dttm -> date + time
## * lgl -> logical, contiene valores booleanos (T o F)
## * fctr -> factor, variables categ�ricas
## * date -> fecha (d�a, mes, a�o)

## Funciones de manejo de datos en tibbles de dplyr

## * filter() -> filtrar observaciones a partir de valores concretos
## * arrange() -> reordenar las filas
## * select() -> seleccionar variables por sus nombres
## * mutate() -> crea nuevas variables con funciones a partir de las existentes
## * summarise() -> colapsar varios valores para dar un resumen de los mismos 

## Las funciones anteriores pueden utilizarse en conjunto con la funci�n group_by
## group_by() -> opera la funci�n a la que acompa�a grupo a grupo
## 

## 1 - data frame
## 2 - operaciones que queremos hacer a las variables del dataframe
## 3 - resultado en un nuevo dataframe

### FILTER

## Ejemplos:
jan1 <- filter(flights, month == 1, day == 1)

may19 <- filter(flights, month == 5, day == 19)

#Si queremos mostrar en la consola el resultado agregamos () en la instrucci�n
(dec25 <- filter(flights, month == 12, day == 25))


#comparaciones en tidyverse

# >, >=, <, <=, ==, !=

#funcion near de comparacion en dplyr

#esto da true
near(sqrt(2)^2,2)
#otro ejemplo
near(1/49*49, 1)


#secci�n de �lgebra booleana


#aqu� se filtra para los vuelos de mayo y junio
filter(flights, month == 5 | month == 6)

#Sin embargo aqu� no est� filtrando nada
filter(flights, month == 5 | 6)

#ejemplo para un filtro de 2 o m�s meses
may_june <- filter(flights, month %in% c(5,6))

#Leyes de DeMorgan
#!(x & y) == (!x) | (!y)
#!(x | y) == (!x) & (!y)

#Un ejemplo con leyes de DeMorgan
filter(flights, !(arr_delay > 60 | dep_delay > 60))
#se expresa mejor en postivo
filter(flights, arr_delay <= 60, dep_delay <= 60)