#subset

mtcars
newdata = subset(mtcars, mpg >= 20 & mpg < 30, select=c(mpg, disp))
newdata

name(mtcars)
head(mtcars)

