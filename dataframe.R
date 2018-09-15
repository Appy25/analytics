#data frame
#rollno., names, batch, gender,, marks1, marks2

rollno. = 1:30
name = paste('student', 1:30, sep='-')
batch = sample(c(2016, 2017,2018), size=30, replace=T)
gender = sample(c('M', 'F'), size=30, replace=T)
marks1 = rnorm(30, mean=65, sd=7)
marks2 = rnorm(30, mean=60, sd=10)
df = data.frame(rollno., name, batch, gender, marks1, marks2, stringsAsFactors = T)
df
df$name
df$batch = factor(df$batch, ordered = T, levels = c('2016', '2017', '2018'))
str(df)
summary(df)

head(df)
tail(df)
dim(df)
ncol(df)
nrow(df)
names(df)
df [1,1:4]
df [1:2,1:4]
df [c(1,3), c(1,4,5,6)]
df[df$gender == 'M', ]
df[df$gender == 'M', 3:5]
df[df$gender == 'M' & df$marks1 > 64, 3:5]
nrow(df[df$gender == 'M', ])
sort(df$marks1)
order(df$marks1)
df$marks1
df[order(df$marks1), ]
rev(sort(df$marks1))
df[order(gender, batch), ]
df[order(gender, - batch), ]


#summary/ aggregating
aggregate(df$marks1, by = list(df$batch), FUN = mean)
aggregate(cbind(marks1, marks2) batch + gender, data = df, FUN = mean)


df
write.csv(df, "./data/bitsgoa.csv")

df3 = read.csv("./data/bitsgoa.csv")
head(df3)
df3 = df3[,-1]
df3
head(df3)




