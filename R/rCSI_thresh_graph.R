rCSI_thresh_graph <- function(d){
  data$ADMIN2Name <- to_factor(data$ADMIN2Name)
  data <- data %>% mutate(rCSI_CH = case_when(
    rCSI <= 3 ~ "Phase1",
    between(rCSI,4,18) ~ "Phase2",
    rCSI >= 19 ~ "Phase3"))
  #rCSI colors
  rCSI_colors = c("Phase1" = "#c6ffc7","Phase2" = "#ffe718","Phase3" = "#e88400")
  #FCG by Adm2
  rCSIphaseadm2table <- data %>% group_by(ADMIN2Name) %>%  count(rCSI_CH) %>% mutate(perc = 100 * n / sum(n)) %>% ungroup() %>% select(-n) %>% mutate_if(is.numeric, round, 1)
  rCSIadm2_barplot <- rCSIphaseadm2table %>% ggplot(aes(x=ADMIN2Name, y = perc, fill = rCSI_CH)) +geom_bar(position="fill", stat = "identity") +theme_minimal() +theme(axis.text.x = element_text(angle = 90)) +scale_fill_manual(values=rCSI_colors) +labs(x = "", y = "") +scale_y_continuous(labels = scales::percent)
  rCSIadm2_barplot +labs(title = "rCSI Thresholds by State", caption = "Data Source: Example Dataset January 2023", fill = "IPC thresholds")
}

