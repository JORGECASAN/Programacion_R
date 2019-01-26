library (nycflights13)
library(dplyr)


str(flights)
View(flights)
##EJERCICIOS DE LA DIAPOSITIVA 14
summary(flights$arr_delay)
filter(flights, arr_delay >= 120) ## Como el retraso es en minutos buscaremos todos aquellos vuelos cuyo retraso sea superior a los 120 minutos
filter(flights, dest== "IAH" | dest== "HOU") ## Los vuelos que volaron a Houston son aquellos cuya destinación fue IAH o Houston, por lo que tendremos que calcularlos todos ellos. Tambien podríamos haber escrito, para que quedase más elegante en R y de forma más compacta, lo siguiente: filter(flights, dest %in% c("IAH", "HOU"))
## Como nos preguntan por los vuelos operados por tres compañias aéreas tendremos que ver cuáles son, y para esto necesitamos ver todas las variables
filter(flights, carrier==  "AA" | carrier== "DL" | carrier == "UA") ## También lo podríamos haber calculado usando el siguiente comando, filter(flights, carrier %in% c("AA", "DL", "UA"))
flights %>% select(carrier)
unique(flights$carrier)


filter(flights, month== 7| month== 8| month==9) ##También podríamos haber calculado los vuelos veraniegos escribiendo el siguiente comando: filter(flights, month >= 7, month <=9). Este comando es preferible para datos numéricos. También nos hubiera servido utilizar el comando: filter(flights, month %in% c(7,8,9))
unique(flights$month)

filter(flights, arr_delay >120, dep_delay <= 0) ## Muestra todos aquellos vuelon que tuvieron un retraso en la llegada superior a 120 minutos junto con los vuelos que no salieron tarde

filter(flights,dep_delay >= 60, dep_delay-arr_delay > 30) ## Existe un retraso en la hora de salida de 60 minutos pero la hora de llegada se adelantó 30 minutos, por lo que de la diferencia entre el retraso de la salida con la llegada debe de ser superior a 30. En el caso de que el avión no hubiese llegado 30 minutos antes el dep_delay==arr_delay, pero no es el caso.

arrange(flights, desc(dep_time)) ## Como nos preguntan los vuelos con salida entre medianoche y las 6 de la mañana, nos hacemos la pregunta de si a medianoche son las 00 horas o 24 horas y vemos que nos lo pone 2400

filter(flights,dep_time== 2400 | dep_time<= 600) ##Tenemos que calcular todos los vuelos con salida entre estas horas, por lo que deberemos de englobar todos aquellos vuelos con salida entre esas horas. Alternativamente, también podríamos haber optado por usar el siguiente comando: filter(flights, dep_time %% 2400 <= 600)

##EJERCICIOS DE LA DIAPOSITIVA 17

arrange(flights, desc(dep_delay)) ##Observamos que la hora de salida del avión con más retraso era a las 9:00 horas, el total de minutos retrasados mostrados a traves de la columna dep_delay fue de un total de 1.301 minutos lo que vienen a ser como unas 21 horas y 41 minutos, de la compañia HA, con la hora programada de salida a las 9:00 horas el 9 de Enero.

arrange(flights, dep_delay) ## Similarmente a lo anterior, se observa que el avión que salió el primero fue de la compañia B6 el día 7 de Diciembre, con hora programada de salida a las 21:23 horas y que llegó a su destino 43 minutos antes.

head(arrange(flights, desc(arr_delay)),10) ##Te muestra los 10 vuelos con más retraso

head(arrange(flights, arr_delay), 10) ## Te muestra los 10 vuelos con menos retraso

arrange(flights,air_time) ## Este comando no es concluyente con la respuesta a la preguntá del vuelo más rápido. Sabemos que la velocidad es la distancia / tiempo, por lo que tendríamos que hacer el comando que figura más abajo.
arrange(flights, distance/air_time * 60) ## Lo hemos multiplicado por 60 para convertir los minutos del air_time en millas por hora.
arrange(flights, desc(air_time))
arrange(flights, air_time)

