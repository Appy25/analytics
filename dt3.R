#Logistic Regression : Predict Probability of Selection 

df =  read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

library(rpart)
df$rank = factor(df$rank)
df$admit = factor(df$admit)
dim(df)
dtree3 = rpart(admit ~ gre + gpa + rank, data=df)

#print tree
dtree3

#print cp table
printcp(dtree3)
rpart.plot(dtree3)

#prune the tree
ptree3 = prune(dtree3, cp=.023622)
rpart.plot(ptree3)

#predict the class for any sample value
library(dplyr)
ndata1 = sample_n(df,3)
ndata1
predict(ptree3, newdata = ndata1, type = 'class')
df[15,]
