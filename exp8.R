library('ggplot2')
library(readr)
options(repr.plot.width = 6, repr.plot.height = 6) # resize the plots


Iris <- read.csv('../Desktop/DAV/Iris.csv')
class(Iris)

head(Iris)

ggplot(Iris,aes(x=SepalWidthCm , y=SepalLengthCm , color=Species)) + geom_point() 
+ labs(title = "Scatter plot of Sepal Length vs Sepal Width",
       x = "Sepal Length" , y="Sepal Width") 

ggplot(Iris,aes(x=Species , y=PetalLengthCm)) + geom_boxplot() + 
  labs(title = "Box plot of petal length by Species" , x="Species" , y="petal Length")

ggplot(Iris,aes(x=Species , y=PetalWidthCm , fill=PetalLengthCm)) + geom_tile() + 
  scale_fill_gradient(low="white" , high = "steelblue")+
  labs(title="HeatMap of peta width vs Petal Length by species" , 
       x="Species" , y="Petal Width")


library(MASS)
parcoord(Iris[,1:4] , col=iris[,5] , oma=c(4,4,6,12))

install.packages("ggvis")
library("ggvis")
Iris %>% ggvis(~SepalWidthCm , ~PetalWidthCm , fill = ~Species) %>% layer_points()

or

p <- ggvis(Iris, x = ~SepalWidthCm, y = ~PetalWidthCm , fill= ~Species)
layer_points(p)

install.packages("lattice")
library("lattice")

xyplot(PetalLengthCm ~ SepalWidthCm | Species , data = Iris , type=c("p" ,"g"))
