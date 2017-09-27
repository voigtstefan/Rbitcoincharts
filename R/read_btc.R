#' Read bitcoinchart data
#' @param exc Exchange
#' @param cur Fiat money currency
#' @param file File name which links directly to saved files (use either a exc, cur pair **or** file)
#' @param folder path to folder where the data is saved
#' @importFrom readr read_csv
#' @importFrom dplyr mutate
#' @export

read.btc <- function(..., folder = ".") {
    args <- list(...)
    exist.exccur <- "exc" %in% names(args) && "cur" %in% names(args)
    exist.file <- "file" %in% names(args)
    if(exist.exccur){
        exc<-args$exc
        cur<-args$cur
        url <- get.url(exc, cur)
        tmp.raw <- read_csv(paste(folder, url$filename, sep = "/"), col_names = c("date", "price", "quantity")) %>%
            mutate(date = as.POSIXct(date, origin = "1970-01-01"), currency = sub("([^::A-Z::]+)(.*).csv", "\\2", url$filename),
                   exchange = sub("([^::A-Z::]+)(.*$)", "\\1", url$filename))
        return(tmp.raw)
    }else if(exist.file){
        file <- args$file
        tmp.raw <- read_csv(paste(folder, file, sep = "/"), col_names = c("date", "price", "quantity")) %>%
            mutate(date = as.POSIXct(date, origin = "1970-01-01"), currency = sub("([^::A-Z::]+)(.*).csv", "\\2", file),
                   exchange = sub("([^::A-Z::]+)(.*$)", "\\1", file))
        return(tmp.raw)
    }else{
        stop('Wrong input: Provide either Currency // Exchange Pair or File')
    }
}
