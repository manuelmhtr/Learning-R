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
# La estad??stica se divide en dos grandes ??reas:
#
# * Estad??stica descriptiva
# Se dedica a la descripci??n, visualizaci??n y resumen de datos originados a partir de los fen??menos de estudio. 
# Los datos pueden ser resumidos num??rica o gr??ficamente. Ejemplos b??sicos de par??metros estad??sticos son: la 
# media y la desviaci??n est??ndar. Algunos ejemplos gr??ficos son:histograma, pir??mide poblacional, gr??fico 
# circular, entre otros.
#
# * Estad??stica inferencial
# Se dedica a la generaci??n de los modelos, inferencias y predicciones asociadas a los fen??menos en cuesti??n 
# teniendo en cuenta la aleatoriedad de las observaciones. Se usa para modelar patrones en los datos y extraer 
# inferencias acerca de la poblaci??n bajo estudio. Estas inferencias pueden tomar la forma de respuestas a 
# preguntas s??/no (prueba de hip??tesis), estimaciones de unas caracter??sticas num??ricas (estimaci??n), pron??sticos 
# de futuras observaciones, descripciones de asociaci??n (correlaci??n) o modelamiento de relaciones entre variables 
# (an??lisis de regresi??n). Otras t??cnicas de modelamiento incluyenanova, series de tiempo y miner??a de datos.
# Ambas ramas (descriptiva e inferencial) comprenden la estad??stica aplicada. La estad??stica inferencial, por su 
# parte, se divide en estad??stica param??trica y estad??stica no param??trica.


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

# Ex 10.
# 10.1
horas = c(4.1,3.1,4.1,10.8,7.3,1.5,4.8,4.1,2.8,6.1,10.4,2.0,8.8,9.5,5.7,5.9,14.8,5.6,12.9,5.9)
horas = c(horas,3.4,5.4,4.3,12.1,4.7,5.7,4.2,3.3,5.7,3.9,1.6,3.9,7.1,0.7,3.7,6.1,4.1,10.3,4.0,3.1)
horas = c(horas,3.0,11.1,6.2,9.2,6.1,3.7,3.5,7.6,4.4,3.1)
hist(horas,breaks=seq(0,15,by=3),plot=FALSE)
HRSS <- hist(horas,breaks =seq(0,15,by=3), plot=FALSE)
HRSS
HRSS$counts
cumsum(HRSS$counts)
cumsum(HRSS$counts/50*100)
# 10.2
hist(horas)
# 10.3
# El uso de computadoras en casa es sobre todo entre las 3 y 6 horas de uso, y en la gr??fica 
# podemos observar que sigue una distribuci??n normal.


# Ex 11.
# 11.1
corredores <- c(49,33,40,37,56,44,46,57,55,32,50,52,43,64,40,46,24,30,37,43,31,43,50,36,61,27,44,35,31,43,52,43,66,31,50,72,26,59,21,47)
stem(corredores)
# 11.2
# Los cuarentea??eros
# 11.3
# Los corredores de 43 a??os.


# Ex 12.
# 12.1
obsX = c(-22,-33,2,29,-13,21,-13,-23,14,3,-37,34,9,-33,20,-3,-15,12,-20,-7)
obsY = c(22,49,8,-16,10,-28,27,35,-5,-3,48,-29,-18,31,-16,14,18,17,11,-22)
qqplot(obsX,obsY)
# 12.2
regresion <- lm(obsY ~ obsX)
regresion
summary(regresion)


# Ex 13.
data <- c(8480, 608, 10498, 3653, 1872, 1374, 14138, 7478, 5794, 4019)
# 13.1
boxplot(data)
# 13.2
mean(data)
# 13.3
sd(data)


# Ex 14.
# 14.1
xi <- c(4,6,11,3,16)
yi <- c(50,50,40,60,30)
qqplot(xi,yi)
# 14.2
cov(xi,yi)
# 14.3
cor(xi,yi)


# Ex 15.
# 15.1
PA <-2/5
PA
PB <-2/5
PB
# 15.2
PUB = 4/5
PUB


# Ex 16.
# 16.1
dado1<-c(rep(1,6),rep(2,6),rep(3,6),rep(4,6),rep(5,6),rep(6,6))
dado2<-c(rep(1:6,6))
cbind(dado1,dado2)
# 16.2
suma <- dado1+dado2
suma
6/36

# Ex 17.
x<-c("SJV", "SVJ", "JSV", "JVS", "VJS", "VSJ")
y<-c(3, 1, 1, 0, 0, 1)
z<-cbind(x,y)
z


# Ex 18.
pnorm(20,8,9,lower.tail=TRUE)-pnorm(-4,8,9,lower.tail=TRUE)


# Ex 19.
1/4


# Ex 20.
(choose(3,0)*choose(5,2))/choose(8,2)
(choose(3,1)*choose(5,1))/choose(8,2)
(choose(3,2)*choose(5,0))/choose(8,2)


# Ex 21.
fx <- function(x) (x^2)/3
fx
?integrate
integrate(fx,0,1)


# Ex 22.
dist<-c((choose(4,0)*choose(3,3))/choose(7,3), (choose(4,1)*choose(3,2))/choose(7,3), (choose(4,2)*choose(3,1))/choose(7,3), (choose(4,3)*choose(3,0))/choose(7,3))
dist
X <- c(0,1,2,3)
valoresp <- X*dist
valoresp
sum(valoresp)


