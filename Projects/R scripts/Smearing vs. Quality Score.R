setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\PAN\\sequences")

data <- read.csv("Sample_Barcodes.csv") 

colnames(data)

#plotting PCR smear vs. QS
plot(data$Gel_Quality_Score_PCR, data$QS,
     type = "p",
     main = "PCR Gel Smearing vs. QS",
     xlab = "Smearing Score",
     ylab = "Quality Score")

#Correlation between PCR smear and QS 
cor.test(data$Gel_Quality_Score_PCR, data$QS, method = "spearman")

#plotting Cleaned smear vs QS 
plot(data$Gel_Quality_Score_Cleaned, data$QS,
     type = "p",
     main = "Cleaned Gel Smearing vs. QS",
     xlab = "Smearing Score",
     ylab = "Quality Score")

#Correlation between Cleaned smear and QS 
cor.test(data$Gel_Quality_Score_Cleaned, data$QS, method = "spearman")