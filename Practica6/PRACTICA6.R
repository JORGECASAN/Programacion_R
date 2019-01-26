##PRÁCTICA 6
#1. Diseñar algortimos e implementar una función R para calcular:
#a. El factorial de un número dado
fact<- function(x){
  res<- 1
  for( i in (x:1)){
    res <- res *i
  }
 return(res) 
}

fact(3) 
fact(5) 

#b. El número de Fibonacci de un número dado. El tiempo que tarda en ejecutarse el resultado es exponencial. Este tipo de algoritmos se utilizan para decodificar.
fib<- function(n){
  if ((n==0) | (n==1))  res<-n
  else res<- fib (n-1) + fib(n-2)
  return (res)
}

fib(5) 
fib(15)
fib(20)
fib(25)

#Otra forma de verlo, es a través de un comando res,en forma de un vector, por ejemplo (1,1)

fib2<- function(n){
  res<- c(1,1)
  for (i in 3:n){ 
    res<- c(res, res[i-1]+ res[i-2])
}
  return(res[n])
}
fib2(5)
fib2(15)
fib2(20)
fib2(25)

# Esta es otra forma de calcularlo y es mucho más eficiente en el almacenamiento que las anteriores:

fib3<- function(n){
  f1<- 1
  f2<- 1
  aux<- f1+f2
  if (n>2){
    for (i in 2:n ){
      f1<- f2
      f2<- aux
      aux<- f1+f2
    }}
  return(f1) 
}

fib3(4)

#El tipo número 4 de la serie es la siguiente:

fib4<- function(n, f1,f2){
  if((n==0)| (n==1)) res <- f1
  else res<- fib4(n-1,f2, f1+f2)
  return(res)
}

fib4(10,1,1)

#c.El algoritmo de Euclides (mcd)
##vERSIÓN DOS NÚMEROS

euAlgor <- function(a, b){
  if (a == 0){
    b
  }
  else{
    euAlgor(as.integer(b%%a), a)
  }
}
euAlgor(89, 43)

#c.El algoritmo de Euclides (mcd)
## El algoritmo de Euclides es un método antiguo y eficiente para calcular el máximo común divisor
##para un vector de números enteros
euAlgorVector <- function(vector) {
  n <- length(vector)
  final <- vector[1]
  for(i in 2:n) {
    final <- euAlgor(final, vector[i])
  } 
  return(final)
}

x <- c(90, 135, 45, 89, 65, 654)
euAlgorVector(x)

#Ejercicio 2: 
##Encontrar las anteriores funciones en librerías de R
##Por ejemplo, factorial de un número, con funciones propias de R, es la siguiente:
factorial(4)
factorial(c(6,8,42))

#Nos istlalamos la librería numbers y la ejecutamos
library(numbers)
fibonacci(54)
fibonacci(54, TRUE)
#Para calcular el máximo común divisor de dos números enteros, sería de la siguiente forma:
GCD(8,43)
#El máximo común divisor para un vector sería de la siguiente forma:
mGCD(x)
