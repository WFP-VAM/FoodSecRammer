
wtd_table_perc_wide <- function(d, grp = NULL, col, weight = NULL) {
  d %>%
    group_by_at(grp) %>%
    drop_na({{col}}) %>%
    count({{col}}, wt = {{weight}}) %>%
    mutate(Percentage = 100 * n / sum(n)) %>%
    ungroup() %>% select(-n) %>%
    pivot_wider(names_from = {{col}},
                values_from = Percentage,
                values_fill =  0)
}


