# Basic exercises for learning R.
# Manuel de la Torre
# github.com/manuelmhtr

library("plspm")
library("DAAG")

# Ex 1.
my.vector <- c(8, 6, 9, 10, 5)
my.vector
# 1.1 
my.vector[1]
# 1.2
my.vector[length(my.vector)]
# 1.3
my.vector[seq(2,4)]
# 1.4
normalize(my.vector)
# 1.5
my.vector <- my.vector + my.vector
# 1.6
my.vector <- my.vector * my.vector
# 1.7
summary(my.vector)
# 1.8
my.vector <- c(my.vector, -1)

# Ex 2.
# 2.1
seq(1, 1, length.out=20)
# 2.2
rnorm(100,0,1)
# 2.3
seq(1, 20)

# Lists example
my.list <- list(name="Fred", wife="Mary", my.vector)
my.list$name
my.list$wife
my.list[[1]] == my.list$name

# Data frames example
Year <- c(1800,1850,1900,1950,2000)
Carbon <- c(8,54,534,1630,6611)
plot(Year, Carbon)
plot(Year, Carbon, main  = "Fossil Fuel Emissions")
plot(Year, Carbon, main  = "Fossil Fuel Emissions",type ="b")
plot(Year, Carbon, main  = "Fossil Fuel Emissions",type ="b")
fossil.fuel<-data.frame(time=Year, emission=Carbon)
fossil.fuel
fossil.fuel$time
fossil.fuel$emission
fossil.fuel[1]
fossil.fuel[1,1]
fossil.fuel[[1]]

# Ex 3.
# 3.1
help(mean)
help(median)
# 3.2
??test
# 3.3
info <- c(23, 180, 3314104868)
# 3.4
ldent<-matrix(nrow=3, ncol=3)
# 3.5
# save...

# Ex 4.
# 4.1
abs(2^3-3^2)
# 4.2
exp(1)^exp(1)
# 4.3
(2.3)^8+log(7.5)-cos(pi/sqrt(2))
# 4.4
A = matrix(c(1, 2, 4, 2, 1, 7, 3, 6, 2, 2, 4, 5), 3, 4)
B = matrix(c(1, 0, 2, 1, 3, 1, 4, 5, 5, 3, 7, 1, 2, 4, 3, 2), 4, 4)
A %*% solve(B)
B %*% t(A)

# Ex 5.

# Ex 6.
# 6.1
summary(stack.loss)
fivenum(stack.loss)
# 6.2
hist(stack.loss)
boxplot(stack.loss)
qqnorm(stack.loss)

# Ex 7.
lastNames <- read.table("~/Projects/Learning-R/01-intro/lastNames.txt", quote="\"")
# 7.1
barplot(table(lastNames[[1]]))
barplot(table(lastNames[[1]])/nrow(lastNames))
barplot(table(lastNames[[1]])*100/nrow(lastNames))
# 7.2
barplot(table(lastNames[[1]]))
# 7.3
pie(table(lastNames[[1]]))
# 7.4
# Johnson y Smith

# Ex 8.
# 8.1
# Las estad??sticas (como n??meros) son los datos asociados o medidos de un proceso.
# Mientras que La Estad??stica (como ciencia) es el estudio de estos datos.
# 8.2
# La estad??stica descriptiva analiza todos los datos disponibles.
# La estad??stica inferencial analiza pocos datos para obtener conclusiones de una
# poblaci??n m??s grande.
# 8.3
# Datos cualitativos son los que representan propiedades no medibles y los 
# cuantitativos son los que pueden ser medidos en una magnitud num??rica.

# Ex 9.
# 9.1
rbinom(20, 15, 0.2)
# 9.2
qgamma(0.20, 2, 10)
# 9.3
rt(2,df=8)
# 9.4
x <- seq(0, 5, 1)
plot(x, ppois(x, 4))
# 9.5
sample <- c(rnorm(100,mean=50,sd=4))
plot(ecdf(sample))
# 9.6
x<-c("cara","cruz")
sample(x,25,replace=T,prob=NULL)
sample(x,250,replace=T,prob=NULL)
sample(x,2500,replace=T,prob=NULL)
# 9.7
# Flor imperial
4/choose(52,5)
# Flor
36/choose(52,5)
# Poker
choose(13,1)*choose(4,4)*choose(48,1)
624/choose(52,5)
# Tercia y par
(choose(13,1)*choose(4,3)*choose(12,1)*choose(4,2)/choose(52,5))
# Color
(choose(13,5)*choose(4,1)-40)/choose(52,5)
# Escalera
((choose(10,1)*choose(4,1)*choose(4,1)*choose(4,1)*choose(4,1)*choose(4,1))-40)/choose(52,5)
# Tercia
(choose(13,1)*choose(4,3)*choose(12,2)*choose(4,1)*choose(4,1))/choose(52,5)
# Dos pares
(choose(13,2)*choose(4,2)*choose(4,2)*choose(11,1)*choose(4,1))/choose(52,5)
# Par
(choose(13,1)*choose(4,2)*choose(12,3)*choose(4,1)*choose(4,1)*choose(4,1))/choose(52,5)
# Carta mayor (pachuca)
1-((choose(13,5)-10)*(choose(4,1)^5)-4)/choose(52,5)


# Ex 13.
data <- c(8480, 608, 10498, 3653, 1872, 1374, 14138, 7478, 5794, 4019)
# 13.1
boxplot(data)
# 13.2
mean(data)
# 13.3
sd(data)
# 13.4


