#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- dashboardPage(
  skin = "blue",
  title = "Spring 2025 MCAS Preliminary Results Data Dashboard",
   dashboardHeader( 
     title = span(img(src="heron.jpg", width = 50, align = "left"), 
                 "Spring 2025 MCAS Preliminary Data Dashboard"),
     titleWidth = 650),
  dashboardSidebar(
    menuItem("ELA", tabName = "ela", icon = icon("book-bookmark"),
             menuSubItem("G10 ELA Content", tabName = "g10ELAContent"),
             menuSubItem("G10 ELA Writing Analysis", tabName = "g10ELAWritingAnalysis"),
             menuSubItem("G10 ELA Reading Analysis", tabName = "g10ELAReadingAnalysis")
    )
  ),

    # Application title
  #titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    # sidebarLayout(
    #     sidebarPanel(
    #         sliderInput("bins",
    #                     "Number of bins:",
    #                     min = 1,
    #                     max = 50,
    #                     value = 30)
    #     ),

        # Show a plot of the generated distribution
        dashboardBody(
          
          # span(h1("How were students assessed?")), #style = "color:black")),
          # HTML("<p>The 2023 <b> G10 ELA </b> exam consisted of 28 selected response
          #     questions and two essays worth in <b>total 51 points </b>.
          #         </p>"),
          # h2("Available Points by Content Category"),
          # 
          # h3("Reading"),
          # plotOutput("distPlot"),
          
          #G10 ELA Content
          tabItems(
          
            tabItem("g10ELAContent",
                    span(h1("How were students assessed?")), #style = "color:black")),
                    HTML("<p>The 2025 <b> G10 ELA </b> exam consisted of 27 selected response
              questions and two essays worth in <b>total 49 points </b>.
                  </p>"),
                    h2("Available Points by Content Category"),
                    
                    h3("Reading"),
                  #  plotOutput("distPlot")
                    valueBox( 28 ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
                    valueBox(5, HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
                    box( title = "Past Released Materials", width = 4, solidHeader = FALSE,
                         HTML("<p>
                              <ul>
                                <li>
                                  <a href='https://mcas.digitalitemlibrary.com/home?subject=ELA&grades=Grade%2010&view=ALL'>Digital item library </a>
                               </li>
                                <li>
                                  <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr10-ela.pdf'>
                                    2022 released paper based items </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-ela/MCAS_2022_Gr10_ELA_PT_ADA.pdf'>
                                    Paper Based Practice Test PDF </a>
                               </li>
                                <li>
                                  Sample
                                    <a href = 'https://mcas.onlinehelp.cognia.org/practice-tests-ela/'> computer based practice test</a>
                               </li>
                              </ul>
                          </p>")
                         ),
                  h3("Writing"),
                  fluidRow(
                    valueBox( 12,HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
                    valueBox( 4,HTML("<p>Essay: <br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
                    box(title = "Notes", width = 4, solidHeader = FALSE,
                        HTML("<p>
                               Student sample writing and
                                <a href ='https://www.doe.mass.edu/mcas/student/2024/grade10/ela.html'>
                                Scoring guidelines </a>
                            </p>"
                        )
                    )
                    
                  )
                    
              )
            
            )
           
          )
        #)
    #)
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
