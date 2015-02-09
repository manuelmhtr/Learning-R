# Basic exercises for learning R.
# Manuel de la Torre
# github.com/manuelmhtr

library("plspm")

# Ex 1.
my.vector <- c(8, 6, 9, 10, 5)
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

# 8

# 9
# 9.1


# Ejercicio 8. Comenta la diferencia entre los siguientes conceptos:


