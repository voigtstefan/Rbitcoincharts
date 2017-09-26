# Rbitcoincharts
R Interface to work with bitcoincharts.com data

[Bitcoincharts](https://bitcoincharts.com/) provides financial and technical data related to the Bitcoin network. The publicly available *API* provides Bitcoin trade data from more than 90 Crypto-Exchanges and more than 50 different fiat currency pairs. 

The scripts in this repository allow to download market data from bitcoincharts, unzip the files and read-in the data based on dplyr. 

# Usage
**Warning: Do not run the data_crawler unnecessary often, bitcoincharts requires users to restrict data requests to maximal once per 15 minutes!**

You can easily download the source files as a complete package in *R*:

    # install.packages(devtools)
    devtools::install_github('voigtstefan/Rbitcoincharts')
    
    
The package provides you with two easy to use functions:
  - `download.data` downloads data directly from bitcoincharts.com. Required arguments are the exchange `exc` and the fiat currency `cur`. In addition you specify a folder `folder` where the data should be stored. The data is downloaded as a zipped file. Download data unzips the files directly and stores everything as a `data.frame` in a `.csv` file.
  - `read.btc` reads-in the downloaded files as a tibble which you can easily work with. 
  
  Example: 
  
     library(Rbitcoincharts)
     download.data(exc='kraken', cur='GBP', folder='.')
     data <- read.btc(exc='kraken', cur='GBP', folder='.')
  
The result is a tibble which contains more than 24.000 trades completed at Kraken and exchaning British Pound to (or from) BTC.  
     data
     # A tibble: 24,715 x 5
                  Date    Price   Quantity currency exchange
                <dttm>    <dbl>      <dbl>    <chr>    <chr>
      1 2017-06-11 10:06:21 2050.810 0.04757535      GBP   kraken
      2 2017-06-11 10:07:40 2030.992 0.00042465      GBP   kraken
      3 2017-06-11 10:10:59 2119.799 0.04710000      GBP   kraken
      4 2017-06-11 10:13:26 2098.138 0.00403974      GBP   kraken
      5 2017-06-11 10:13:26 2119.799 0.12422383      GBP   kraken
      6 2017-06-11 10:13:26 2119.800 0.07173643      GBP   kraken
      7 2017-06-11 10:17:27 2089.218 0.00545386      GBP   kraken
      8 2017-06-11 10:21:57 2057.381 0.00904145      GBP   kraken
      9 2017-06-11 10:46:33 2086.150 0.01650943      GBP   kraken
      10 2017-06-11 10:59:19 2119.800 0.02826357      GBP   kraken
      # ... with 24,705 more rows
