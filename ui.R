library(shiny)

shinyUI(fluidPage(
	titlePanel("Calcuate Fuel Cost Per Mile"),
  
	sidebarLayout(
		sidebarPanel(
			helpText("Adjust \"Miles Per Gallon\" and \"Cost Per Gallon\" to desired values then hit \"Calculate\" to add them to the table."),
			numericInput("mpg", "Miles Per Gallon", 20),
			sliderInput("cpg", label = h3("Cost Per Gallon"), min = 1.00,  max=5.00, step =0.1, value=2.5),
			actionButton("calculateButton", label = "Calculate")
		),
    	
		mainPanel(
			div("This app calculates the cost of fuel per mile and adds the values to a table for comparison. This allows you to see what it actually costs to drive given your car's mileage and a fuel price. You can compare values of different cars at the same price, a single car at different prices, or any other combination."),
			br(),
			div("For example, my truck runs on diesel (about $2.30 per gallon) and my sedan runs on gasoline (about $1.90), The truck's mpg is about 13 and the sedan gets about 28 mpg. Given these numbers, I can determine that the truck costs me $0.18 per mile for fuel, while the sedan only costs me $0.07 per mile."),
			br(),

			tableOutput("saved_cpm")
		)
	)
))
