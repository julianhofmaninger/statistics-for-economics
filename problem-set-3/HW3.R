load("Excess.RData")
summary(Data$excess)

med <- median(Data$excess, na.rm = TRUE)
closest <- head(Data[order(abs(Data$excess - med)), c("state", "excess")], 5)
farthest <- head(
  Data[order(abs(Data$excess - med), decreasing = TRUE), c("state", "excess")],5)
summary_tbl <- data.frame(rank = 1:5, closest_state  = closest$state,
                          closest_value  = round(closest$excess, 2), farthest_state = farthest$state,
                          farthest_value = round(farthest$excess, 2))
par(mfrow = c(2,3), mar = c(2, 2, 1, 1), oma = c(2, 1, 1, 1))
numvars <- c("stringency", "excess", "GDPpc", "dem_share", "pop_dens")
for (v in numvars) {
  hist(Data[[v]], main = paste("Histrogram of", v), xlab = v)
}
par(mfrow = c(2,3), mar = c(2, 2, 1, 1), oma = c(2, 1, 1, 1))
for (v in numvars) {boxplot(Data[[v]], main = paste("Boxplot of", v), ylab = v)}
outlier_list <- lapply(numvars, function(v) {
  outvals <- boxplot.stats(Data[[v]])$out
  if (length(outvals) > 0) {
    data.frame(variable=v,state=Data$state[Data[[v]] %in% outvals],
               value= Data[[v]][Data[[v]] %in% outvals])
  }
})

outlier_table <- do.call(rbind, outlier_list)
cor <- cor(Data[, numvars], use = "pairwise.complete.obs")
max_abs_cor <- max(abs(cor[lower.tri(cor)]))
idx <- which(cor == max_abs_cor, arr.ind = TRUE)
paste("Max. correlation of", round(max_abs_cor,4), "found for variables:", 
      rownames(cor)[idx[1, "row"]], "and", colnames(cor)[idx[1, "col"]])
new_data <- subset(Data, state != "District of Columbia")
cor(new_data[, numvars], use = "pairwise.complete.obs")

par(mfrow = c(2,3), mar = c(2, 2, 1, 1), oma = c(2, 1, 1, 1))
for (v in numvars) {
  hist(new_data[[v]], main = paste("Histrogram of", v), xlab = v)
}


t.test(new_data$excess, mu = 0, alternative = "greater")

cor_res <- cor.test(new_data$excess, Data$stringency)
cor_res

lm_model <- lm(excess ~ stringency, data = Data)
summary(lm_model)

# Quality of Fit
plot(new_data$stringency, Data$excess,
     main = "Scatterplot: Excess Deaths vs. Stringency",
     xlab = "Stringency Index", ylab = "Excess Deaths", pch = 19,       
     col = "darkgrey")
abline(lm_model, col = "red", lwd = 2)

# Revisit Scatterplot
colfunc <- colorRampPalette(c("red", "magenta", "blue"))
mycolors <- colfunc(50)[as.numeric(cut(new_data$dem_share, breaks = 50))]
plot(new_data$stringency, new_data$excess,
     col = mycolors, pch = 19, cex = 1.5,     
     xlab = "Stringency Index", ylab = "Excess Deaths",
     main = "Excess vs. Stringency (Colored by Vote Share)")
legend("topright", 
       legend = c("High Dem Share (Blue)", "Low Dem Share (Red)"),
       col = c("blue", "red"), pch = 19, bty = "n")

# Sub-model
Data_sub <- subset(new_data, dem_share >= 0.4)
lm_sub <- lm(excess ~ stringency, data = Data_sub)
summary(lm_sub)

# Full Regression Model
lm_full <- lm(excess ~ stringency + GDPpc + dem_share + pop_dens, data = new_data)
summary(lm_full)

# F-Test for variable selection
lm_reduced <- lm(excess ~ GDPpc + dem_share + pop_dens, data = new_data)
anova(lm_reduced, lm_full)

lm_reduced2 <- lm(excess ~ GDPpc + pop_dens, data = new_data)
anova(lm_reduced2, lm_reduced)
paste("Adjusted R-squared reduced model 1:", round(summary(lm_reduced)$adj.r.squared, 3))
paste("Adjusted R-squared reduced model 2:", round(summary(lm_reduced2)$adj.r.squared, 3))

# Model comparison
lm_null <- lm(excess ~ 1, data = new_data)
anova(lm_null, lm_reduced)