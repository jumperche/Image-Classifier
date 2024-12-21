library(shiny)
library(keras)
library(imager)

model <- load_model_hdf5("catsDogs1.h5")

classify_image <- function(img_path) {
  img <- keras::image_load(img_path, target_size = c(150, 150))
  img <- keras::image_to_array(img) / 255
  img <- keras::array_reshape(img, c(1, dim(img)))
  prediction <- model %>% predict(img)
  class_label <- ifelse(prediction > 0.5, "Dog", "Cat")
  return(class_label)
}

ui <- fluidPage(
  titlePanel("Image Classifier"),
  sidebarLayout(
    sidebarPanel(
      fileInput("image_upload", "Upload an image", accept = c('image/png', 'image/jpeg'))
    ),
    mainPanel(
      h3("Image Classification Result:"),
      verbatimTextOutput("classification_result")
    )
  )
)

server <- function(input, output) {

  classify_result <- reactive({
    if (!is.null(input$image_upload)) {
      img_path <- input$image_upload$datapath
      class_label <- classify_image(img_path)
      return(class_label)
    }
  })
 
  output$classification_result <- renderText({
    classify_result()
  })
}
shinyApp(ui = ui, server = server)