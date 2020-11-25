#ECONOMETRIC ANALYSIS OF EFFECT OF FACEBOOK AD SPENDING ON POLITICAL POLLING PERCENTAGES

##### READING THE DATA #####
data <- read.csv("C:/Users/mason/OneDrive/Desktop/UCF/Econometrics_2/FB_data.csv")
Poll <- data$Avg_Poll
Spending <- data$Spending


##### DISTRIBUTIONS OF CONTINUOUS VARIABLES #####

hist(Poll, main = "Histogram of Polling Data (Dependent Variable)",freq = FALSE, xlab = "Average State Polling Percentages", breaks = 100, col = "blue")

hist(Spending/1000, main = "Histogram of Political Facebook Ad Spending per Campaign (by State)", xlab = "Dollars Spent on Campaign Ads by State (In Thousands)", breaks = 100, col = "brown")

##### EXPLORATORY ANALYSIS: PLOTTING THE DATA #####

#Plotting polling percentages against dollars spent on facebook ads
plot(Spending/1000, Poll, pch = 16, main = "Scatter Plot of Polling Vs. Spending", xlab = "Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#Plotting polling percentages against log of dollars spent on facebook ads
plot(log(Spending), Poll, pch = 16, main = "Scatter Plot of Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#Plotting log polling percentages against log of dollars spent on facebook ads
plot(log(Spending), log(Poll), pch = 16, main = "Scatter Plot of Log Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Log Average State Polling Percentages")

#Plotting all dependent variables against polling percentages
par(mfrow=c(1,1))
cand_col <- c("green", "red", "gold", "blue", "brown", "purple")
plot(data$Age, Poll, pch = 16, main = "Polling Vs. Age", xlab = "Age", ylab = "Average State Polling Percentages")
plot(Avg_Poll ~ Candidate, main = "Polling vs. Candidates", ylab = "Average State Polling Percentages", xlab = "Candidates", data = data, col = cand_col)
boxplot(Avg_Poll ~ Gender, main = "Polling vs. Gender", ylab = "Average State Polling Percentages", xlab = "Gender (0 is Female, 1 is Male)", data = data, col = c("pink", "blue"))
boxplot(Avg_Poll ~ Freshman, main = "Polling vs. Freshman", ylab = "Average State Polling Percentages", xlab = "Freshman Indicator", data = data, col = c("gold", "blue"))
plot(Spending/1000, Poll, pch = 16, main = "Scatter Plot of Polling Vs. Spending", xlab = "Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#Plotting candidates against polling percentages
plot(Poll ~ log(Spending), col = cand_col[data$Candidate], pch = 16, main = "Scatter Plot of Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")
legend("topright", pch = 16, col = cand_col, legend = levels(data$Candidate))
total_est <- glm(Poll ~ log(Spending))
abline(total_est, col = "black", lwd = 4)

#Plotting candidate-specific spending data

#Biden
Biden_data <- data[data$Biden == 1,]
plot(log(Biden_data$Spending), Biden_data$Avg_Poll, pch = 16, main = "Scatter Plot of Joe Biden's Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#Bernie
Bernie_data <- data[data$Sanders == 1,]
plot(log(Bernie_data$Spending), Bernie_data$Avg_Poll, pch = 16, main = "Scatter Plot of Bernie Sanders Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#Biden and Bernie
Biden_Bernie <- data[data$Biden == 1 | data$Sanders == 1,]
plot(log(Biden_Bernie$Spending), Biden_Bernie$Avg_Poll, pch = 16, main = "Scatter Plot of Joe Biden and Bernie Sanders Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#Warren
Warren_data <- data[data$Warren == 1,]
plot(log(Warren_data$Spending), Warren_data$Avg_Poll, pch = 16, main = "Scatter Plot of Elizabeth Warren Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages", ylim = c(0, 25))

#Bloomberg
Bloomberg_data <- data[data$Bloomberg == 1,]
plot(log(Bloomberg_data$Spending), Bloomberg_data$Avg_Poll, pch = 16, main = "Scatter Plot of Mike Bloomberg Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#Warren and Bloomberg
Warren_Bloomberg <- data[data$Warren == 1 | data$Bloomberg == 1,]
plot(log(Warren_Bloomberg$Spending), Warren_Bloomberg$Avg_Poll, pch = 16, main = "Scatter Plot of Elizabeth Warren and Mike Bloomberg Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages", ylim = c(0, 25))

#Buttigieg
Buttigieg_data <- data[data$Buttigieg == 1,]
plot(log(Buttigieg_data$Spending), Buttigieg_data$Avg_Poll, pch = 16, main = "Scatter Plot of Pete Buttigieg Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#Klobuchar
Klobuchar_data <- data[data$Klobuchar == 1,]
plot(log(Klobuchar_data$Spending), Klobuchar_data$Avg_Poll, pch = 16, main = "Scatter Plot of Amy Klobuchar Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")

#All Freshman
Freshman_data <- data[data$Freshman == 1,]
plot(log(Freshman_data$Spending), Freshman_data$Avg_Poll, pch = 16, main = "Scatter Plot of Freshman Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages", ylim = c(0, 25))

#Plotting log(Spending) against polling percentages and separating freshman/non-freshman
fresh_col <- c("green", "red")
plot(Poll ~ log(Spending), col = fresh_col[data$Freshman_cat], pch = 16, main = "Scatter Plot of Polling Vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State (In Thousands)", ylab = "Average State Polling Percentages")
legend("topright", pch = 16, col = fresh_col, legend = levels(data$Freshman_cat))
freshman_est <- glm(Freshman_data$Avg_Poll ~ log(Freshman_data$Spending))
non_freshman_est <- glm(Biden_Bernie$Avg_Poll ~ log(Biden_Bernie$Spending))
abline(freshman_est, col = "green", lwd = 4)
abline(non_freshman_est, col = "red", lwd = 4)
abline(total_est, col = "black", lwd = 4)

##### EXPLORATORY ANALYSIS: TESTING DIFFERENT MODELS #####

#Single regressor - Spending
reg1 <- glm(Poll ~ Spending)
summary(reg1)

#Non-freshman single regressor
reg2 <- glm(Biden_Bernie$Avg_Poll ~ Biden_Bernie$Spending)
summary(reg2)

#Freshman single regressor
reg3 <- glm(Freshman_data$Avg_Poll ~ Freshman_data$Spending)
summary(reg3)

#Single regressor - log(Spending)
reg4 <- glm(Poll ~ log(Spending))
summary(reg4)

#Non-freshman single regressor - log(Spending)
reg5 <- glm(Biden_Bernie$Avg_Poll ~ log(Biden_Bernie$Spending))
summary(reg5)

#Freshman single regressor - log(Spending)
reg6 <- glm(Freshman_data$Avg_Poll ~ log(Freshman_data$Spending))
summary(reg6)

#Log(Spending) and Candidates
reg7 <- glm(Poll ~ log(Spending) + data$Candidate)
summary(reg7)

#Log(Spending) and Freshman dummy
reg8 <- glm(Poll ~ log(Spending) + data$Freshman)
summary(reg8)

#Log(Spending), Freshman dummy, and Log(Spending)*Freshman interaction
reg9 <- glm(Poll ~ log(Spending) * data$Freshman)
summary(reg9)

#Log(Spending), Freshman dummy, Log(spending)*Freshman interaction, and candidate dummy
reg10 <- glm(Poll ~ log(Spending) * data$Freshman + data$Candidate)
summary(reg10)

#Log(Spending), Freshman dummy, Log(Spending)*Freshman interaction, Age, Gender dummy
reg11 <- glm(Poll ~ log(Spending)*data$Freshman + data$Age + data$Gender)
summary(reg11)

#Log(Spending), Freshman dummy, Age, gender dummy
reg12 <- glm(Poll ~ log(Spending) + data$Freshman + data$Age + data$Gender)
summary(reg12)

#Log(Spending), Freshman dummy, Age
reg13 <- glm(Poll ~ log(Spending) + data$Freshman + data$Age)
summary(reg13)

#Log(Spending), Freshman dummy, Log(Spending)*Freshman interaction, Age
reg14 <- glm(Poll ~ log(Spending) * data$Freshman + data$Age)
summary(reg14)

#Creating a lone Log(Spending)*Freshman interaction variable
Log_Spending_Freshman <- log(data$Spending) * data$Freshman

#Log(Spending)*Freshman interaction, Age, Freshman dummy
reg15 <- glm(Poll ~ Log_Spending_Freshman + data$Age + data$Freshman)
summary(reg15)

##### RESIDUALS #####

#Plotting Residuals against fitted values and dependent variables
par(mfrow=c(2,2))
plot(reg15$fitted.values, rstandard(reg15), pch = 16, main = "Standardized Residuals vs. Fitted Values", xlab = "Fitted Values", ylab = "Standardized Residuals")
abline(glm(rstandard(reg15) ~ reg15$fitted.values), lwd = 4)
plot(log(Spending), rstandard(reg15), pch = 16, main = "Standardized Residuals vs. Log Spending", xlab = "Log Dollars Spent on Campaign Ads by State", ylab = "Standardized Residuals")
abline(glm(rstandard(reg15) ~ log(Spending)), lwd=4)
plot(data$Age, rstandard(reg15), pch = 16, main = "Standardized Residuals vs. Age", xlab = "Age", ylab = "Standardized Residuals")
abline(glm(rstandard(reg15) ~ data$Age), lwd=4)
boxplot(rstandard(reg15) ~ Freshman, main = "Standardized Residuals vs. Freshman", ylab = "Standardized Residuals", xlab = "Freshman Indicator", data = data, col = c("gold", "blue"))
abline(glm(rstandard(reg15) ~ data$Freshman), lwd=4)

#Checking distribution of residuals
hist(rstandard(reg15), main = "Histogram of Standardized Residuals", xlab = "Standardized Residuals", breaks = 100, col = "red")
qqnorm(rstandard(reg15), pch = 16, ylab = "Standardized Residuals", main = "Q-Q Plot")
qqline(rstandard(reg15))

##### TESTING UNDER ASSUMPTION OF HETEROSKEDASTICITY #####


library(sandwich)
library(lmtest)

coeftest(reg15, vcov = vcovHC(reg15, "HC1"))
