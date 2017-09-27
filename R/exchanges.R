#' List all exchanges
#' @importFrom magrittr "%>%"
#' @export
exchanges <- function(cur=FALSE){
  if(is.character(cur)){
      return(files%>%filter(currency==cur)%>%.$exchange)
  }else{
      return(unique(files$exchange))
  }

}

#' List all currencies
#' @importFrom magrittr "%>%"
#' @export
currencies <- function(exc=FALSE){
    if(is.character(exc)){
        return(files%>%filter(exchange==exc)%>%.$currency)
    }else{
        return(unique(files$currency))
    }

}
