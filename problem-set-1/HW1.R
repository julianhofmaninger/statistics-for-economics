numseq <- rep(seq(1,7,by=3), each=4) * c(-1,1)
complexseq <- c(rep(c(4,2,0), 2), rep(c(7,14,21), 3))
?LETTERS
charpattern <- LETTERS[seq(2,26, by=2)]

vec <- 0:12
vec[vec %% 2 == 1] <- NA
na_idx <- which(is.na(vec))
vec[na_idx] <- vec[na_idx-1]+vec[na_idx+1] 

set.seed(1)
randvec <- rnorm(50, 0, 1)
subsetvec <- randvec[randvec > .5]
?sum
sum(randvec > 1)

?rbind
mat <- matrix(1:25, nrow=5, byrow=TRUE)
mat
mat[4,]
mat[,ncol(mat)]
dim(mat)

state <- as.data.frame(state.x77)
names(state) <- make.names(names(state))
variable_names <- names(state)
str(state) # The output of this command let's us investigate the datatypes. We can observe that all variables are numerical.

LowEdu <- ifelse(state$HS.Grad < 48, TRUE, FALSE)
HighEdu <- ifelse(state$HS.Grad > 60, TRUE, FALSE)
MixedEdu <- ifelse(state$HS.Grad >= 48 & state$HS.Grad <= 60, TRUE, FALSE)

LowEduNum <- ifelse(LowEdu, 1, 0)
EduStatus <- MixedEdu + 2 * HighEdu
table(EduStatus)

EduStatus <- as.factor(EduStatus)
levels(EduStatus) <- c("Low Education", "Mixed", "High Education")
?transform
state <- transform(state, Education_category=EduStatus)

low_education_data <- state[state$Education_category == "Low Education", c("Illiteracy", "Life.Exp")]
low_education_data
