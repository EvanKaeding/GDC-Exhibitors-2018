## Read Companies

## This function reads in a directory of RDA files and returns a list object
## containing all of the R objects.

read_companies <- function(files = list.files(full.names = TRUE)) {
        
        library(purrr)
        
        object_list <- mget(as.character(map(files, load, environment())))
        
        object_list
}