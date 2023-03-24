# Read in data and libraries
library(foreign)
library(leaps)
library(car)

hw7.data = read.csv("hw7-1.csv", header = TRUE)

# which variables best predict freq?
bestsubsets = regsubsets(freq ~ content_length + tcp_conversation_exchange 
                         + remote_ips + app_packets + dns_query_times)
subsets(bestsubsets, statistic = "adjr2")