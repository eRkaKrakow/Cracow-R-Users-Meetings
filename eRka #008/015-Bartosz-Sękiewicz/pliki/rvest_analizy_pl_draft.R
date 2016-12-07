library(rvest)     # biblioteka do scrapowania stron
library(stringi)   # biblioteka do obsługi napisów
library(dplyr)     # biblioteka do obsługi tabel danych


# Cel - pobranie tabel danych z poniższych linków: ------------------------

# https://www.analizy.pl/fundusze/fundusze-inwestycyjne/notowania
# https://www.analizy.pl/fundusze/fundusze-zagraniczne/notowania
# https://www.analizy.pl/fundusze/ubezpieczeniowe-fundusze-kapitalowe/notowania
# https://www.analizy.pl/fundusze/otwarte-fundusze-emerytalne/notowania
# https://www.analizy.pl/fundusze/produkty-strukturyzowane/produkty



# DRAFT - Fundusze inwestycyjne -------------------------------------------

# Po zabawie z filtrowaniem, ilością wyświetlanych wyników itp. otrzymujemy pełny
# link do analizowanej strony:

link <- "https://www.analizy.pl/fundusze/fundusze-inwestycyjne/notowania/firma/--/produkt/--/grupa/--/nazwa/--/typ-jednostki/--/typ/--/data/--/limit/100/strona/1/sort/1/sort_dir/ASC/"

s <- read_html(link) # pobieramy zawartość strony

html_nodes(s, "table") # bez wchodzenia w szczegóły strony, sprawdzamy jakie
                       # ona zawiera elementy będące tablicami

# To co nas interesuje ma identyfikator 'noteTable' - spróbujmy pobrać jej zawartość

notowania <- s %>% # dane wejściowe
    # odwołujemuy się do elementu z id = noteTable
    # jest to tablica zawierająca znacznik nagłówka thead i wartości tbody
    
    # niestety zostało tutaj zastosowane małe oszystwo :(
    
  html_node("#noteTable tbody") %>%
    # konwertujemy to na tabele
  html_table()

    # pierwsza kolumna jest pusta ponieważ są to obrazki, dla których ważny jest kolor
    # okazuje się, że wystarczy pobrać wartość atrybutu title

notowania[,1] <- s %>% 
  html_nodes("#noteTable tbody .segment img") %>% 
  html_attr("title")
    
    # czwarta kolumna może okazać się tą zaporową, bo wartości zostały wrzucone jako obrazki sic!
    # to bardzo ciężki problem o ile nie ma się jakiejś komercyjnej wersji OCRa

notowania[,4] <- s %>% 
  html_nodes("#noteTable tbody .jedn img") %>% 
  html_attr("src") %>% 
  paste0("https://www.analizy.pl", .)

# Nasza tabela nie posiada nazwanych kolumn, pobierzmy te informacje...

notowania_naglowek <- s %>% # dane wejściowe
    # odwołujemuy się do elementu z id = noteTable
    # thead jest nagłówkiem i to jeszcze dwuwierszowym
  html_nodes("#noteTable thead tr") %>%
    # interesuje nas ostatni wiersz
  .[[length(.)]] %>%
    # rozbijamy na kolumny
  html_nodes("th") %>%
    # pobieramy wartość znacznika th
  html_text()

notowania_naglowek[1] <- "segment" # uzupełniamy pustą wartość

names(notowania) <- notowania_naglowek

# Naprawmy jeszcze kodowanie

names(notowania) <- repair_encoding(names(notowania)) %>% stri_trim_both()
notowania$fundusz <- repair_encoding(notowania$fundusz)







# Fajnie, ale przecież to tylko 100 pierwszych wyników!? ------------------

# Ponieważ metoda komunikacji z podstronami jest bardzo prosta - zmienna
# przekazywana przez link, wystarczy znać liczbę iteracji jakie chcemy wykonać

link <- "https://www.analizy.pl/fundusze/fundusze-inwestycyjne/notowania/firma/--/produkt/--/grupa/--/nazwa/--/typ-jednostki/--/typ/--/data/--/limit/100/strona/1/sort/1/sort_dir/ASC/"

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
    
    link <- paste0("https://www.analizy.pl/fundusze/fundusze-inwestycyjne/notowania/firma/--/produkt/--/grupa/--/nazwa/--/typ-jednostki/--/typ/--/data/--/limit/100/strona/",i,"/sort/1/sort_dir/ASC/")
    
    s <- read_html(link) # pobieramy zawartość strony
    
    # Kopiujemy nasz kod, już bez komentarzy
    
    notowania <- s %>% 
        html_node("#noteTable tbody") %>%
        html_table()
    
    notowania[,1] <- s %>% 
        html_nodes("#noteTable tbody .segment img") %>% 
        html_attr("title")

    notowania[,4] <- s %>% 
        html_nodes("#noteTable tbody .jedn img") %>% 
        html_attr("src") %>% 
        paste0("https://www.analizy.pl", .)
    
    notowania_naglowek <- s %>% 
        html_nodes("#noteTable thead tr") %>%
        .[[length(.)]] %>%
        html_nodes("th") %>%
        html_text()
    
    notowania_naglowek[1] <- "segment"
    
    names(notowania) <- notowania_naglowek
    
    notowania_all <- bind_rows(notowania_all, notowania)    
    
    p$pause(0.1)$tick()$print()
}

# I jeszcze naprawiamy kodowanie...

names(notowania_all) <- repair_encoding(names(notowania_all)) %>% stri_trim_both()
notowania_all$fundusz <- repair_encoding(notowania_all$fundusz)

# można zapisać w txt, csv, xls czy xlsx (pakiet openxlsx)