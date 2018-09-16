

age = ceiling (rnorm(3000, mean = 22, sd = 2))
age
marks = ceiling (rnorm(3000, mean = 65, sd = 10))
marks
df = data.frame(age, marks)
head(df)
km = kmeans(df, center = 4)
km
km$withinss
km$betweenss
km$iter
km$centers


#Optimal Number of Clusters in data
#Reduce total within ss
iris
head(iris)
table(iris$Species)

data = iris[-5]
head(data)

km1= kmeans(data,centers=1)
km1$withinss
km1$tot.withinss

km2= kmeans(data,centers=2)
km2$tot.withinss
km2$withinss

km3= kmeans(data,centers=3)
km3$tot.withinss

km4= kmeans(data,centers=4)
km4$tot.withinss

km5= kmeans(data,centers=5)
km5$tot.withinss

km1$tot.withinss; km2$tot.withinss ; km3$tot.withinss ; km4$tot.withinss ; km5$tot.withinss

#Selecting the number of clusters
library(NbClust)
nc = NbClust(data, distance="euclidean",min.nc=2, max.nc=15, method="average")

kiris = kmeans(data, centers=3)
kiris$centers

cbind(iris$Species, data, kiris$cluster)


names(mtcars)
data2 = mtcars[c('mpg','disp','hp','wt')]
head(data2)
nc = NbClust(data2, distance="euclidean",min.nc=2, max.nc=15, method="average")
det(as.matrix(mtcars))
?na.action
km3= kmeans(data,centers=3)
km3$tot.withinss

cbind(km1$tot.withinss, km2$tot.withinss, km3$tot.withinss, km4$tot.withinss,km5$tot.withinss)

#we select no clusters at elbow point
#adding more clusters does not significantly reduce total withinss



# HH MA example  - customer

#install.packages("amap")
library(amap)
##Read the data in the file
url = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=2073914016'
library(gsheet)
data = as.data.frame(gsheet2tbl(url))
str(data)
head(data)

names(data)
summary(data)
###Verify the data
colnames(data)
class(data$Age)
apply(data, 2, FUN= class)  #are all numeric
dim(data)
head(data)
summary(data)
###Run the kmeans algorithm to generate the clusters
#?amap::Kmeans
names(data)

k1 <- amap::Kmeans(data[,-1],centers=3, iter.max = 200,nstart = 1, 
                   method = c("euclidean"))

k1$centers  # group means
###Fetch size/n of obs for the groups
k1$size
###Fetch sum of squared  for the groups
k1$withinss
###Fetch the cluster for each obs
#k1$cluster
k1$cluster
k1$centers
k1$cluster[9000:9800]
table(k1$cluster)
k1$size
data_clus_2 <- data[ k1$cluster == 2,]
(data_clus_2)
mean(data_clus_2$Age)

data_clus_2$Cust_id

# Write CSV
write.csv(data_clus_2[,1], file = "./data/data_clus_2.csv")

