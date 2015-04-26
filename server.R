library(shiny)
library(datasets)
gram_2=read.csv('C:/Users/Ritesh/Desktop/CapstoneProj/gram_2.csv')
gram_3=read.csv('C:/Users/Ritesh/Desktop/CapstoneProj/gram_3.csv')
gram_4=read.csv('C:/Users/Ritesh/Desktop/CapstoneProj/gram_4.csv')
gram_5=read.csv('C:/Users/Ritesh/Desktop/CapstoneProj/gram_2.csv')
# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
#   # Return the requested dataset
#   datasetInput <- reactive({
#     switch(input$dataset,
#            "rock" = rock,
#            "pressure" = pressure,
#            "cars" = cars)
#   })
  
  # Show the first "n" observations
  output$view <- renderTable({
    text=tolower(input$in_words)
    text1=strsplit(text,' ')
    if(length(text1[[1]])==1){dataset=gram_2}
    if(length(text1[[1]])==2){dataset=gram_3}   
    if(length(text1[[1]])==3){dataset=gram_4}
    if(length(text1[[1]])>=4){
      text1=text1[[1]][(length(text1[[1]])-3):length(text1[[1]])]
        dataset=gram_5}
    output=dataset[dataset$INPUT==text,c("INPUT","OUTPUT")]
    max=max(dim(output)[1],20)
    output=output[1:max,]
    output
  })
})
