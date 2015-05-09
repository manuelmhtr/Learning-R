library(MASS)
library(ISLR)

train = (Smarket$Year < 2005)
Smarket.2005 = Smarket[!train,]

# Logistic regression
lda.fit = lda(Smarket$Direction ~ Smarket$Lag1+Smarket$Lag2, data=Smarket, subset=train)
# P-value should be lower than a significance leve (a=)
summary(lda.fit)
plot(lda.fit)

# Predict
lda.pred = predict(lda.fit, Smarket)

lda.class = lda.pred$class
table(lda.class, Smarket$Direction)

mean(lda.class==Smarket$Direction)




# Now with quadratic
# Logistic regression
qda.fit = qda(Smarket$Direction ~ Smarket$Lag1+Smarket$Lag2, data=Smarket, subset=train)
# P-value should be lower than a significance leve (a=)
summary(qda.fit)
plot(qda.fit)

# Predict
qda.pred = predict(qda.fit, Smarket)

qda.class = qda.pred$class
table(qda.class, Smarket$Direction)

mean(qda.class==Smarket$Direction)



