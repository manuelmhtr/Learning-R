library("plspm")

# Load data
data(spainfoot)

# Display data
head(spainfoot, n=6)
dim(spainfoot)
tail(spainfoot, n=6)
names(spainfoot)

# Basic plots
boxplot(spainfoot$GSH)
hist(spainfoot$GSH)
stem(spainfoot$GSH)

# Basic stats
summary(spainfoot)

# Build the model
Attack  = c(0, 0, 0)
Defense = c(0, 0, 0)
Success = c(1, 1, 0)

# Matrix created by row binding
foot_inner = rbind(Attack, Defense, Success)
foot_inner

colnames(foot_inner) = rownames(foot_inner)

# plot the inner matrix
innerplot(foot_inner)

# define list of indicators
foot_outer = list(1:4, 5:8, 9:12)

# Tell variables are reflexive
foot_modes = c("A", "A", "A")

# run plspm analysis
foot_pls = plspm(spainfoot, foot_inner, foot_outer, foot_modes)

# summarized results
summary(foot_pls)

# Show results
foot_pls$path_coefs
foot_pls$inner_model
foot_pls$inner_summary
plot(foot_pls)
plot(foot_pls, what="loadings")
plot(foot_pls, what="weights")

# Show best teams
head(foot_pls$scores)
# Show worst teams
tail(foot_pls$scores)

# GCA and GCH are inverse, more goals on defense are
# worst for success!!!
# We need to change the model...

# Matrix created by row binding
foot_inner2 = rbind(Attack, Defense, Success)
colnames(foot_inner2) = rownames(foot_inner2)

# Redefine list of indicators
foot_outer2 = list(1:4, 5:8, 9:12)

# Tell variables are reflexive
foot_modes2 = c("A", "A", "A")

# Change symbol
spainfoot2 = spainfoot
spainfoot2[5] = spainfoot2[5] * -1
spainfoot2[6] = spainfoot2[6] * -1
foot_pls2  = plspm(spainfoot2, foot_inner2, foot_outer2, foot_modes2)

# run plspm analysis
mask = c(1,1,1,1,-1,-1,1,1,1,1,1,1,1,1)
foot_pls2  = plspm(t(t(spainfoot)*mask), foot_inner2, foot_outer2, foot_modes2)

# summarized results
summary(foot_pls2)

# Show results
foot_pls2$path_coefs
foot_pls2$inner_model
foot_pls2$inner_summary
plot(foot_pls2)
plot(foot_pls2, what="loadings")
plot(foot_pls2, what="weights")

# Show best teams
head(foot_pls$scores)
# Show worst teams
tail(foot_pls$scores)
