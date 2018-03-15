## Extract Details
## Used to extract details from a cleaned response from Clearbit's Company Enrichment
## API. The function takes a list object comprised of company details and returns
## pre-specified variables about the company as a data.frame. Note that it's
## difficult to add NULL values to a list and return them as a data.frame, so 
## NULLs are swapped out for NAs in this function.


extract_details <- function(company_object){
        
        # Read all of the pre-defined variables into a named list
        
        variables <- list(
        
        name = name <- company_object[["name"]],
        tags = tags <- paste(company_object[["tags"]], collapse = "-"),
        description = description <- company_object[["description"]],
        country = country <- company_object[["geo"]][["country"]],
        state = state <- company_object[["geo"]][["state"]],
        crunchbase_handle = crunchbase_handle <- company_object[["crunchbase"]][["handle"]],
        employees = employees <- company_object[["metrics"]][["employees"]],
        employee_range = employee_range <- company_object[["metrics"]][["employeesRange"]],
        revenue = revenue <- company_object[["metrics"]][["estimatedAnnualRevenue"]],
        raised = raised <- company_object[["metrics"]][["raised"]]
        
        )
        
        # Funciton Definition: If any of the variables are NULL, switch them to NA
        
        null_to_na <- function(variable){
                
                variable <- ifelse(is.null(variable), NA, variable)
                
                variable
        }
        
        # Apply the above function to all items in the variables list
        
        variables <- lapply(variables, null_to_na)
        
        # Convert the list into a data.frame and return it
        
        return_frame <- data.frame(variables)
        
        return_frame
}
