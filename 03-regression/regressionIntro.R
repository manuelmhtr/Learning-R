
libs = c("ISLR", "MASS");
x = sapply(libs, function(x) {
  if (!require(x, character.only = T)) {
    install.packages(x)
  }
});
rm(x, libs)

library(ISLR)
library(MASS)


fix(Boston)
head(Boston)
names(Boston)
?Boston
attach(Boston)

plot(Boston$medv ~ Boston$lstat)
pairs(Boston)

lm.fit = lm(Boston$medv ~ Boston$lstat, data=Boston)
lm.fit = lm(Boston$medv ~ Boston$lstat)

lm.fit
summary(lm.fit)

names(lm.fit)
coefficients(lm.fit)

lm.fit$residuals

confint(lm.fit)


predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="confidence")
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="prediction")

plot(lstat,medv,col="blue")
abline(lm.fit,lwd=3,col="red")

# To see residuals
plot(lm.fit)

lm.fit = lm(medv ~ lstat + age, data = Boston)

lm.fit = lm(medv ~ ., data = Boston)
summary(lm.fit)

# Age and indus do not contribute to the model
lm.fit = lm(medv ~ . -age -indus, data = Boston)
summary(lm.fit)
