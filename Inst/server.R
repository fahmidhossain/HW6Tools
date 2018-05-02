server<-function(input, output){
  
  Preds<-reactive({
    generatePreds(
      sepal_length= input$sepal_length,
      sepal_width =  input$sepal_width,
      petal_length = input$petal_length,
      petal_width = input$petal_width)
  })

  output$pred_table <- DT::renderDataTable({
    Preds()
     
      
  })
  
  
  output$ScatterPlot <- renderPlot({
    ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))  + geom_point(aes(color=Species, shape=Species)) +
    xlab("Sepal Length") +  ylab("Sepal Width") +
    ggtitle("Sepal Length-Width")
  })
  
  output$DensityPlot1 <- renderPlot({
    ggplot(data=iris, aes(x=Sepal.Length, fill=Species))+geom_density(stat="density", alpha=I(0.2)) +
      xlab("Sepal Length") +  ylab("Density") + ggtitle("Density Curve of Sepal Length")
  })
  output$DensityPlot2 <- renderPlot({
    ggplot(data=iris, aes(x=Sepal.Width, fill=Species))+geom_density(stat="density", alpha=I(0.2)) +
      xlab("Sepal Width") +  ylab("Density") + ggtitle("Density Curve of Sepal Width")
  })
  output$DensityPlot3 <- renderPlot({
    ggplot(data=iris, aes(x=Petal.Length, fill=Species))+geom_density(stat="density", alpha=I(0.2)) +
      xlab("Petal Length") +  ylab("Density") + ggtitle("Density Curve of Petal Length")
  })
  output$DensityPlot4 <- renderPlot({
    ggplot(data=iris, aes(x=Petal.Width, fill=Species))+geom_density(stat="density", alpha=I(0.2)) +
      xlab("Petal Width") +  ylab("Density") + ggtitle("Density Curve of Petal Width")
  })
}