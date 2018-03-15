## This function checks the status code of the response for any errors and delivers 
## the response content as a data.frame

response_cleaner <- function(response) {
        
        library(rjson)
  
  # Step 1: Extract the status code from the raw response and print it
  
  status_code <- response$status_code
  
  # Step 2: Indicate to the user whether the request was successful or not
  
  print(paste("The request was returned with status code", status_code))
  
  # Step 3: Check to see if the status code is acceptable. If error, return it as a data.frame
  
  if (status_code != 200L) {
    
    return(as.data.frame("The request resulted in an error"))
  }
  
  # Step 4: Convert the API response from a messy JSON object to a list 
  # containing only the content of the response
  
  cleaned_response <- fromJSON(content(response, "text"))
  
  # Step 5: Return the cleaned response
  
  return(cleaned_response)
  
  
}