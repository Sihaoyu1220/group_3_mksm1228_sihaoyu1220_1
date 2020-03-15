# Effect of Airbnb on Vancouver

This is a group project by Team Project 3 members, @mksm1228 and @sihaoyu1220, for the 2019-2020 STAT547M session. 

## Dataset

We will be utilizing the Vancouver listings dataset which contains summary information and metrics for listings in Vancouver generated by Inside Airbnb. The data was sourced from publicly available information from the official Airbnb site. It has been analyzed, cleaned and aggregated by Inside Airbnb. 

## Research Question

Which factors are most likely to influence the price of Airbnb listings in Canadian cities? 

## Usage

1. Clone this repository.

2. Check the contents of each folder and read all READMEs.

3. Ensure the following packages are installed:
- ggplot2
- here
- tidyverse
- corrplot
- data.table
- knitr
- broom
- testthat

4. Run the following scripts (in order) **with** the appropriate arguments specified.

```r
1. USE GNU MAKE  
if < > is used , this means that multiple options can be inputted. 

# clean all the folders
make clean

# Restore all the files
make all

2. USE GNU MAKE ON INDIVIDUAL ITEMS
# download the data
make Data/<Canadian city.csv> 
For example: make Data/Montreal.csv

# run exploratory data analysis
make Images/<image.png> 
For example: make Images/Number_of_listings.png

# linear regression analysis
make RDS/step_lm.rds

# linear regression plot
make Images/Model_Diagnostics.png

# knit report to html or pdf
make Docs/Final_Report.html 
make Docs/Final_Report.pdf

3. RUN EACH RSCRIPT INDIVIDUALLY
# load all data
Rscript Scripts/load_data.R --data_url=http://data.insideairbnb.com/canada/ --city=Canada

# access cleaned data
Rscript Scripts/clean_data.R --path=Data --filename=cleaned_data

# explorating data analysis
Rscript Scripts/EDA.R --data_path=Data/cleaned_data.csv --image_path=Images

# perform linear regression
Rscript Scripts/linear_regression.R --datafile=cleaned_data.csv

# knitting to html or pdf
Rscript Scripts/knitting.R --file_name=Final_Report.Rmd --file_type=pdf/html
```
