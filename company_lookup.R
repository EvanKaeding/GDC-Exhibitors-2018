## Company Lookup

## This function takes in a data.frame of company domains, an API key and saves
## the associated responses to the working directory. Clearbit's API returns
## a JSON object, which is cleaned and formatted as a list object.

## This function makes use of get_company_info() and response_cleaner()

company_lookup <- function(companies, key){
        
        library(httr)
        
        for(i in seq_along(1:nrow(companies))){
                
                #print(paste("Pulling data for", companies[i,1]))
                
                response <- get_company_info(companies[i,1], key)
                
                response <- response_cleaner(response)
                
                assign(companies[i,1], response)
                
                save(list = companies[i,1], file = paste0(companies[i,1], ".rda"))
                
                #print(paste("Saving data for", companies[i,1]))
        }
}