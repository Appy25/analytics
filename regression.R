women
women$weight
str(women)
cor(women$height, women$weight)
cov(women$height, women$weight)
plot(women$height, women$weight)
fit1 = lm(formula = weight ~ height, data=women)
summary(fit1)
fitted(fit1)
names(fit1)
cbind(women, fitted(fit1), residuals(fit1))
mdata1 = data.frame(height=62.5)
predict(fit1, newdata=mdata1)
ndata1 = data.frame(height=c(62.5,63.5))
predict(fit1, newdata=ndata1)


#multiple regression

mtcars
names(mtcars)

fit2 = lm(mpg ~ wt + hp, data = mtcars)
summary(fit2)
range(mtcars$wt)
range(mtcars$hp)
ndata2 = data.frame(wt=c(2,3), hp=c(57,250))
predict(fit2, newdata=ndata2)
cbind(ndata2, predict(fit2, newdata=ndata2))



#Logistic Regression : Predict Probability of Selection 

df =  read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

## view the first few rows of the data
head(df)
sum(is.na(df))

## two-way contingency table of categorical outcome and predictors we want to make sure there are no empty cells
xtabs(~admit + rank, data = df)

str(df)
#convert rank into factors
df$rank = factor(df$rank)
df$admit = factor(df$admit)
fit3 = glm(admit ~ gre + gpa + rank, data=df,family="binomial")
summary(fit3)

#predict probabilities of original values
(prob=predict(fit3,type=c("response")))
cbind(df, prob)

#Test with new data
(newdata1 = data.frame(gre = mean(df$gre), gpa = mean(df$gpa), rank = factor(1)))
cbind(newdata1, predictProb=predict(fit3, newdata = newdata1, type="response"))
#if prob > 0.5, we say select = 1

#another set of data for prediction
range(df$gre); range(df$gpa);levels(df$rank)
(newdata2 = data.frame(gre = c(200, 300, 400, 500), gpa = c(2.5, 3, 3.3, 3.75), rank = factor(c(1,2,3,4))))
str(newdata2)
newdata2b = cbind(newdata2, predictProb2=predict(fit3, newdata = newdata2, type = "response"))
newdata2b


#this way you predict Probabilites