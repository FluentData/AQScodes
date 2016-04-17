library(XML)
library(RCurl)
library(stringr)
library(devtools)


downloadAQSTable <- function(table_name){
  # table_name <- "Parameters"
  codesURL <- "https://www.epa.gov/aqs/aqs-code-list"
  codesURLcurled <- getURL(codesURL)

  codes_tables <- readHTMLTable(codesURLcurled, header = TRUE,
                                stringsAsFactors = FALSE)
  codes_lines <- readLines(codesURL)

  table_urls <- sapply(codes_tables[1], function(tables){
    tables <- tables[tables != ""]
    sapply(tables, function(table){
      table_lines <- codes_lines[grep(paste0(">", table, "<"), codes_lines)]
      if(length(table_lines) > 0){
        table_url <- table_lines[grep("href", table_lines)]
        if(length(table_url) == 1){
          url <- str_extract(table_url, "href.*html")
          url <- sub('href=.', "", url)
        }else{
          stop("not exactly one url for ", table)
        }
      }else{
        return(NA)
      }
    })
  })

  table_urls <- data.frame(Name = rownames(table_urls), URL = table_urls[, 1],
                           stringsAsFactors = FALSE)

  url <- table_urls[table_urls$Name == table_name, "URL"]
  url <- sub("html", "csv", url)
  df <- read.table(url, sep = ",", header = TRUE, skip = 1,
                   stringsAsFactors = FALSE)

  names(df) <- gsub("\\.", "_", names(df))
  names(df) <- gsub("__", "_", names(df))
  names(df) <- sub("_$", "", names(df))

  df

}






