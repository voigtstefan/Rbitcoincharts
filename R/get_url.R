#' Find files
#' @importFrom magrittr '%>%'
#' @importFrom dplyr filter
#' @importFrom dplyr select

get.url <- function(exc = "kraken", cur = "USD") {
    url <- files %>% filter(cur == currency, exc == exchange) %>% select(url, names, filename)
    if (identical(url, character(0)))
        stop("Currency-Exchange Pair not available")
    return(url)
}
