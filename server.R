# server.R

library(shiny)

shinyServer(function(input, output) {

	# Create a special variable for storing the elements of the table
	values <- reactiveValues()
	# Initialize the columns of the data frame
	values$df <- data.frame(MPG = numeric(0), CPG = numeric(0), CPM=numeric(0) )
	# Observe the calculateButton and add a new row to values$df when it is pressed
	newEntry <- observe({
		if(input$calculateButton > 0) {
			# add the new values based on the input data
			isolate(values$df[nrow(values$df) + 1,] <- c(input$mpg, input$cpg,  (input$cpg / input$mpg) ) )
		}
	})
	# update the output var with the table
	output$saved_cpm <- renderTable({values$df})
})
