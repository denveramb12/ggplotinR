install.package("ggplot2")
library(ggplot2)

data()
data("iris")
head(iris)
summary(iris)

plot(iris)
plot(iris$Petal.Length, iris$Sepal.Width)

ggplot(iris, aes(x = Petal.Length, y = Sepal.Width)) +
  geom_point()


ggplot(iris, aes(x = Petal.Length, y = Sepal.Width, col = Species)) +
  geom_point()

ggplot(iris, aes(x = Petal.Length, y = Sepal.Width, col = Species, size = Petal.Width, )) +
  geom_point()

firstplot <- ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary", fun.y = "median", fill = "magenta") +
  geom_point(position = position_jitter(0.2), shape = 21, size = 3)

firstplot

#
summary(InsectSprays)
       
insectplot = ggplot(InsectSprays, aes( x = spray, y = count, fill = spray)) +
  geom_bar(stat = "summary", fun.y = "mean",) +
  geom_boxplot(fill = "white") +
  geom_point()

insectplot



install.packages("statisticalModeling")
library(statisticalModeling)








