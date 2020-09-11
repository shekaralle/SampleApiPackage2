#' Calls and API
#'
#' This function wil lcheck if we already have the result in environment and will return the result and if not present it will fetch from the API
#' @param URL URL string
#' @return Status Code like 200,404
#' @export
#' @examples
#' apiCall2("http://api.open-notify.org/astros.json")


require(httr)
require(jsonlite)

apiCall2 <- function(URL) {

  if(exists("res")){
    if(res$status_code==200)
    {
      print('Result is already present in environment, below is the result')
      print(paste('API call successful with status code:',res$status_code))
      # data <- rawToChar(res$content)
      data <- fromJSON(rawToChar(res$content))
      data$people
      return(as.integer(res$status_code))
    } else {
      print(paste('API call was not successful with status code:',res$status_code))
      return(as.integer(res$status_code))
    }
  }
  else{
    res<<-GET(URL)
  if(res$status_code==200)
  {
    print('Result is not present in environment, so it will be fetched from the API and below is the result')
    print(paste('API call successful with status code:',res$status_code))
    # data <- rawToChar(res$content)
    data <- fromJSON(rawToChar(res$content))
    data$people
    return(as.integer(res$status_code))
  } else {
    print(paste('API call was not successful with status code:',res$status_code))
    return(as.integer(res$status_code))
  }
  }

}



