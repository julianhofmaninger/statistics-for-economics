## Exercise 9
# Numerical Description
dat <- read.csv2("./Ausfall.csv", header = TRUE)
dat$Ausfall <- factor(dat$Ausfall)   
dat$Student <- factor(dat$Student) 
summary(dat) 

tab_default <- table(dat$Ausfall)
prop_default <- prop.table(tab_default)
tab_student <- table(dat$Student)
prop_student <- prop.table(tab_student)
cbind("Count Default" = tab_default,"Proportion Default" = prop_default, 
      "Count Student" = tab_student, "Proportion Student" = prop_student)

# Graphical Representation
table(dat$Student, dat$Ausfall)
barplot(table(dat$Student, dat$Ausfall),beside = TRUE,legend.text = c("Default", "No default"),
        args.legend = list(title = "Default", x = "topleft"),
        main = "Payment Defaults by Student Status",
        xlab = "Student Status",ylab = "Number of Customers")

boxplot(Balance ~ Ausfall, data = dat,main = "Balance by Default", ylab = "Balance")

boxplot(Einkommen ~ Ausfall, data = dat,main = "Income by Default", ylab = "Income")

# Logistic Regression
m1 <- glm(Ausfall ~ .,data = dat,family = binomial)
summary(m1)

dat$Ausfall <- relevel(as.factor(dat$Ausfall), ref = "Nein")
dat$Student <- relevel(dat$Student, ref = "Nein")
mod <- glm(Ausfall ~ ., data = dat, family = binomial)
beta_student <- coef(mod)["StudentJa"]
OR_student <- exp(beta_student)
cbind("Beta Student" = beta_student, "OR Student" = OR_student)

confint_99 <- confint(profile(mod), parm = "StudentJa", level = 0.99)
OR_CI_99 <- exp(confint_99)
OR_CI_99


## Exercise 10
# Numerical Description
wko <- read.csv("wko.csv")
wko$gruppe <- factor(wko$gruppe)
summary(wko)
by(wko$akzeptanz, wko$gruppe, summary)
aggregate(akzeptanz ~ gruppe, data = wko, 
          function(x) c(mean = round(mean(x), 2), sd = round(sd(x), 2)))

# Graphical Representation
boxplot(akzeptanz ~ gruppe, data = wko,
        main = "Attitude by Group",
        xlab = "Group",
        ylab = "Attitude level",
        col = c("lightblue", "lightgreen"))

# Testing hypotheses
test_result <- t.test(akzeptanz ~ gruppe, data = wko)
print(test_result)


## Exercise 11
# Data Exploration
load("doctor.rda") 
summary(doctor)
doctor$access <- as.factor(doctor$access)

boxplot(doctor ~ access, data = doctor, 
        main = "Doctor Visits by Access Level",
        xlab = "Access Level",
        ylab = "Number of Doctor Visits")
kruskal.test(doctor ~ access, data = doctor)

## Model Fitting
model_a <- lm(health ~ doctor + children, data = doctor)
model_b <- lm(health ~ doctor + access + children, data = doctor)
model_c <- lm(health ~ doctor * access + children, data = doctor)

anova(model_a, model_b)
anova(model_b, model_c)
anova(model_a, model_c)

summary(model_c)

# Model Diagnostics
par(mfrow = c(1, 2))
plot(model_c, which = 1:2, id.n = 0)

model_log <- lm(log(health) ~ doctor * access + children, data = doctor)
summary(model_log)

par(mfrow = c(1, 2))
plot(model_log, which = 1:2, id.n = 0)
