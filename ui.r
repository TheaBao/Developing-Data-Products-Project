library(shiny)

shinyUI(
  navbarPage("Air Quality Dataset",
             
             tabPanel("Infomation",
              h2("New York Air Quality Measurements"),
              hr(),
              h3("Description"),
              helpText("Daily air quality measurements in New York, May to September 1973."),
              
              h3("Format"),
              p("A data frame with 154 observations on 6 variables:"),        
              p("  [,1]  Ozone	numeric	Ozone (ppb)"),
              p("  [,2]  Solar.R	numeric	Solar R (lang)"),
              p("  [,3]  Wind	numeric	Wind (mph)"),
              p("  [,4]  Temp	numeric	Temperature (degrees F)"),
              p("  [,5]  Month	numeric	Month (1--12)"),
              p("  [,6]  Day	numeric	Day of month (1--31)"),
              
              h3("Details"),
              p("Daily readings of the following air quality values for May 1, 1973 (a Tuesday) to 
                September 30, 1973."),
              p("Ozone: Mean ozone in parts per billion from 1300 to 1500 hours at Roosevelt Island"),
              p("Solar.R: Solar radiation in Langleys in the frequency band 4000–7700 Angstroms from 0800 
                to 1200 hours at Central Park"),
              p("Wind: Average wind speed in miles per hour at 0700 and 1000 hours at LaGuardia Airport"),
              p("Temp: Maximum daily temperature in degrees Fahrenheit at La Guardia Airport."),
              
              h3("Source"),
              p("The data were obtained from the New York State Department of Conservation (ozone data) 
                and the National Weather Service (meteorological data)."),
              
              h3("References"),
              p("Chambers, J. M., Cleveland, W. S., Kleiner, B. and Tukey, P. A. 
                (1983) Graphical Methods for Data Analysis. Belmont, CA: Wadsworth.")
             ),
           tabPanel("Analysis",
              fluidPage(
               titlePanel("Relationship between Variables and Max Temperature of the Day"),
               sidebarLayout(
                 sidebarPanel(
                  selectInput("variable", "Variable:",
                                c("Ozone (ppb)" = "Ozone","Solar Radiation(lang)" = "Solar.R",
                                  "Wind (mph)" = "Wind","Month (1--12)" = "Month",
                                          "Day of month (1--31)" = "Day")
                              ),
                            
                            checkboxInput("outliers", "Show Outliers", FALSE)
                          ),
                 mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("AirBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("AirPlot"),
                                                 verbatimTextOutput("fit"))
                            )
                          )
                        )
                      )
             ),
             
             tabPanel("SourceCode",
                      p("Cousera Developing Data Products Project"),
                      a("https://github.com/TheaBao/Developing-Data-Products-Project")
             )

  )
)