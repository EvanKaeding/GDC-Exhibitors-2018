
get_company_info <- function(company_url, token) {
  
  #Step 1: Configure the parts of the URL that will be used in the GET request
  
  base_url <- "https://company.clearbit.com/v2/companies/find?domain="

  #Step 2: Build the URL that will be used in the GET request
  
  request_url <- paste(base_url, company_url, sep="")
  
  #Step 3: Build the headers for authorization
  
  authorization_headers <- paste("Bearer ", token, sep="")
  
  #Step 4: Send the GET request and store the response
  
  response <- GET(request_url, add_headers(Authorization = authorization_headers))
  
  #Step 5: Return the response as the function output
  
  response
  
}