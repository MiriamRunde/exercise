# Set-up your script ------------------------------------------------------

# install.packages(c("tidyverse", "gapminder", "pacman")) # uncomment if already installed
pacman::p_load(tidyverse, gapminder)

data(gapminder)
head(gapminder)


gapminder_clean <- gapminder %>% 
  rename(life_exp = lifeExp, gdp_per_cap = gdpPercap) %>% 
  mutate(gdp = pop * gdp_per_cap)

gapminder_c_am <- filter(gapminder_clean, continent == "Americas")

gapminder_c_am <- gapminder_c_am %>% 
  mutate(wealth = ifelse(gdp_per_cap >= 5000, "rich","poor"))
          
