# Crawles all available files and extracts available exchanges and currencies
library(tidyverse)
files.raw <- read_csv(url('http://api.bitcoincharts.com/v1/csv/'), col_names='Files')
files<-files.raw %>%
    mutate(names= sub("(<a href=\")(.*)(\">.*)", "\\2", Files))%>%
    select(-Files)%>%
    filter(grepl('csv.gz',names))%>%
    mutate(url = paste0('http://api.bitcoincharts.com/v1/csv/',names),
           filename = sub('.gz$','',names),
           currency = sub("^.*(...)\\.(.*$)","\\1", filename),
           exchange = sub("(^.*)(...)\\.(.*$)","\\1", filename))

devtools::use_data(files, overwrite=TRUE)


