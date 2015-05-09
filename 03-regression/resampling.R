library(ISLR)
library(boot)
attach(Auto)

set.seed(1)
plot(mpg ~ horsepower, data=Auto)

dim(Auto)
summary(Auto)

train = sample(dim(Auto)[1], dim(Auto)[1]/2)

# 1st grade
lm.fit = lm(mpg ~ horsepower, data=Auto, subset=train)
mseError = mean((mpg - predict(lm.fit, Auto))[-train]^2)
mseError

# 2nd grade
lm.fit2 = lm(mpg ~ poly(horsepower, 2), data=Auto, subset=train)
mseError2 = mean((mpg - predict(lm.fit2, Auto))[-train]^2)
mseError2

# Leave-one-out cross validation
glm.fit = glm(mpg ~ horsepower, data=Auto)

cv.err = cv.glm(Auto, glm.fit)
cv.err$delta


cv.error = rep(0,5)

for (i in 1:length(cv.error)) {
  glm.fit = glm(mpg ~ poly(horsepower, i), data=Auto)
  cv.error[i] = cv.glm(Auto, glm.fit)$delta[1]
}

plot(cv.error, type="b")


# k-fold cross validation
set.seed(17)
cv.error.kf = rep(0, 10)

for (i in 1:10) {
  glm.fit = glm(mpg ~ poly(horsepower, i), data=Auto)
  cv.error.kf[i] = cv.glm(Auto, glm.fit, K=10)$delta[1]
}

plot(cv.error.kf, type="b")


# Boostrap
plot(Portfolio)

alpha.fn = function(data, index) {
  X = data$X[index]
  Y = data$Y[index]
  return ((var(Y) - cov(X,Y)) / var(X)+var(Y)-2*cov(X,Y))
}

alpha.fn(Portfolio, 1:100)

boot(Portfolio, alpha.fn, R=1000)


boot.fn = function(data, index) {
  return(coef(lm(mpg ~ horsepower, data=data, subset=index)))
}

boot.fn(Auto, 1:dim(Auto)[1])

boot(Auto, boot.fn, 1000)

boot.fn = function(data, index) {
  return(coef(lm(mpg ~ horsepower + I(horsepower^2), data=data, subset=index)))
}
boot(Portfolio, alpha.fn, R=1000)
summary(lm(mpg ~ horsepower + I(horsepower^2), data=Auto))$coef
