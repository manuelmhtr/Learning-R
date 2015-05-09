# Manuel Honorio de la Torre
# Exam 1 (may 8th, 2015)

# 7. In Sections 5.3.2 and 5.3.3, we saw that the cv.glm() function can be
# used in order to compute the LOOCV test error estimate. Alternatively,
# one could compute those quantities using just the glm() and
# predict.glm() functions, and a for loop. You will now take this approach
# in order to compute the LOOCV error for a simple logistic
# regression model on the Weekly data set. Recall that in the context
# of classification problems, the LOOCV error is given in (5.4).

# Loading libraries and doing stuff
library(ISLR)
summary(Weekly)
set.seed(1)
attach(Weekly);

# a) Fit a logistic regression model that predicts Direction using Lag1
# and Lag2.
dataSet1 = Weekly;
glm.fit = glm(Direction ~ Lag1 + Lag2, data = dataSet1, family = binomial)
summary(glm.fit);


# b) Fit a logistic regression model that predicts Direction using Lag1
# and Lag2 using all but the first observation
dataSet2 = Weekly[-1,];
glm.fit = glm(Direction ~ Lag1 + Lag2, data = dataSet2, family = binomial)
summary(glm.fit);


# c) Use the model from (b) to predict the direction of the first observation.
# You can do this by predicting that the first observation
# will go up if P(Direction="Up"|Lag1, Lag2) > 0.5. Was this observation
# correctly classified?
prediction = predict.glm(glm.fit, Weekly[1,], type = "response")
if (prediction > 0.5) {
  print("Yes, it was correct")
} else {
  print("No, it was incorrect")
}


# d) Write a for loop from i = 1 to i = n, where n is the number of
# observations in the data set, that performs each of the following
# steps:
#   i. Fit a logistic regression model using all but the ith observation
#   to predict Direction using Lag1 and Lag2.
#   ii. Compute the posterior probability of the market moving up
#   for the ith observation.
#   iii. Use the posterior probability for the ith observation in order
#   to predict whether or not the market moves up.
#   iv. Determine whether or not an error was made in predicting
#   the direction for the ith observation. If an error was made,
#   then indicate this as a 1, and otherwise indicate it as a 0
count = rep(0, dim(Weekly)[1])
for (i in 1:(dim(Weekly)[1])) {
  glm.fit = glm(Direction ~ Lag1 + Lag2, data = Weekly[-i,], family = binomial)
  isUp = predict.glm(glm.fit, Weekly[i,], type="response") > 0.5
  actualUp = Weekly[i,]$Direction == "Up"
  if (isUp != actualUp)
    count[i] = 1
}
sum(count);
# 490.

# e) Take the average of the n numbers obtained in (d)iv in order to
# obtain the LOOCV estimate for the test error. Comment on the
# results.
mean(count);
# 44.99% test error.