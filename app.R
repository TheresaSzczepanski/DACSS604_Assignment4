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
library(tidyverse)
library(ggplot2)
library(lubridate)
library(readxl)
library(hrbrthemes)
library(viridis)
library(ggpubr)
library(purrr)
library(plotly)
library(dplyr)
library(RColorBrewer)

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
                        HTML(
                        
                        "<p>
                               The 2025 Writing items and scores will be relased in June. Here are the 2024 student sample writing and
                                <a href ='https://www.doe.mass.edu/mcas/student/2024/grade10/ela.html'>
                                Scoring guidelines </a>
                            </p>"
                        )
                    )
                    
                  )
                    
              ),
            
            tabItem("g10ELAReadingPerformance",
              span(h1("How do we support reading?")), #style = "color:black")),
              #  plotOutput("distPlot")
              fluidRow(
              valueBox(9  ,HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
              valueBox(11, HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
              box( width = 4, solidHeader = FALSE,
                   HTML("<p> Rising Tide students on average earned <b> 10% </b> more points on items from the reading portion of 
                        the exam than their peers in the state.  </b>. </p>")
              ))
              ,
              
            h3("Examine Craft and Structure and Key Ideas and Details Standards"),
              fluidRow(
              plotOutput("clusterPlot"),
              box( width = 16, solidHeader = FALSE,
                   HTML("<p> Rising Tide students on performed the <b>weakest</b> relative to their peers in the state in the the reading clusters that account for  <b> 77% </b> of the available points from the reading portion of 
                        the exam, Craft and Structure and Key Ideas and Details. </p>")
              )
              ),
            
              h2("Which standards should we review?"),
              h3("Craft and Structure: 12.5"),
              HTML("<p> <b>R.PK-12.5</b>: Analyze how an author’s choices concerning how to <b>structure a text</b>, 
                  order events within it (e.g., parallel plots), and manipulate time (e.g., pacing, flashbacks) 
                   create such effects as mystery, tension, or surprise. </p>"),
            
                  plotOutput("CS_Plot"),
              
              
              
              h3("Key Ideas and Details: 12.2"),
            HTML("<p><b> R.PK-12.2: </b>Determine a <b>theme or central idea </b> of a text and analyze in detail its development over the course of the
            text, including how it emerges and is shaped and refined by specific details; provide an objective
            summary of a text. </p>"),
                plotOutput("KI_Plot"),
            
              h3("Weakest Exam Items"),
                tableOutput("G10_Weakest_Items")
            )
            
          )
            
            
           
          )
        #)
    #)
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$clusterPlot <- renderPlot({
      G10Prelim_Cluster_Plot
        
    })
    
    output$CS_Plot <- renderPlot({
      G10_CS_Plot
      
    })
    
    output$KI_Plot <- renderPlot({
      G10_KI_Plot
      
    })
    output$G10_Weakest_Items<- renderTable({
      G10_Weakest_Items
     } )
}

# Read in the Data Frames
G10Prelim_Item_RT<-read_csv("G10Prelim_Item_RT.csv")
view(G10Prelim_Item_RT)

## ELA Cluster Sum

G10Prelim_Cluster_Sum<-G10Prelim_Item_RT%>%
  mutate(state_pts = round(pts*`state%`/100,2))%>%
  group_by(CLUSTER)%>%
  summarize(cluster_pts = sum(pts),
            RT_cluster_pts = sum(RT_pts),
            state_cluster_pts = sum(state_pts))%>%
  mutate(`RT_cluster%` = round(`RT_cluster_pts`/(`cluster_pts`*53)*100))%>%
  mutate(`state_cluster%` = round(state_cluster_pts/cluster_pts*100))%>%
  mutate(`RT_State_cluster_diff` = `RT_cluster%`- `state_cluster%`)

G10Prelim_Cluster_Plot<-G10Prelim_Cluster_Sum%>%
  filter(CLUSTER != "Conventions")%>%
  filter(CLUSTER != "Vocabulary Acquisition and Use")%>%
  filter(CLUSTER != "Knowledge of Language")%>%
  ggplot(aes(x=`CLUSTER`,fill = "skyblue", y = `RT_State_cluster_diff`)) +
  geom_bar(position="dodge", stat = "identity", fill = "skyblue") +
  geom_text(aes( y = `RT_State_cluster_diff`, label = `RT_State_cluster_diff`,
                 vjust = -.25), position = position_dodge(width = 1)) +
  
  theme_classic() +
  theme(axis.title.x=element_blank(),
        axis.text.x = element_text(angle = 45, , hjust = 1),
        axis.ticks.x=element_blank())+
  #scale_fill_brewer(palette = "Paired")+
  labs(
    y = "RT_State_Diff",
    x= "Reading Cluster",
    title = "G10 ELA MCAS Rising Tide vs. State by Reading Cluster",
    caption = "Source: Spring 2025 Preliminary ELA MCAS")

## Key Ideas and Details Sum and Graphs

G10Prelim_KI_Sum<-G10Prelim_Item_RT%>%
  filter(CLUSTER == "Key Ideas and Details")%>%
  mutate(state_pts = round(pts*`state%`/100,2))%>%
  group_by(standard)%>%
  summarize(standard_pts = sum(pts),
            RT_standard_pts = sum(RT_pts),
            state_standard_pts = sum(state_pts))%>%
  mutate(`RT_standard%` = round(`RT_standard_pts`/(`standard_pts`*53)*100))%>%
  mutate(`state_standard%` = round(state_standard_pts/standard_pts*100))%>%
  mutate(`RT_State_standard_diff` = `RT_standard%`- `state_standard%`)

G10_KI_Plot<-G10Prelim_KI_Sum%>%
  ggplot(aes(x=`standard`,fill = "skyblue", y = `RT_State_standard_diff`)) +
  geom_bar(position="dodge", stat = "identity", fill = "skyblue") +
  geom_text(aes( y = `RT_State_standard_diff`, label = `RT_State_standard_diff`,
                 vjust = -.25), position = position_dodge(width = 1)) +
  
  theme_classic() +
  theme(axis.title.x=element_blank(),
        # axis.text.x = element_text(angle = 45, , hjust = 1),
        axis.ticks.x=element_blank())+
  #scale_fill_brewer(palette = "Paired")+
  labs(
    y = "RT_State_Diff",
    x= "Key Ideas and Details Standard",
    title = "G10 ELA MCAS Rising Tide vs. State by Key Ideas and Details Standards",
    caption = "Source: Spring 2025 Preliminary ELA MCAS")

## Craft and Structure Summary and Graphs
G10Prelim_CS_Sum<-G10Prelim_Item_RT%>%
  filter(CLUSTER == "Craft and Structure")%>%
  mutate(state_pts = round(pts*`state%`/100,2))%>%
  group_by(standard)%>%
  summarize(standard_pts = sum(pts),
            RT_standard_pts = sum(RT_pts),
            state_standard_pts = sum(state_pts))%>%
  mutate(`RT_standard%` = round(`RT_standard_pts`/(`standard_pts`*53)*100))%>%
  mutate(`state_standard%` = round(state_standard_pts/standard_pts*100))%>%
  mutate(`RT_State_standard_diff` = `RT_standard%`- `state_standard%`)

G10_CS_Plot<-G10Prelim_CS_Sum%>%
  ggplot(aes(x=`standard`,fill = "skyblue", y = `RT_State_standard_diff`)) +
  geom_bar(position="dodge", stat = "identity", fill = "skyblue") +
  geom_text(aes( y = `RT_State_standard_diff`, label = `RT_State_standard_diff`,
                 vjust = -.25), position = position_dodge(width = 1)) +
  
  theme_classic() +
  theme(axis.title.x=element_blank(),
        # axis.text.x = element_text(angle = 45, , hjust = 1),
        axis.ticks.x=element_blank())+
  #scale_fill_brewer(palette = "Paired")+
  labs(
    y = "RT_State_Diff",
    x= "Craft and Structure Standard",
    title = "G10 ELA MCAS Rising Tide vs. State by Craft and Structure Standards",
    caption = "Source: Spring 2025 Preliminary ELA MCAS")
## Weakest Items Table
G10_Weakest_Items<-G10Prelim_Item_RT%>%
  select(standard,  `item description`, `RT_State_Diff`)%>%
  arrange((`RT_State_Diff`))%>%
  filter(`RT_State_Diff` < 5)

view(G10Prelim_Cluster_Sum)
# Run the application 
shinyApp(ui = ui, server = server)
