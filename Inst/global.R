library(xgboost)
library(tidyverse)
library(DT)

DiamondClass <-xgb.load("iris.model")
load("SpeciesClassInfo.rda")


generatePreds<- function(sepal_length = 4.5, sepal_width = 3.5, petal_length = 1.5, petal_width = 0.5){
  
  testDF<- as.matrix(sepal_length , sepal_width , petal_length , petal_width)



preds<- predict(SpeciesClass, as.matrix(testDF))

data.frame(
  Species = SpeciesClassInfo$var.levels
  , preds
)%>%
  arrange(desc(preds))
}
