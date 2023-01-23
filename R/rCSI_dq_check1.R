rCSI_dq_check1 <- function(d){
  data %>%
    drop_na() %>%
    ggplot(aes(x=as.factor(EnuName),y=rCSI, color=as.factor(EnuName))) +
    geom_boxplot()+
    geom_jitter(width=0.15) +theme_minimal() +labs(y= "rCSI", x = "enumerator code") +theme(legend.position = "none") +
    ggtitle(label = "rCSI Data Quality Check #1",subtitle = "Box and jitter plot of rCSI values by Enumerator")
}
