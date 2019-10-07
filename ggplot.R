library(ggplot2)
g <- ggplot(midwest, aes(x=area, y = poptotal)) + geom_point() + geom_smooth(method = "lm")
g

summary(midwest)

gg <- ggplot(midwest, aes(x=area, y = poptotal)) +
  geom_point(aes(col=state), size = 3, shape = 21) +
  geom_smooth(method = "lm", col = "firebrick", size = 1) +
  coord_cartesian(xlim = c(0,0.1), ylim=c(0,1000000)) +
  labs(title = "Area vs Population", subtitle= "From midwest dataset",
       y = "Population", x = "Area", caption = "Midwest Demographics")
gg
data("midwest")
summary(midwest)
attach(midwest)
boxplot(area~county)

df<- data.frame(midwest$county, midwest$percasian, midwest$percollege)
typeof(df)

t.test(df$midwest.percasian, df$midwest.percollege)



