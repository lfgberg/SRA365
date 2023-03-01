# Setup libaries and data
library(foreign)
hw5.data = read.csv("hw5-1.csv", header = TRUE)

# Does app_packets predict freq
hw5.reg1 = lm(freq ~ app_packets, data = hw5.data)
summary(hw5.reg1)

# Does remote_ips predict dns_query_times
hw5.reg2 = lm(dns_query_times ~ remote_ips, data = hw5.data)
summary(hw5.reg2)

# Can tcp_conversion_exchange predict content_length
hw5.reg3 = lm(content_length ~ tcp_conversation_exchange, data = hw5.data)
summary(hw5.reg3)

# Does app_packets predict dns_query_times
hw5.reg4 = lm(dns_query_times ~ app_packets, data = hw5.data)
summary(hw5.reg4)

#predict dns if ip was 50
hw5.prediction1 = predict(hw5.reg4, data.frame(app_packets = 50), interval = "prediction", level = .85)

# 85% interval for the range of the mean when ip is 70
hw5.prediction2 = predict(hw5.reg4, data.frame(app_packets = 70), interval = "confidence", level = .85)
