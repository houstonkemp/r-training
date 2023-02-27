#--- Script details ------------------------------------------------------------
# Creation date: 28 February 2023
# Client:        Internal
# Project:       r-training
# Description:   Training
# Author:        Nick Twort

library(tidyverse)

#--- Import data ---------------------------------------------------------------

transit_lines <- read_csv(XXXXXXXXXXXXXXXX)










#--- Calculate distribution of project length (in years) -----------------------

# 
transit_lines_2 <- transit_lines %>%
  mutate(end_year = XXXXXXXXXXXXXXXXXX)

# Calculate distribution
transit_lines_2 %>%
  mutate(project_length_years = XXXXXXXXXXXXXXXXXX) %>% # project length
  group_by(XXXXXXXXXXXXXXXXXX) %>%
  summarise(XXXXXXXXXXXXXXXXXX) # count the number of rows for each project length

# A shortcut option
transit_lines_2 %>%
  mutate(project_length_years = XXXXXXXXXXXXXXXXXX) %>% # project length
  XXXXXXXXXXXXXXXXXX(project_length_years) # same as group_by, summarise









#--- Calculate total cost by country -------------------------------------------

cost_by_country <- transit_lines %>%
  XXXXXXXXXXXXXXXXXX(XXXXXXXXXXXXXXXXXX) %>%
  XXXXXXXXXXXXXXXXXX(XXXXXXXXXXXXXXXXXX)










#--- Column chart of total cost by country (top 10 countries) ------------------

cost_by_country_chart <- cost_by_country %>%
  arrange(XXXXXXXXXXXXXXXXXX) %>% # sort by total
  head(10) %>% # keep top 10 rows
  ggplot() + # create a ggplot
  geom_col(XXXXXXXXXXXXXXXXXX) # column chart with country on the x-axis, $$$ on the y-axis








ggsave(filename = "figures/cost_by_country_chart.png",
       plot = cost_by_country_chart,
       width = 17.00,
       height = 8,
       units = "cm",
       bg = "transparent"
)
