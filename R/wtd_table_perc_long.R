wtd_table_perc_long <- function(d, grp = NULL, col, weight = NULL, decimal = NULL) {
  d %>%
    group_by_at(grp) %>%
    drop_na({{col}}) %>%
    count({{col}}, wt = {{weight}}) %>%
    mutate(perc = 100 * n / sum(n)) %>%
    ungroup() %>% select(-n) %>%
    mutate_if(is.numeric, round, {{decimal}})
}
