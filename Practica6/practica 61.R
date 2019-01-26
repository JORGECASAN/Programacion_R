marks <- rnorm(100,75,2)
notas<- rnorm(18,7.25,2.15)
notas
subir_nota<- function(notas, cuota) {
  return(notas+ cuota)
}
nota_revisada<- subir_nota (notas, 0.4)
nota_revisada
