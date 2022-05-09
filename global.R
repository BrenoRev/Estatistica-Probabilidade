library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(DT)
library(lubridate)

master_df <- read.csv('dados-weed.csv')
stocks_list <- c('HRVSF', 'GWPH', 'GTBIF', 'CURLF', 'CRON', 'CGC', 'APHA', 'ACB')


master_df$X <- NULL

master_df$Date <- strptime(master_df$Date, format='%Y-%m-%d')