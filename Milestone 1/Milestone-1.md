Airbnb predictive pricing tool for tourists coming to Canada
================

  - [Introduction](#introduction)
  - [Data Description](#data-description)
  - [Exploring the Dataset](#exploring-the-dataset)
  - [Research Question](#research-question)
  - [Plan of Action](#plan-of-action)
  - [References](#references)

## Introduction

According to Statistics Canada, a recording breaking **22.1 million
international tourists from abroad visited Canada in 2019.** Hotels have
always been the mainstay for accommodations but the prices can be
unaffordable for visitors looking to stay long-term for tourism or work.
Airbnb was founded in 2008 and has since been proven to be a successful
online platform to match hosts with unused space with guests looking for
an affordable place to lodge. Although it is often more affordable than
hotels, Airbnb does not have a direct effect on the prices of lodging
offered by hosts and leaves the hosts to decide the prices. In this
analysis, we want to investigate which factors, ranging from the
location of the listing to the number of bathrooms, are most likely
influencing the price of Airbnb listings for cities in Canada. This
predicitive tool may potentially help travellers better understand the
reasoning behind the listed price of Canadian Airbnb listings.

## Data Description

``` r
data$id<-as.factor(data$id)
nlevels(data$id) 
```

    ## [1] 6181

There are 6181 listings.

``` r
data$host_id<-as.factor(data$host_id)
nlevels(data$host_id) #4261 hosts.
```

    ## [1] 4261

There are 4261 hosts.

Select useful variables.

``` r
data <- data %>% 
  select(id, host_id, host_is_superhost, host_listings_count, neighbourhood_cleansed, property_type, room_type, accommodates, bathrooms, bedrooms, beds, price, weekly_price, monthly_price, security_deposit, cleaning_fee, guests_included, extra_people, minimum_nights, maximum_nights, review_scores_rating)
```

## Exploring the Dataset

**Barplot**

``` r
barplot(table(data$room_type), main="Room Type Summary")
```

![](Milestone-1_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

**Scatterplot**

``` r
data$price <- as.numeric(gsub('[$,]', '', data$price))
plot(data$price, data$minimum_nights, main="Minimum Nights vs. Price", xlab="price", ylab="minimum nights")
```

![](Milestone-1_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

# Research Question

In this analysis, we aim to investigate the influence of various factors
on the price of Airbnb listings across various Canadian cities to see
which ones are most likely to impact the listed price.

# Plan of Action

We will first establish that the provided datasets by InsideAirbnb can
be utilized by thoroughly ensuring there is less than 5-10% of missing
data. Next, we will perform a linear regression analysis between the
price of the Airbnb listing and the various factors provided in the
datasets.

# References

<https://www150.statcan.gc.ca/n1/daily-quotidien/200221/dq200221b-eng.htm?indid=3635-2&indgeo=0>