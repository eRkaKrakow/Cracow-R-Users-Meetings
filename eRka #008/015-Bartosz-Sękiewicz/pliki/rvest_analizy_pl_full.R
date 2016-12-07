# Przenosimy to do funkcji, której parametrem wejściowym jest część zmienna linku

library(rvest)     # biblioteka do scrapowania stron
library(stringi)   # biblioteka do obsługi napisów
library(dplyr)     # biblioteka do obsługi tabel danych

strony <- list(
    fundusze_inwestycyjne = "fundusze-inwestycyjne/notowania/firma/--/produkt/--/grupa/--/nazwa/--/typ-jednostki/--/typ/--/data/--",
    fundusze_zagraniczne = "fundusze-zagraniczne/notowania/firma/--/produkt/--/grupa/--/nazwa/--/typ-jednostki/--/typ/--/data/--/waluta/--",
    ubezpieczeniowe_fundusze_kapitalowe = "ubezpieczeniowe-fundusze-kapitalowe/notowania/firma/--/produkt/--/grupa/--/nazwa/--/typ-jednostki/--/typ/--/data/--",
    otwarte_fundusze_emerytalne = "otwarte-fundusze-emerytalne/notowania/firma/--/produkt/--/grupa/--/nazwa/--/typ/--/data/--",
    produkty_strukturyzowane = "produkty-strukturyzowane/produkty/instytucja/--/rodzaj/--/nazwa/--"
)

pobierzNotowania <- function(x) {
    
    link_prefix <- "https://www.analizy.pl/fundusze/"
    link_sufix  <- function(x) paste0("/limit/100/strona/",x,"/sort/1/sort_dir/ASC/")
    link <- paste0(link_prefix, x, link_sufix(1))
    
    s <- read_html(link) 
    
    liczba_stron <- s %>%
        html_node("#pager_text") %>%
        html_attr("value") %>%
        stri_match_last_regex("[0-9]+") %>%
        as.numeric()
    
    # Definiujemy tabelę z sumarycznymi wynikami
    notowania_all <- data.frame(stringsAsFactors = FALSE)
    
    p <- progress_estimated(liczba_stron) # bardzo przydatna funkcja w przypadku
    # wielu wielu zapytań...
    
    for (i in 1:liczba_stron) {
        
        # Parametryzujemy adres
        link <- paste0(link_prefix, x, link_sufix(i))
        
        if (length(html_nodes(read_html(link), "#noteTable")) > 0) { # update na potrzeby funkcji
            s <- read_html(link) %>% html_nodes("#noteTable") %>% .[[1]]
        } else {
            s <- read_html(link) %>% html_nodes("#produktyTable") %>% .[[1]]
        }
        
        # Przenosimy nagłówek na początek z uwagi na różną pozycje kolumny z obrazkami
        
        notowania_naglowek <- s %>% 
            html_nodes("thead tr") %>%
            .[[length(.)]] %>%
            html_nodes("th") %>%
            html_text()
        
        notowania <- s %>% 
            html_node("tbody") %>%
            html_table()

        if (length(html_nodes(s, "tbody .segment img")) > 0) { # update na potrzeby funkcji
            notowania[,1] <- s %>% 
                html_nodes("tbody .segment img") %>% 
                html_attr("title")
            notowania_naglowek[1] <- "segment"
        }

        if (length(html_nodes(s, "tbody .jedn img")) > 0) {# update na potrzeby funkcji        
            notowania[,grepl("j.u.", notowania_naglowek)] <- s %>%   # update numeru kolumny na potrzeby funkcji
                html_nodes("tbody .jedn img") %>% 
                html_attr("src") %>% 
                paste0("https://www.analizy.pl", .)
        }
        
        names(notowania) <- notowania_naglowek
        
        notowania_all <- bind_rows(notowania_all, notowania)    
        
        p$pause(0.1)$tick()$print()
    }
    
    # I jeszcze naprawiamy kodowanie...
    
    names(notowania_all) <- repair_encoding(names(notowania_all)) %>% stri_trim_both()
    # update na potrzeby funkcji
    notowania_all[, grepl("fundusz|produkt", names(notowania_all))] <- repair_encoding(notowania_all[, grepl("fundusz|produkt", names(notowania_all))])
    
    notowania_all
}

results <- lapply(strony, pobierzNotowania)