# Ex 23.
dbinom(2,3,0.25)


# Ex 24.
dgeom(5,1/100)


# Ex 25.
1-dpois(15,10)


# Ex 26.
pnorm(834,800,40,lower.tail=TRUE)-pnorm(778,800,40,lower.tail=TRUE)


# Ex 27.
pnorm(3.01,3,0.005,lower.tail=TRUE)-pnorm(2.99,3,0.005,lower.tail=TRUE)


# Ex 28.
dbinom(2,5,0.2)+dbinom(3,5,0.2)+dbinom(4,5,0.2)+dbinom(5,5,0.2)


# Ex 29.
pgamma(1,shape=2,scale=0.2)

# Ex 30.

# Ex 31.
simple.t.test = function (xbar,s,conf.level,n) {
  alfa= 1-conf.level
  t=qt(1-alfa/2,n-1)
  SE= s/sqrt(n)
  xbar+ c(-t*SE,t*SE)
}
simple.t.test(780,40,.95,30)


# Ex 32.
ins <- function (xbar,sigma,conf.level,n) { 
  alfa<-1-conf.level
  Z<-qnorm(1-alfa/2)
  xbar+c(-Z*sigma*(1+1/n)^(1/2),Z*sigma*(1+1/n)^(1/2))
}
ins(96.2,.08,.99,30)


# Ex 33.
dif.z.test = function (x1,x2, sigma1, sigma2, conf.level, n1, n2) {
  alfa=1 -conf.level
  Z=qnorm(1-alfa/2)
  SE=sqrt(sigma1^2/n1+sigma2^2/n2)
  (x1-x2+c(-Z*SE,Z*SE))
}
dif.z.test(87.2,78.3,6.3,5.6,.95,50,50)


# Ex 34.
# 35.3
str(possum)
complete.cases(possum)
# 35.4
str(ais)
# 35.5
complete.cases(ais)
# 35.6
attach(Manitoba.lakes)
Manitoba.lakes
attach(Manitoba.lakes)
plot(log2(area),elevation,pch=16, ylim=c(170,280))
text(log2(area), elevation, labels=row.names(Manitoba.lakes), pos=4)
text(log2(area) ~ elevation, labels=area, pos=2)
title("Manitoba???s Largest Lakes")
detach(Manitoba.lakes)
plot(area,log(elevation), pch=16)


# Ex 35.
# 35.1
bwplot(age~site, data=sexf,xlab="Sites",main="Age for sites")
bwplot(age~sex, data=possum,xlab="age",main="Age for males&females")
# 35.2
with(sexf, stem(totlngth[sex=="f"]))
with(sexf, median(totlngth))
# 35.4
bwplot(rcc~sport,data=ais,xlab="Sport",main="red blood cell count, in")
bwplot(hg~sport,data=ais,xlab="Sport",main="hemaglobin concentration, in g per decaliter")
bwplot(hc~sport,data=ais,xlab="Sport",main="hematocrit, percent")
bwplot(wcc~sport,data=ais,xlab="Sport",main="White blood cell coun, in per liter")
bwplot(ferr~sport,data=ais,xlab="Sport",main="Plasma ferritinis, ng")
stripplot(rcc~sex, data=ais,xlab="Sex",main="Red blood cell count, in")
stripplot(hg~sex, data=ais,xlab="Sex",main="Hemaglobin concentration")
stripplot(hc~sex, data=ais,xlab="Sex",main="Hematocrit, percent")
stripplot(wcc~sex, data=ais,xlab="Sex",main="White blood cell count")
stripplot(ferr~sex, data=ais,xlab="Sex",main="Plasma ferritinis")
# 35.6
deathrate <- c(40.7, 36,27,30.5,27.6,83.5)
hosp <- c("Cliniques of Vienna (1834-63)\n(> 2000 cases pa)",
          "Enfans Trouves at Petersburg\n(1845-59, 1000-2000 cases pa)",
          "Pesth (500-1000 cases pa)",
          "Edinburgh (200-500 cases pa)",
          "Frankfort (100-200 cases pa)", "Lund (< 100 cases pa)")
hosp <- factor(hosp, levels=hosp[order(deathrate)])
dotplot(hosp~deathrate, xlim=c(0,95), xlab="Death rate per 1000 ",type=c("h","p"))
# 35.10
with(Animals, cor(brain,body))
with(Animals, cor(log(brain),log(body)))
with(Animals, cor(log(brain),log(body), method="spearman"))


# Ex 36.
# 36.3
split(sample(1:7,7,replace=FALSE),"Bloque1",7)
split(sample(1:7,7,replace=FALSE),"Bloque2",7)
split(sample(1:7,7,replace=FALSE),"Bloque3",7)
split(sample(1:7,7,replace=FALSE),"Bloque4",7)
# 36.4
av = c()
for (i in 1:25) {
  av[i]<-mean(rnorm(100))
}
av
sd(av)
av<-plot(av)
# 36.5
rnorm(sample(500,20), mean=100, sd=10)
# 36.7
x <- runif(10)
x<-runif(sample(500,20))
plot(x)
# 36.9
X<-rexp(100,0.2)
plot(density(X))
mean(X)

