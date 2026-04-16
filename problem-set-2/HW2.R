# Exercise 1
layoff <- read.csv2("./layoff.csv")[,-1]
layoff$status <- as.factor(layoff$status)
levels(layoff$status) <- c("new job", "unemployed")
table (layoff$status)

layoff$length <- as.factor(layoff$length)
levels(layoff$length) <- c("<1M", "1-3M", "3-12M", "1-2Y", "2-5Y", ">5Y")
table (layoff$length)

summary(layoff)
str(layoff)
?table
table(layoff$length, layoff$status)

employmenttab <- table(layoff$length, layoff$status)
employmenttab
prop.table(employmenttab, 1)
barplot(t(employmenttab),
        beside = TRUE,
        legend = TRUE,
        xlab = "Length of Employment",
        ylab = "Count",
        main = "Employment Status by Length of Employment")

barplot(t(prop.table(employmenttab, 1)),
        beside = FALSE,
        legend = TRUE,
        xlab = "Length of Employment",
        ylab = "Proportion",
        main = "Proportion of Employment Status by Length of Employment")


chisq.test(employmenttab, correct=FALSE)


# Exercise 2
library(vcd)
vienna <- read.table("./vienna.txt", header = TRUE)
vienna

vienna$housing <- as.factor(vienna$housing)
levels(vienna$housing) <- c("tower building", "apartment", "patio house", "row house")

vienna$contact <- as.factor(vienna$contact)
levels(vienna$contact) <- c("little contact", "frequent contact")

vienna$satisfaction <- as.factor(vienna$satisfaction)
levels(vienna$satisfaction) <- c("low", "medium", "high")

summary(vienna[,-2])
table(vienna$housing)
table(vienna$contact)
table(vienna$satisfaction)
str(vienna[,-2])
vienna[,4]
levels(vienna$satisfaction) <- c("low-medium", "low-medium", "high")

satisfaction_table <- table(vienna$contact, vienna$satisfaction)
satisfaction_table
mosaicplot(satisfaction_table)

chisq.test(satisfaction_table)
odds_little <- satisfaction_table["little contact", "low-medium"] / 
  satisfaction_table["little contact", "high"]

odds_frequent <- satisfaction_table["frequent contact", "low-medium"] / 
  satisfaction_table["frequent contact", "high"]
OR <- odds_little / odds_frequent
OR
fisher.test(satisfaction_table)


# Take only apartments
vienna_apt <- vienna[vienna$housing == "apartment",]
satisfaction_table_apt <- table(vienna_apt$contact, vienna_apt$satisfaction)
satisfaction_table_apt
mosaicplot(satisfaction_table_apt)

chisq.test(satisfaction_table_apt, correct=FALSE)

odds_little <- satisfaction_table_apt["little contact", "low-medium"] / 
  satisfaction_table_apt["little contact", "high"]

odds_frequent <- satisfaction_table_apt["frequent contact", "low-medium"] / 
  satisfaction_table_apt["frequent contact", "high"]
OR <- odds_little / odds_frequent
OR

fisher.test(satisfaction_table_apt)
