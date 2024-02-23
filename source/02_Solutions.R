#--- Script details ------------------------------------------------------------
# Creation date: 10 February 2021
# Client:        client
# Project:       r-training
# Description:   Training
# Author:        Nick Twort

library(tidyverse)

#--- Import data ---------------------------------------------------------------

transit_lines <- read_csv("data/raw/transit_line_construction.csv")










#--- Calculate distribution of project length (in years) -----------------------
#--- Desired output - a table with one column a list of durations and another 
#--- which has the number of projects with that duration

# Convert end year to number
transit_lines <- transit_lines |>
  mutate(end_year_num = as.numeric(end_year))

# Which ones caused the NA error?
transit_lines |> filter(is.na(end_year_num))
## Looks like some of them had an 'X' for end year (presumably not finished yet!)

# What about start_year
transit_lines |> filter(is.na(start_year))

# Calculate distribution
transit_lines |>
  mutate(project_length_years = end_year_num - start_year) |> # project length
  group_by(project_length_years) |>
  summarise(count = n()) # count the number of rows for each project length
# Note 11 projects with 'NA' project length - either start or end year is missing

# A shortcut option
transit_lines |>
  mutate(project_length_years = end_year_num - start_year) |> # project length
  count(project_length_years) # same as group_by, summarise









#--- Calculate total cost by country -------------------------------------------

cost_by_country <- transit_lines |>
  group_by(country) |>
  summarise(total_expenditure_USD = sum(real_cost_USD))










#--- Column chart of total cost by country (top 10 countries) ------------------

cost_by_country_chart <- cost_by_country |>
  arrange(desc(total_expenditure_USD)) |> # sort by total
  head(10) |> # keep top 10 rows
  ggplot() + # create a ggplot
  geom_col(aes(x = country, y = total_expenditure_USD)) # column chart with country on the x-axis, $$$ on the y-axis

# Reorder
g <- cost_by_country |>
  arrange(desc(total_expenditure_USD)) |> # sort by total
  head(10) |> # keep top 10 rows
  ggplot() + # create a ggplot
  geom_col(aes(x = reorder(country, -total_expenditure_USD), y = total_expenditure_USD))

# Add colours
g <- cost_by_country |>
  arrange(desc(total_expenditure_USD)) |> # sort by total
  head(10) |> # keep top 10 rows
  ggplot() + # create a ggplot
  geom_col(aes(x = reorder(country, -total_expenditure_USD), y = total_expenditure_USD), fill = "#008698")
g

# Add title to x axis
g <- g + labs(x = "Country")
g

# Add y axis
g <- g + scale_y_continuous(
  name = "Total expenditure (USD)",
  breaks = seq.int(0, 1000000, 100000),
  minor_breaks = NULL,
  labels = scales::number_format(accuracy = 1, big.mark = ","),
  expand = expansion(mult = c(0, 0.01))
)
g

# Expand y limits
g <- g + expand_limits(y = 1000000)
g

# Theme
g <- g + theme_minimal(base_family = "Arial", base_size = 12)
g

# Tweak theme and add baseline
g <- g +
  geom_hline(yintercept = 0) +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(colour = "black", linewidth = 0.1)
  )


ggsave(filename = "figures/png/cost_by_country_chart.png",
       plot = g,
       width = 17.00,
       height = 8,
       units = "cm",
       bg = "transparent"
)

