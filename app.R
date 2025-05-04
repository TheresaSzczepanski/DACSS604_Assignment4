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
             menuSubItem("G10 ELA Exam Structure", tabName = "g10ELAContent"),
             menuSubItem("G10 ELA Reading Performance", tabName = "g10ELAReadingPerformance")
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
                  
                  h2("Available Selected Response Points by Domain Cluster"),
                  HTML("<p>The 2025 <b> G10 ELA </b> exam consisted of 27 selected response
              questions worth in <b>total 33 points </b>.</p>"),
                  
                  
                  fluidRow(
                    # A static valueBox
                    valueBox(14 , HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "blue"),
                    valueBox(11 , HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"),
                    
                    valueBox(3 , HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
                    
                    
                    
                    valueBox(2, HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
                    
                    valueBox(2, HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
                    valueBox(1 , HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue"),
                    box( title = "Notes", width = 4, solidHeader = FALSE,
                         HTML("<p> Read more about the <a href =
                      'https://www.doe.mass.edu/frameworks/ela/2017-06.pdf'>
                       anchor standards </a> in the frameworks.</p>"))
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
                    
              ),
            
            tabItem("g10ELAReadingPerformance",
              span(h1("How do we support reading?")), #style = "color:black")),
              h3("Rising Tide - State Diff: Reading"),
              #  plotOutput("distPlot")
              valueBox(9  ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
              valueBox(11, HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
              box( width = 4, solidHeader = FALSE,
                   HTML("<p> In <b> contrast</b> to their reading scores by text type,
                    Rising Tide students lost writing points at rates independent of the text type and student performance level.
                    This suggests the need to review the practice of writing in <b> both ELA and Social Studies </b>. </p>")
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
