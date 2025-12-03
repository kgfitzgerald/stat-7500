library(rvest)
library(tidyverse)

birth_file <- "https://www.ssa.gov/oact/babynames/numberUSbirths.html"

birth_file |>
  read_html() |>
  html_nodes("table") |>
  pluck(1) |>
  html_table()

statepop_file <- "https://simple.wikipedia.org/wiki/List_of_U.S._states_by_population"

statepop_file |>
  read_html() |>
  html_nodes("table") |>
  pluck(1) |>
  html_table() |> 
  names()

statepop <- statepop_file |>
  read_html() |>
  html_nodes("table") |>
  pluck(1) |>
  html_table() |>
  select(3,4,8)

names(statepop) <- c("state", "pop_2019", "pop_per_electoral_vote")

saveRDS(statepop, "data/statepop.RDS")
