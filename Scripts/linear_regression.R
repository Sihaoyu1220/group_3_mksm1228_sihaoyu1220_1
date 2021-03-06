"This is a script that will perform a linear regression on the dataset provided.
Please input the file you wish to perform a linear regression on.
Usage: linear_regression.R --datafile=<datafile>
"-> doc

suppressMessages(library(tidyverse))
library(docopt)
suppressMessages(library(testthat))

opt <- docopt(doc) 

main <- function(datafile) {
  
  test_that("datafile is a string",{
    expect_true(is.character(datafile))
  })
  
  data <- read.csv(here::here("Data",datafile))
  data1 <- data %>% 
    group_by(city) %>% 
    filter(!is.na(price)) %>% 
    mutate(limitmin = quantile(price,c(0.25)) - 1.5 * (quantile(price,c(0.75))-quantile(price,c(0.25)))) %>% 
    mutate(limitmax = quantile(price,c(0.75)) + 1.5 * (quantile(price,c(0.75))-quantile(price,c(0.25)))) %>% 
    filter(price >= limitmin & price <= limitmax)
  levels(data1$cancellation_policy)[4] <- "strict"
  levels(data1$cancellation_policy)[4] <- "super_strict"
  levels(data1$cancellation_policy)[5] <- "super_strict"
  full.lm <- lm(price~host_is_superhost+city+room_type+accommodates+bathrooms+bedrooms+cancellation_policy, data=data1)
  suppressMessages(step.lm <- step(full.lm,trace=0))
  saveRDS(step.lm, here::here("RDS","step_lm.rds"))
  summary(full.lm)
  test_that("model saved",{
    expect_true(file.exists(here::here("RDS", "step_lm.rds")))
  })
  
  png(here::here('Images','Model_Diagnostics.png'))
  par(mfrow = c(2, 2))
  plot(step.lm)
  dev.off()
  
  test_that("model diagnostics saved",{
    expect_true(file.exists(here::here("Images", "Model_Diagnostics.png")))
  })
  
  message("Successfully exported the model object to RDS folder and images to Images folder!")
  }

#' Perform linear regression
#' @param datafile is the path to load cleaned_data

main(opt$datafile)




