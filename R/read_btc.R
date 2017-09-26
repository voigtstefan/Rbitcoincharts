#' Read bitcoinchart data
#' @importFrom readr read_csv
#' @export

read.btc <- function(exc='kraken', cur='GBP', folder='.'){
    url <- get.url(exc, cur)
    tmp.raw <- read_csv(paste(folder, url$filename, sep='/'), col_names=c('Date', 'Price','Quantity')) %>%
        mutate(Date = as.POSIXct(Date, origin="1970-01-01"),
               currency = sub('([^::A-Z::]+)(.*).csv','\\2',url$filename),
               exchange = sub('([^::A-Z::]+)(.*$)','\\1',url$filename))
    return(tmp.raw)
}