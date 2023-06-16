library(ggplot2)
library(shiny)
library(colourpicker)

ui <- fluidPage(
  pageWithSidebar(
    titlePanel(title = "ggplot2 Plot builder"),
    sidebarPanel(
      colourInput(inputId = "plot_title", label = "Plot Title", value = "#262626"),
      colourInput(inputId = "plot_subtitle", label = "Plot Subtitle", value = "#262626"),
      selectInput(inputId = "legend_position", label = "Legend Position", 
                  choices = c("right", "left", "top", "bottom")),
      colourInput(inputId = "legend_title", label = "Legend Title", value = "#262626"),
      colourInput(inputId = "legend_text", label = "Legend Text", value = "#262626"),
      colourInput(inputId = "axis_title", label = "Axis Title", value = "#262626"),
      colourInput(inputId = "axis_text", label = "Axis Text", value = "#262626"),
      colourInput(inputId = "strip_text", label = "Strip Text", value = "#262626"),
    ),
    mainPanel(
        plotOutput(outputId = "ggout")
      )
  )
)


server <- function(input, output) {
  title_color <- reactive({input$plot_title})
  subtitle_color <- reactive({input$plot_subtitle})
  axis_text_color <- reactive({input$axis_text})
  legend_color <- reactive({input$legend_text})
  legend_title_color <- reactive({input$legend_title})
  axis_title_color <- reactive({input$axis_title})
  strip_color <- reactive({input$strip_text})
  legend_position <- reactive({input$legend_position})
  
  output$ggout <- renderPlot({
    
    plot_colot_fn <- title_color()
    subtitle_color_fn <- subtitle_color()
    axis_text_color_fn <- axis_text_color()
    legend_color_fn <- legend_color()
    legend_title_color_fn <- legend_title_color()
    axis_title_color_fn <- axis_title_color()
    strip_color_fn <- strip_color()
    legend_position_fn <- legend_position()
    
    ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species))+
      geom_point()+
      facet_wrap(~Species)+
      ggtitle("Iris dataset", 
              subtitle = "Scatterplots of sepal and petal lengths") +
      theme(plot.title  = element_text(color = plot_colot_fn), 
            axis.text  = element_text(color = axis_text_color_fn), 
            plot.subtitle = element_text(color = subtitle_color_fn), 
            legend.text = element_text(color = legend_color_fn), 
            legend.title = element_text(color = legend_title_color_fn), 
            axis.title = element_text(color = axis_title_color_fn), 
            strip.text = element_text(color = strip_color_fn),
            legend.position = legend_position_fn)
  })
}

shinyApp(ui, server)