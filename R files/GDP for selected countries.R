library(readxl)
library(tidyverse)
library(magrittr)
library(janitor)
library(ggplot2)
library(dplyr)
library(ggiraph)
GDP_data=read_excel("API_NY.GDP.MKTP.CD_DS2_en_excel_v2_4334130.xls")
GDP_data %<>% select(1, 5:66)
GDP_data <- GDP_data[-c(1,2),]
GDP_data <- t(GDP_data)

data <- as.tibble(GDP_data)

data %<>%
  row_to_names(row_number = 1)

colnames(data)[1] <- "Years"

data <- sapply(data, as.numeric)

data <- as.tibble(data)

datum <- data %>% select(Years, Germany, Japan, `United States`)

colors <- c("Japan"="red", "Germany"="orange", "United States"="black")
g <- ggplot(datum, aes(x=Years)) +
  geom_line(aes(y=Japan,color="Japan")) +
  geom_line(aes(y=Germany,color="Germany")) +
  geom_line(aes(y=`United States`,color="United States")) +
  geom_point(aes(y=Japan),shape=21, color="black", fill="lightblue", size=1)+
  geom_point(aes(y=Germany),shape=21, color="black", fill="pink", size=1)+
  geom_point(aes(y=`United States`),shape=21, color="black", fill="grey", size=1) +
  ylab("GDP") +
  ggtitle("GDP of countries over the years") +
  theme(legend.position="right", plot.title = element_text(hjust=0.5)) +
  labs(color = "Country") +
  scale_color_manual(values = colors)
g
