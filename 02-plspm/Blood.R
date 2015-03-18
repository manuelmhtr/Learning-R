library("MVA")
demo("Ch-PCA")


# Load data
blood_corr # Correlation
blood_cov  # Covariance
blood_sd   # Standard deviation


blood_pcacov = princomp(covmat = blood_cov)
summary(blood_pcacov, loadings = TRUE)