## EJERCICIOS DIAPOSITIVA 25
select(flights, dep_time, arr_time, dep_delay, arr_delay) ##Lo podemos poner con el nombre de las columnas
select (flights, "dep_time", "arr_time", "dep_delay", "arr_delay") ## Lo podemos poner con strings
select(flights, 4,5,6,9) ## Lo podemos poner por la posición que ocupan las variables en las columnas
select(flights, one_of(c("dep_time", "arr_time", "dep_delay", "arr_delay"))) ## Lo podemos poner en carácter vectorial
variables<- c("dep_time", "arr_time", "dep_delay", "arr_delay")
select(flights, one_of(variables)) ##Primero nos creamos la variable llamada "variables" y luego a través del comando one of nos muestra el resultado de la selección.
select(flights, starts_with("dep_"), starts_with("arr_")) ## Lo podemos mostrar por las variables que empiecen por dep_ y arr_
select(flights, contains("_time"), contains("arr_")) ## Lo podemos motrar por todas aquellas variables que contengan la palabra _time y arr_
flights_airtime <- mutate(flights,dep_time_min = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,arr_time_min = (arr_time %/% 100 * 60 + arr_time %% 100) %% 1440,air_time_diff = air_time - arr_time + dep_time)
filter(flights_airtime, air_time_diff != 0)
filter(flights_airtime, air_time_diff %% 60 == 0)
##EJERCICIOS DE LA TAREA 
#EJERCICIO 1:Seleccionar todas las variables que acaben en 'time' de la base de datos flights de nycflights13
head(select(flights, ends_with('time')))
#EJERCICIO 2: Renombrar la variable arr_delay con retraso_llegada de flights y almacenar en un nuevo objeto llamado Vuelos
vuelos<-mutate(flights, retraso_llegada=arr_delay)
##EJERCICIO 3: Ordenar Vuelos de menor a mayor distancia recorrida
ordenacion<-arrange(vuelos,distance)
ordenacion
head(ordenacion)
##EJERCICIO 4: Encontrar el origen y el destino del vuelo de mayor distancia recorrida y el de menor distancia recorrida
MayorDistancia<-head(arrange(vuelos, desc(distance)), 1)
MayorDistancia
MayorDistancia$distance
OrigenMayordistancia<-select(MayorDistancia, origin, dest)
OrigenMayordistancia
DistanciaMenor<-head(arrange(vuelos,distance),1)
DistanciaMenor
DistanciaMenor$distance
##EJERCICIO 5:Añadir a la base de datos Vuelos la velocidad media del vuelo como una variable calculada a partir del espacio y el tiempo, como se explica en la presentación de clase.
xvuelos<- mutate(flights, velocidad_media= distance/air_time)
head(xvuelos$velocidad_media)

##DATA TRANSFORMATION II
##Vamos a ver que haciéndolo con la opción A (con delay) o con la opción B (con delays), devuelven el mismo resultado, es decir, tenemos 96 observaciones de 4 variables
#Opción A

by_dest<- group_by(flights,dest)
delay<- summarize(by_dest,count=n(),
                  dist=mean(distance, na.rm=TRUE),
                  delay= mean(arr_delay, na.rm=TRUE)
)
delay<- filter(delay, count>20, dest!="HNL")

#Opción B

delays<- flights%>%
  group_by(dest) %>%
  summarize(
    count=n(),
    dist=mean(distance, na.rm=TRUE),
    delay=mean(arr_delay, na.rm=TRUE)
  )%>%
  filter(count>20, dest!= "HNL")

#Vamos a calcular el retraso medio diario de los vuelos no cancelados, la tabla siguiente nos muestra tal información

not_cancelled<- flights%>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled%>%
  group_by(year, month, day) %>%
  summarize(mean=mean(dep_delay))







