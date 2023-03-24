# Read in data and libraries
library(foreign)
library(leaps)
library(car)

hw7.data = read.csv("hw7-1.csv", header = TRUE)

# which variables best predict freq?
bestsubsets = regsubsets(freq ~ content_length + tcp_conversation_exchange 
                         + remote_ips + app_packets + dns_query_times, data = hw7.data, nbest = 1)
subsets(bestsubsets, statistic = "adjr2")

# Create 5 different regression models
hw7.reg1 = lm(freq ~ dns_query_times, data = hw7.data)
summary(hw7.reg1)
hw7.reg2 = lm(freq ~ dns_query_times + remote_ips, data = hw7.data)
summary(hw7.reg2)
hw7.reg3 = lm(freq ~ dns_query_times + remote_ips + app_packets, data = hw7.data)
summary(hw7.reg3)
hw7.reg4 = lm(freq ~ dns_query_times + remote_ips + app_packets + content_length, data = hw7.data)
summary(hw7.reg4)
hw7.reg5 = lm(freq ~ dns_query_times + remote_ips + app_packets + content_length + tcp_conversation_exchange, data = hw7.data)
summary(hw7.reg5)

# eval model 5 for multicollinearity
cor(hw7.data[, c("dns_query_times", "remote_ips", "app_packets", "content_length", "tcp_conversation_exchange")]) # .8 or higher is bad

# vif for each
vif(hw7.reg5) # greater than 10 is concerning
1/vif(hw7.reg5) # tolerance - lower than .2 is sus lower than .1 is bad bad
