
library(tidyverse)
data("diamonds")
ggplot(data=diamonds) + geom_bar(mapping= aes(x=cut))
diamonds %>% count(cut)
ggplot(data=diamonds) + geom_histogram(mapping= aes(x=carat), binwidth =0.5) #Los quilates est?n comprendidos entre 0 y 5,1. Binwidth son los quilates
max(diamonds$carat) 
ggplot(data=diamonds) + geom_histogram(mapping= aes(x=carat), binwidth =0.01) ## Se va estrechando el histograma
ggplot(data=diamonds) + geom_histogram(mapping= aes(x=carat), binwidth =1) 
diamonds %>% count(cut_width(carat, 0.5)) #Con la funci?n cut_width conseguimos categorizar la variable carat
smaller <- diamonds %>% filter(carat < 3) #Eliminamos aquellos diamantes con quilates superiores a 3 ya que no son representativos
ggplot(data= smaller) + geom_histogram(mapping= aes(x=carat), binwidth =0.1) #La distribuci?n est? mucho m?s detallada. La moda es el valor de la muestra que m?s se repite y est? m?s centralizad
ggplot(data=diamonds, mapping = aes(x=carat, color=cut)) + geom_freqpoly(binwidth=0.1)
ggplot(data=diamonds, mapping = aes(x=carat)) + geom_histogram(binwidth=0.01) # El patr?n es que hay l?neas a la derecha y no a la izquierda
ggplot(data=smaller, mapping = aes(x=carat)) + geom_histogram(binwidth=0.01)
unusual <- diamonds %>%
  filter(y< 3 | y > 20) %>%
  arrange(y)
unusual

#Practica 4 (diapositiva 13)
##Ejercicio 1
### La variable precio es una variable continua
ggplot(data=diamonds) + geom_histogram(mapping = aes(x=price), binwidth =0.5)
ggplot(data=diamonds) + geom_histogram(mapping = aes(x=price), binwidth =4) ##Podemos observar que existe una relaci?n negativa entre el precio de diamantes y n?mero de ellos, es decir, a mayor precio menor diamantes existen Adem?s, existe una concentraci?n muestral de diamantes para aquellos cuyo precio sea < a 5.000???. Para visualizarlo mejor, haremos un filter y la distribuci?n nos quedar?a m?s representativa
diamantesbaratos<- filter(diamonds,diamonds$price < 5000)
diamantesbaratos
ggplot(data=diamantesbaratos) + geom_histogram(mapping = aes(x=price), binwidth =4) #Una vez filtrado podemos ver que aquellos diamantes cuyo precio sea hasta un maximo de 1.500??? aproximadamente son aquellos en donde m?s cantidad existen de ellos


##Ejercicio 2

count(filter(diamonds, carat == 0.99)) ## Existen 23 diamantes con quilates de 0.99
count(filter(diamonds, carat == 1)) ## Existen 1558 diamantes con quilates de 1. Podemos observar que la diferencia de quilates es insignificativa pero que las joyerias podr?an tener incentivos a aumentar artificailmente los quilates puesto que se venden m?s los diamantes con quilates de 1.
mean(diamonds$price) # 3.932,8 es la media de los precios de los diamantes
median(diamonds$price) # 2401 es la mediana, es menos porque los pocos diamantes que valen mucho destrozan la representatividad de la media y eso hace desvirtuarla.

ggplot(data=diamonds, mapping=aes(x=cut, y=price)) + geom_boxplot() ## Los que son m?s caros tienen el corte ideal pero existen muchos outliers con los mejores diamantes
ggplot(data=diamonds) + geom_boxplot(mapping=aes(cut, price)) # Es lo mismo que lo anterior
##Ejercicio de la diapositiva  20
cor(diamonds$price, diamonds$carat) ##La correlaci?n es de 0.9215913, es la mayor correlacion que podemos encontrar, lo cual quiere decir que la variable que explica mejor el precio de los diamantes es la variable carat, es decir, los quilates. Viendolo de forma visual quedar?a de la siguiente forma:
ggplot(diamonds, aes(carat, price))+ geom_point()
cor (diamonds$x * diamonds$y *diamonds$z, diamonds$price) ## La correlaci?n es 0.902384 Viendolo de forma visual ser?a la siguiente
ggplot(diamonds, aes(price, x*y*z))+ geom_point() ##Se ajustan a una l?nea y eso significa que existe una relaci?n muy estrecha entre la combinaci?n de x,y y z y la variable precio
volumen<- diamonds %>% mutate(w=x*y*z)
ggplot(volumen, aes(w, price)) + geom_point() ##Esta es otra forma de representan la combinaci?n de x y y z
cor(diamonds$x, diamonds$price) ##Por separado la correlaci?n es de 0.8844. Haci?ndolo por separado la variable x es la que mejor explica la variable precio, ?nicamente si lo comparamos con las variables Y y Z
cor(diamonds$y, diamonds$price) ## La correlaci?n es de 0.8654
cor(diamonds$z, diamonds$price) ## La correlaci?n es de 0.86124
cor(diamonds$price, diamonds$cut) ##No podemos calcular la correlaci?n con cut puesto que ni es una variable categ?rica
ggplot(diamonds,aes(x=cut, y= carat)) + geom_boxplot() ## Existe una gran variabilidad en la distribuci?n de los tama?os de quilates dentro de cada categor?a de corte. Existe una ligera relaci?n negativa entre el quilate y el corte. Cabe destacar que los diamantes con quilates m?s grandes tienen un corte "Fair", siendo este el m?s bajo. Esta relaci?n negativa puede deberse a la forma en que se seleccionan los diamantes para la venta. Un diamante m?s grande se puede vender de forma m?s rentable con un corte de menor calidad, mientras que un diamante m?s peque?o requier eun mejor corte


