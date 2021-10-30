---
title: "Tanımlayıcı İstatistik"
author: "Erkut Ergenç"
date: "30.10.2021"
output: 
  html_document:
    css: styles.css
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
# libraries
library(tidyverse)
library(ggplot2)
library(mosaic)
library(e1071)
require(tikzdevice)
theme_set(theme_classic())
```

## Temel İstatistik

*Kullanılan veri kümesi*
  ```{r}
veri <- read.csv('portakal.csv')
veri
# summary(veri)
```

**Ortalama (Mean)**
  ```{r veri}
mean(veri$portakal)
```

**Medyan (Median)**
  ```{r}
median(veri$portakal)
```

**Mod (Mode)**
  ```{r echo=FALSE}
# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
# Create the vector with numbers.
v <- c(veri$portakal)
# Calculate the mode using the user function.
mod <- getmode(v)
print(mod)
```

**Yüzde değer (Percentile)**
  ```{r}
quantile(veri$portakal, c(.32, .57, .98))
```

**Çeyrek değer (Quartile)**
  ```{r}
quantile(veri$portakal)
```

**Değişim aralığı (Range)**
  ```{r}
range(veri$portakal)
aralik <- max(veri$portakal) - min(veri$portakal)
print(aralik)
```

**Çeyrekler arası değişim aralığı (Interquartile range)**
  ```{r}
IQR(veri$portakal)
```

**Varyans (Variance)**
  ```{r}
var(veri$portakal)
```

**Standart sapma (Standard deviation)**
  ```{r echo=FALSE}
sd(veri$portakal)
```

**Değişkenlik katsayısı (Coefficient of variation)**
  ```{r}
# Create the function.
getdk <- function(d) {
  k <- 100*(sd(d)/mean(d))
}
d <- c(veri$portakal)
dk <- getdk(d)
print(dk)
```

**Çarpıklık (Skewness)**
  ```{r}
skewness(veri$portakal)
```

**z Değeri (z-Value)**
  ```{r}
zscore(veri$portakal)
```

**Frekans (Frequency)**
  ```{r}
hist(veri$portakal,plot = FALSE)
hist(veri$portakal)
```

**Stem-and-Leaf Plot**
  ```{r}
stem(veri$portakal)
```

**Plot**
  ```{r}
plot(veri$portakal[1:100],ylim=c(0,200))
abline(h = c(mean(veri$portakal),mean(veri$portakal)+sd(veri$portakal),mean(veri$portakal)-sd(veri$portakal),mean(veri$portakal)+2*sd(veri$portakal),mean(veri$portakal)-2*sd(veri$portakal)), col = c("red", "blue", "blue", "green", "green"))
```

**Box plot**
  ```{r}
boxplot(veri$portakal, horizontal=TRUE)
```

**Kovaryans**
  ```{r}
cov(veri$portakal,veri$portakal)
```

**Korelasyon Katsayısı**
  ```{r}
cor(veri$portakal,veri$portakal)
```

**Popülasyon**
  ```{r}
set.seed(1234)
df <- data.frame(
  agirlik=round(rnorm(1000, mean=110, sd=15))
)
summary(df)
ggplot(df, aes(x=agirlik)) + geom_histogram(binwidth=10)
```

