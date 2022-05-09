header <- dashboardHeader(title = 'Projeto de Estatistica')

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Métricas", tabName = "m", icon = icon("chart-line")),
    menuItem("Comparando propriedades", tabName = "comp", icon = icon("chart-bar"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "m",
            fluidRow(
              box(title = 'Selecione os tipos de maconha', width = 12, solidHeader = TRUE, status = 'warning',
                  selectInput('stock', 'Ação', stocks_list, multiple = FALSE),
                  dateRangeInput('date', strong('Intervalo de tempo desejado'), 
                                 min = '2018-11-16', 
                                 max = '2020-10-21', 
                                 start = '2018-11-16', 
                                 end = '2020-10-21', 
                                 separator = "ate", 
                                 language = 'pt', 
                                 format = 'dd/mm/yy'),
                  uiOutput("timedate"),
                  actionButton('go', 'Submeter')
              )
            ),
            fluidRow(

              box(title = "Informacoes sobre os valores de fechamento dos valores dos tipos de maconha", width = 12, solidHeader = TRUE,

                  DTOutput('info')
              )
            ),
            fluidRow(
              box(title = "Gráfico em linha da maconha", width = 12, solidHeader = TRUE,
                  plotOutput('sh')
              )
            ),
            
            fluidRow(
              box(title = "Histograma da maconha", width = 12, solidHeader = TRUE,
                  plotOutput('hi')
              )
            ),
            
            fluidRow(
              box(title = "Boxplot da maconha", width = 12, solidHeader = TRUE,
                  plotOutput('bo')
              )
            ),
    ),
    tabItem(tabName = 'comp',
            fluidRow(
              box(title = 'Selecione seus dois tipos de maconha', width = 12, solidHeader = TRUE, status = 'warning',
                  selectInput('stock_comp', 'Ação', stocks_list, multiple = TRUE),
                  dateRangeInput('date_comp', strong('Intervalo de tempo desejado'), 
                                 min = '2016-07-01', 
                                 max = '2021-08-10', 
                                 start = '2016-07-01', 
                                 end = '2021-08-10', 
                                 separator = "ate", 
                                 language = 'pt', 
                                 format = 'dd/mm/yy'),
                  uiOutput("timedate_comp"),
                  actionButton('go_comp', 'Submeter')
              )
            ),
            
            fluidRow(
              box(title = "Correlação entre os tipos de maconhas escolhidas", width = 12, solidHeader = TRUE,
                  DTOutput('co_comp')
              )
            ),
            
            fluidRow(
              box(title = "Grafico de linha das altas dos tipos", width = 12, solidHeader = TRUE,
                  plotOutput('li_comp')
              )
            ),
            
            fluidRow(
              box(title = "Gráfico em barra das medias dos tipos", width = 12, solidHeader = TRUE,
                  plotOutput('ba_comp')
              )
            ),
            
            fluidRow(
              box(title = "Scatterplot dos tipos de maconha", width = 12, solidHeader = TRUE,
                  plotOutput('sc_comp')
              )
            ),
    )
  )
)

ui <- dashboardPage(
  skin = 'black',
  header, sidebar, body
)
