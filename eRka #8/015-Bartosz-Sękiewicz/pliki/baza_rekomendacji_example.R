library(stringi)
library(rvest)

link <- "http://www.scottishmedicines.org.uk/SMC_Advice/Advice/Abacavir__Ziagen_/Abacavir_300mg_tablets__Ziagen__"
s <- html_session(link)

rekomendacje <- data.frame(stringsAsFactors = FALSE)

tabela <- s %>% 
    html_nodes("#mainContent table") %>% 
    .[[1]] %>% 
    html_table(fill = T, trim = TRUE)

names(tabela) <- c("id", "value")

tabela$id <- tabela$id %>%
    stri_trans_tolower %>%
    stri_replace_all_regex("[^[a-z0-9- ]]", "") %>%
    stri_trim_both %>%
    stri_replace_all_fixed(" ", "_") %>%
    paste0("field_", .)

for (i in seq_along(tabela$id)) { #i<-1
    rekomendacje[1, tabela$id[i]] <- tabela$value[i]
}