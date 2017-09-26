#' Download data
#' @importFrom R.utils gunzip
#' @export
download.data <- function(exc='kraken', cur='GBP', folder='.'){
    url <- get.url(exc, cur)
    download.file(url$url,paste(folder, url$names, sep='/'))
    cat('Extracting :', url$filename)
    gunzip(paste(folder, url$names, sep='/'), overwrite=TRUE)
}
