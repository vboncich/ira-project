library(shiny)
library(plotly)
library(shinydashboard)
library(ggplot2)

setwd("C:/Users/veronica.m.osborn/Desktop/Veronica - ISS Services Project")
isshist = read.csv("issforhistogram.csv")
isslevels = read.csv("issforcritlevels2.csv")
riskfeed = read.csv("riskfeed.csv")

header <- dashboardHeader(title = "Installation Readiness")
  
sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Navigation Bar", tabName = "home", icon = icon("fa fa-home")),
      menuItem("Methodology", tabName = "methodology", icon = icon("fa fa-briefcase")),
      menuItem("Financial Deficits", tabName = "deficits", icon = icon("fa fa-line-chart")),
      menuItem("ISS Criticality Levels", tabName = "criticality", icon = icon("fa fa-bar-chart")),
      menuItem("Demographic Insights", tabName = "demographics", icon = icon("fa fa-male")),
      menuItem("Raw Data", tabName = "data", icon = icon("fa fa-file-text")),
      menuItem("References", tabName = "references", icon = icon("fa fa-book"))
    ))
  
body <- dashboardBody(
    tags$head(tags$style(HTML('
      .main-header .logo {
        font-family: serif;
        font-weight: ;
        font-size: 18px;
      }
    '))),
    
    tabItems(
      # First tab content
#############################################################################################
      
      
      
      tabItem(tabName = "home",
              h2("Risk Assessment"),
              fluidRow(column(width = 2, box(selectInput
                          ("selectRS", label = h4("Select Year"), 
                            choices = list(
                              #"100: Installation Management" = "ISS100",
                              #"102: Administration and Civil Law" = "ISS102",
                              #"103: Criminal Law and Discipline" = "ISS103",
                              #"104: Client Services" = "ISS104",
                              #"105: Claims" = "ISS105",
                              #"106: Religious Support" = "ISS106",
                              #"107: Public Affairs" = "ISS107",
                              #"109: Equal Employment Opportunity (EEO)" = "ISS109",
                              #"111: Internal Review" = "ISS111",
                              #"112: Installation Safety/Occupational Health" = "ISS112",
                              #"115: Program Budget" = "ISS115",
                              #"116: Support Agreement (MOU/MOA) Mgmt" = "ISS116",
                              #"118: Installation TDA Management" = "ISS118",
                              #"121: Management Analysis" = "ISS121",
                              #"113: Administrative Management" = "ISS113",
                              #"250: Substance Abuse" = "ISS250",
                              #"800: Military Personnel Services" = "ISS800",
                              #"803: Continuing Education Services" = "ISS803",
                              #"202: Army Lodging Management" = "ISS202",
                              #"251: Army Community Service" = "ISS251",
                              #"252: Child, Youth, and School Services" = "ISS252",
                              #"253: Sports, Recreation, and Libraries" = "ISS253",
                              #"254: Business Operations" = "ISS254",
                              #"201: Family Housing Management"  = "ISS201",
                              #"414: Facilities Maintenance - Army Family Housing" = "ISS414",
                              #"411: Facilities Maintenance - Vertical" = "ISS411",
                              #"420: Facilities Maintenance - Horizontal" = "ISS420"),
                              "2010" = "Y2010",
                              "2011" = "Y2011",
                              "2012" = "Y2012",
                              "2013" = "Y2013",
                              "2014" = "Y2014",
                              "2015" = "Y2015",
                              "2016" = "Y2016", 
                              "2017" = "Y2017",
                              "2018" = "Y2018",
                              "2019" = "Y2019",
                              "2020" = "Y2020",
                              "2021" = "Y2021"),
                            selected = "Y2010"), width = NULL)),
column(width = 10, plotlyOutput("riskscatter"))
    )
  ),
  
  #############################################################################################
  #Content for the Methodology Tab
  tabItem(tabName = "methodology",
          h2("Methodology Content"),
          splitLayout(
            mainPanel(
              img(src="alphamatrix.png", height = 320, width = 458),
              img(src="scoreassignment.png", height = 320, width = 458)
               )
  )),
  
#############################################################################################
  #Content for the Financial Deficits Tab
  tabItem(tabName = "deficits",
          
          navbarPage("Financial Deficits",
                     tabPanel("Individual",
                  
          h3("Individual Assessment of ISS Financial Deficits"),
             fluidRow(column(width = 4, box(selectInput("selectF", label = h4("Select Installation Service"), 
                                      choices = list(
                                      "100: Installation Management" = "ISS1",
                                      "102: Administration and Civil Law" = "ISS2",
                                      "103: Criminal Law and Discipline" = "ISS3",
                                      "104: Client Services" = "ISS4",
                                      "105: Claims" = "ISS5",
                                      "106: Religious Support" = "ISS6",
                                      "107: Public Affairs" = "ISS7",
                                      "109: Equal Employment Opportunity (EEO)" = "ISS8",
                                      "111: Internal Review" = "ISS9",
                                      "112: Installation Safety/Occupational Health" = "ISS10",
                                      "115: Program Budget" = "ISS11",
                                      "116: Support Agreement (MOU/MOA) Mgmt" = "ISS12",
                                      "118: Installation TDA Management" = "ISS13",
                                      "121: Management Analysis" = "ISS14",
                                      "113: Administrative Management" = "ISS15",
                                      "250: Substance Abuse" = "ISS16",
                                      "800: Military Personnel Services" = "ISS17",
                                      "803: Continuing Education Services" = "ISS18",
                                      "202: Army Lodging Management" = "ISS19",
                                      "251: Army Community Service" = "ISS20",
                                      "252: Child, Youth, and School Services" = "ISS21",
                                      "253: Sports, Recreation, and Libraries" = "ISS22",
                                      "254: Business Operations" = "ISS23",
                                      "201: Family Housing Management"  = "ISS24",
                                      "414: Facilities Maintenance - Army Family Housing" = "ISS25",
                                      "411: Facilities Maintenance - Vertical" = "ISS26",
                                      "420: Facilities Maintenance - Horizontal" = "ISS27"),
                                    selected = "ISS1"), width = NULL), 
                             valueBoxOutput("Def16Box", width = NULL),
                            valueBoxOutput("Pred21Box", width = NULL)),
          column(width = 7, plotlyOutput("ISSPlotF")))),
          
          tabPanel("Compare", h3("Comparison of ISS Financial Deficits"),
                   fluidRow(column(width = 4, box(checkboxGroupInput("checkboxF", 
                                           label = h4("Select Installation Service(s)"), 
                                                              choices = list(
                                      "100: Installation Management" = "ISS1",
                                      "102: Administration and Civil Law" = "ISS2",
                                      "103: Criminal Law and Discipline" = "ISS3",
                                      "104: Client Services" = "ISS4",
                                      "105: Claims" = "ISS5",
                                      "106: Religious Support" = "ISS6",
                                      "107: Public Affairs" = "ISS7",
                                      "109: Equal Employment Opportunity (EEO)" = "ISS8",
                                      "111: Internal Review" = "ISS9",
                                      "112: Installation Safety/Occupational Health" = "ISS10",
                                      "115: Program Budget" = "ISS11",
                                      "116: Support Agreement (MOU/MOA) Mgmt" = "ISS12",
                                      "118: Installation TDA Management" = "ISS13",
                                      "121: Management Analysis" = "ISS14",
                                      "113: Administrative Management" = "ISS15",
                                      "250: Substance Abuse" = "ISS16",
                                      "800: Military Personnel Services" = "ISS17",
                                      "803: Continuing Education Services" = "ISS18",
                                      "202: Army Lodging Management" = "ISS19",
                                      "251: Army Community Service" = "ISS20",
                                      "252: Child, Youth, and School Services" = "ISS21",
                                      "253: Sports, Recreation, and Libraries" = "ISS22",
                                      "254: Business Operations" = "ISS23",
                                      "201: Family Housing Management"  = "ISS24",
                                      "414: Facilities Maintenance - Army Family Housing" = "ISS25",
                                      "411: Facilities Maintenance - Vertical" = "ISS26",
                                      "420: Facilities Maintenance - Horizontal" = "ISS27"),
                             selected = "ISS1"), width = NULL)),
                             column(width=7, plotlyOutput("ISSLineF"))
                   )
  ))
  ),
  
  ############################################################################################# 
  #Content for the ISS Criticality Levels Tab
  tabItem(tabName = "criticality",
          
          navbarPage("Criticality Levels",
                     tabPanel("Individual",
          
          h3("Individual Assessment of ISS Criticality Levels"),
          fluidRow(column(width = 4, box(selectInput("selectC", label = h4("Select Installation Service"), 
                                   choices = list(
                                     "100: Installation Management" = "ISS1",
                                     "102: Administration and Civil Law" = "ISS2",
                                     "103: Criminal Law and Discipline" = "ISS3",
                                     "104: Client Services" = "ISS4",
                                     "105: Claims" = "ISS5",
                                     "106: Religious Support" = "ISS6",
                                     "107: Public Affairs" = "ISS7",
                                     "109: Equal Employment Opportunity (EEO)" = "ISS8",
                                     "111: Internal Review" = "ISS9",
                                     "112: Installation Safety/Occupational Health" = "ISS10",
                                     "115: Program Budget" = "ISS11",
                                     "116: Support Agreement (MOU/MOA) Mgmt" = "ISS12",
                                     "118: Installation TDA Management" = "ISS13",
                                     "121: Management Analysis" = "ISS14",
                                     "113: Administrative Management" = "ISS15",
                                     "250: Substance Abuse" = "ISS16",
                                     "800: Military Personnel Services" = "ISS17",
                                     "803: Continuing Education Services" = "ISS18",
                                     "202: Army Lodging Management" = "ISS19",
                                     "251: Army Community Service" = "ISS20",
                                     "252: Child, Youth, and School Services" = "ISS21",
                                     "253: Sports, Recreation, and Libraries" = "ISS22",
                                     "254: Business Operations" = "ISS23",
                                     "201: Family Housing Management"  = "ISS24",
                                     "414: Facilities Maintenance - Army Family Housing" = "ISS25",
                                     "411: Facilities Maintenance - Vertical" = "ISS26",
                                     "420: Facilities Maintenance - Horizontal" = "ISS27"),
                                   selected = "ISS1"), width = NULL, color="red"),
                       
          valueBoxOutput("HighCritBox", width = NULL),
          valueBoxOutput("LowCritBox", width = NULL)),
          column(width = 7, plotlyOutput("ISSPlot")))    
  ),
          tabPanel("Compare", h3("Comparison of ISS Criticality Levels")))
  ),

#############################################################################################
  #Content for the Demographic Insights Tab
  tabItem(tabName = "demographics",
          h2("Demographic Insights Content")
  ),
  #Content for the Raw Data Tab
  tabItem(tabName = "data",
          h2("Raw Data Content")
  ),
  #Content for the References Tab
  tabItem(tabName = "references",
          h2("References")
  )
 )
)

ui <- dashboardPage(skin = "red", header, sidebar, body)