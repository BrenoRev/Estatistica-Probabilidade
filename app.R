setwd('C:\Users\breno\Desktop\Projetos\R\Projeto_EP')

source('global.R')
source('ui.R')
source('server.R')

shinyApp(
  ui = ui,
  server = server
)

