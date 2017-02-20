library(shiny)
library(xlsx)
library(ggplot2)

server <- function(input, output) {

  output$download.Excel <- downloadHandler(

    filename = function() { paste("Excelfile.xlsx")},

    content = function(file){
      example_plot=qplot(1:10,1:10)
      Results_Workbook <- createWorkbook(type='xlsx')
      A=as.data.frame(matrix(2,2,2))
      sheet.1 <- createSheet(Results_Workbook, sheetName = "Data frame")
      addDataFrame(A, sheet=sheet.1, startRow=4,
                   startColumn=2,row.names=FALSE)
      setColumnWidth(sheet.1,colIndex=c(1:100),colWidth=30)
      sheet.2 <- createSheet(Results_Workbook, sheetName = "Plot")
      ggsave("plot.jpeg",example_plot, device="jpeg")
      print(list.files())
      addPicture(file = paste0(getwd(), "/plot.jpeg"), sheet = sheet.2, scale = 1,startRow = 4, startColumn = 4)
      addPicture(file = paste0(getwd(),"./elephant.jpeg"), sheet = sheet.2, scale = 0.5,startRow = 12, startColumn = 4)
      saveWorkbook(Results_Workbook,file)
    }

  )
}
