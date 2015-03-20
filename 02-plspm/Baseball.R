# Baseball teams
# Author: Manuel de la Torre

# Load libraries
library("plspm")
library("plsdepot")

# Load data
setwd("/Users/manuelmhtr/Projects/Learning-R/02-plspm");
list.files("./data")
statsRaw = read.csv("./data/BaseballTeams.csv")

# Filter useless data
stats = subset(statsRaw, select=-c(lgID, name, franchID, divID, park, teamIDBR, teamIDlahman45, teamIDretro))

# Sanitizing data
stats$DivWin =  ifelse(stats$DivWin == "Y", 1, 0);
stats$WCWin  =  ifelse(stats$WCWin  == "Y", 1, 0);
stats$LgWin  =  ifelse(stats$LgWin  == "Y", 1, 0);
stats$WSWin  =  ifelse(stats$WSWin  == "Y", 1, 0);
stats$Rank   = stats$Rank * -1;
stats$L      = stats$L    * -1;
stats$RA     = stats$RA   * -1;
stats$ERA    = stats$ERA  * -1;
stats$ER     = stats$ER   * -1;
stats$SO     = stats$SO   * -1;
stats$HRA    = stats$HRA  * -1;
stats = stats[2326:nrow(stats),]
head(stats)
tail(stats)

# Display data
head(stats, n=6)
dim(stats)
names(stats)

# Basic plots
# Text length
boxplot(stats$W)
hist(stats$W)


# CPA analysis
help(prcomp)
statsPca = prcomp(stats[c(3:40)], center = TRUE, scale. = TRUE) 
statsPca$rotation
statsPcaAbs = abs(statsPca$rotation)
statsPcaAbs
plot(statsPca, type = "l")
statsPcaAbs[order(-statsPcaAbs[,"PC1"]),1]
statsPcaAbs[order(-statsPcaAbs[,"PC2"]),2]
statsPcaAbs[order(-statsPcaAbs[,"PC3"]),3]
names(stats)

# Build the model
Attack  = c(0, 0, 0)
Defense = c(0, 0, 0)
Success = c(1, 1, 0)

Attack_cols  = c(12,14,17);#12,14,17,20,26
Defense_cols = c(24,28,25,26);#24,28,25
Success_cols = c(6,7,3);#6,7,3

# Matrix created by row binding
baseball_inner = rbind(Attack, Defense, Success)
baseball_inner

colnames(baseball_inner) = rownames(baseball_inner)

# plot the inner matrix
innerplot(baseball_inner)

# define list of indicators
baseball_outer = list(Attack_cols, Defense_cols, Success_cols)
baseball_outer

# Tell variables are reflexive
baseball_modes = c("A", "A", "A")

# run plspm analysis
baseball_pls = plspm(stats, baseball_inner, baseball_outer, baseball_modes)
baseball_pls$gof

# summarized results
summary(baseball_pls)

# Show results
baseball_pls$path_coefs
baseball_pls$inner_model
baseball_pls$inner_summary
plot(baseball_pls)
plot(baseball_pls, what="loadings")
plot(baseball_pls, what="weights")

# Validation
# Bootstraping: Add some noise to the original data to make sure that the model correctly
# describes data.
baseball_val = plspm(stats, baseball_inner, baseball_outer, baseball_modes, boot.val = TRUE, br = 500)

# Bootstraping results
baseball_val$boot
