library(xgboost)
library(tidyverse)
library(ggplot2)

Iris<-iris
View(Iris)

y1<- Iris$Species
var.levels <- levels(y1)
y = as.integer(y1) -1 


noOutcome<-Iris[,-5]
x = noOutcome[,c( 'Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]
var.names <- names(noOutcome)
x = as.matrix(x)


params <-list(
  "objective" = "multi:softprob"
  ,"eval_metric" = "mlogloss"
  , "num_class" = length(table(y))
  , "eta" = .5
  , "max_depth" = 3
  , "nthread" = 8
)

cv.nround = 50

bst.cv <- xgb.cv(param = params, data = x, label = y, nfold = 5, nrounds = cv.nround
                 ,missing = NA, prediction = TRUE)

nrounds= which.min(bst.cv$evaluation_log$test_mlogloss_mean)
bst.cv$evaluation_log[nrounds,]

SpeciesClass<- xgboost(param = params, data = x, label = y,  nrounds = cv.nround
                       ,missing = NA)

xgb.importance(var.names, model = SpeciesClass)
xgb.save(SpeciesClass, "iris.model")
SpeciesClassInfo<-list(
  var.names = var.names,
  var.levels = var.levels
)

save(SpeciesClassInfo, file = "SpeciesClassInfo.rda")

generatePreds<- function(sepal_length = 4.5, sepal_width = 3.5, petal_length = 1.5, petal_width = 0.5){
  
  testDF<- as.matrix(sepal_length , sepal_width , petal_length , petal_width )
}


preds<- predict(SpeciesClass, as.matrix(testDF))

data.frame(
  Cut = var.levels
  , preds
)%>%
  arrange(desc(preds))
