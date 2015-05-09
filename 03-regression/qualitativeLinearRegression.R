library(ISLR)
library(corrplot)

head(Smarket)
names(Smarket)
dim(Smarket)
summary(Smarket)

M <- cor(Smarket[,1:8])
corrplot.mixed(M, tl.pos="lt")

# par(mar=c(6, 4, 4, 2) + 0.1)
plot(Smarket$Volume)
plot(Smarket$Today, type="l")

plot(Smarket)
cor(Smarket[,1:8])

# Logistic regression
glm.fit = glm(Smarket$Direction ~ Smarket$Lag1+Smarket$Lag2+Smarket$Lag3+Smarket$Lag4+Smarket$Lag5+Smarket$Volume, data=Smarket, family=binomial)
# P-value should be lower than a significance leve (a=)
summary(glm.fit)
plot(glm.fit)

# Predict using this linear regression
glm.prob = predict(glm.fit, type="response")
glm.prob[1:10]
plot(glm.prob)
contrasts(Smarket$Direction)

# Divide sample into training data and test data.
glm.pred = rep("Down", dim(Smarket)[1]);
glm.pred[glm.prob > 0.5] = "Up"; 

table(glm.pred, Smarket$Direction)

# How accurate is the predicction?
mean(glm.pred == Smarket$Direction)

1 - mean(glm.pred == Smarket$Direction)

# Now using only data from 2005
# Train test
train = (Smarket$Year < 2005)
Smarket.2005 = Smarket[!train,]
dim(Smarket.2005)
head(Smarket.2005)

Direction.2005 = Smarket.2005$Direction[!train]

# Train again, using subset of train
glm.fit.2005 = glm(Smarket.2005$Direction ~ Smarket.2005$Lag1+Smarket.2005$Lag2+Smarket.2005$Lag3+Smarket.2005$Lag4+Smarket.2005$Lag5+Smarket.2005$Volume, data=Smarket.2005, family=binomial, subset=train)
glm.prob.2005 = predict(glm.fit.2005, Smarket.2005, type="response") #test

glm.pred.2005 = rep("Down", dim(Smarket.2005)[1]);
glm.pred.2005[glm.prob.2005 > 0.5] = "Up"

table(glm.pred.2005)


# Homework:
# Make a simple model using only Lag1 and Lag2
glm.fit.simp = glm(Smarket.2005$Direction ~ Smarket.2005$Lag1+Smarket.2005$Lag2, data=Smarket.2005, family=binomial, subset=train)
glm.prob.simp = predict(glm.fit.simp, Smarket.2005, type="response") #test

glm.pred.simp = rep("Down", dim(Smarket.2005)[1]);
glm.pred.simp[glm.prob.simp > 0.5] = "Up"

table(glm.pred.simp)
