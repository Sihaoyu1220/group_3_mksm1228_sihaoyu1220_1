# Effect of Airbnb on Vancouver

This is a group project by Team Project 3 members, @mksm1228 and @sihaoyu1220, for the 2019-2020 STAT547M session. 

## Dataset

We will be utilizing the Vancouver listings dataset which contains summary information and metrics for listings in Vancouver generated by Inside Airbnb. The data was sourced from publicly available information from the official Airbnb site. It has been analyzed, cleaned and aggregated by Inside Airbnb. 

## Research Question

Which factors are most likely to influence the price of Airbnb listings in Canadian cities? 

## Usage

1. Clone this repository.

2. Read all the README.md.

3. Ensure the following packages are installed:
- ggplot2
- here
- tidyverse
- corrplot
- data.table
- knitr

4. Run the following scripts (in order) **with** the appropriate arguments specified 

```r
# load all data
Rscript Scripts/load_data.R --data_url=http://data.insideairbnb.com/canada/ --city=Canada

# access cleaned data
Rscript Scripts/clean_data.R --path=Data --filename=cleaned_data

# explorating data analysis
Rscript Scripts/EDA.R --data_path=Data/cleaned_data.csv --image_path=Images

# knitting to html or pdf
Rscript Scripts/knitting_script.R --file_name=<file_name> --file_type=<file_type>
```