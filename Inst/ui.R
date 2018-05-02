ui <-fluidPage(
  titlePanel("Predicting Iris Species"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sepal_length", label = "sepal_length:", value = 4.5, min = 0.5, max =10.5, step =.5)
      ,sliderInput("sepal_width", "sepal_width:", value = 3.5,
                    min = 0.5, max = 10.5, step = .5)
      ,sliderInput("petal_length", "petal_length:", value = 1.5,
                    min = 0, max = 5.5, step = .1)
      ,sliderInput("petal_width", "petal_width:", value = .5,
                    min = 0, max = 5, step = .1)
      
    ),
    mainPanel(
      DT::dataTableOutput("pred_table"),
      plotOutput("ScatterPlot"),
      plotOutput("DensityPlot1"),
      plotOutput("DensityPlot2"),
      plotOutput("DensityPlot3"),
      plotOutput("DensityPlot4")
    )
  )
)