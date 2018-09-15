#vector
x = c(1,2,3)
x1 = 1:1000000
length(x1)
x
x1
x2 = seq(10, 100, 2)
?seq
x3 = seq(from=1, to=100, by=3)
x3


#numerical vector----

marks = rnorm(n = 30, mean = 60, sd =10)
marks
mean(marks)
median(marks)
mode(marks)
sd(marks)
var(marks)
summary(marks)

#properties of vector
length(marks)
str(marks)
class(marks)
hist(marks)
plot(marks)


#charecter vector----

names = c('ap', 'vh', 'kl')
names
gender = c('m', 'f', 'm')
genderf = factor(gender)
summary(genderf)

grades = c('a', 'b', 'c', 'd', 'e', 'f')
gradef = factor(grades, ordered =1)
gradef
gradef1 = factor(grades, ordered =T, levels = c('e', 'd', 'c', 'b', 'a', 'f'))
gradef1


#logical vector----
married = c(T, F, T, F)
sum(married)
table(married)

#subset of marks
marks
trunc(marks); round(marks, 1); floor(marks); ceiling(marks)
marks1 = trunc(marks)
marks1
marks1[-2]
marks1[c(1, 5, 10, 30)]
mean(marks1[c(1, 5, 10, 30)])
marks1[marks1 > 60]


gender2 = sample(c('m', 'f'), size=100, replace=T, prob = c(.6, .4))
gender2
table(gender2)


