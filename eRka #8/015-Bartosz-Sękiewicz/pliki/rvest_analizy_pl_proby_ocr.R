# No dobra, ale bez wartości j.u. netto to nie ma sensu??????? :( ---------

# Jeżeli nie mamy żadnego komercyjnego OCR (najlepiej w wersji on-line) to
# sprawa nie jest przegrana... Po prostu będziemy scrapowali stronę on-line
# obsługującą takiego OCR za free. Ważne aby nie wymagała żadnej autoryzacji

# Minus jest taki, że trzeba będzie troche poczekać na wynik (trzeba dodać
# odpowiednie opóźnienia aby nie zostać zablokowanym)

# Dodatkowo strona może mieć limit zapytań na jakiś określony czas




# Funkcja wykorzystujaca OCR ze strony "http://www.free-ocr.com/"

OCR_png <- function(link_to_png){
    
    link <- "http://www.free-ocr.com/"
    
    s <- html_session(link)
    
    # Na stronie dostępny jest formularz, który wymaga zaczytania pliku,
    # lub podania do niego linku. Po kliknięciu przycisku 'START' zostaje
    # wysłane rządanie przez formularz i po kilku sekundach otrzymujemy wynik
    
    # POST vs GET - prezentacja
    
    form <- s %>% 
        # Jest tylko jeden znacznik formularza
        html_node("form") %>% 
        # Wczytujemy go jako obiekt formularza
        html_form()
    
    # Do pola userfile_url przypisujemy link do obrazka
    form <- set_values(form, userfile_url = link_to_png)
    
    # "Klikamy" na przycisk 'START'
    s <- submit_form(s, form, submit = "submit") 
    
    # Zabezpieczenie, gdyby poszło coś nie tak...
    
    if (s$response$status_code == 429) {
        return(link_to_png)
        break
    }
    
    # Opóźnienie...
    Sys.sleep(5) #TODO: potestować... na pewno przy <2 jest ban :)
    
    
    # Niestety żądanie nie jest wykonane natychmiastowo, dlatego
    # jeżeli robimy to z poziomu kodu to otrzymamy na naszej stornie
    # informacje o błędzie - z dużym prawdopodobieństwem
    
    s %>% html_node("body") %>% html_text()
    
    if (length(s  %>% html_nodes("#resultarea")) == 0) {
        
        # Jeżeli nie udało się jeszcze pobrać wyniku to musimy
        # odnaleźć link do wyniku
        
        temp <-  s %>% 
            html_nodes("body #wrap #content script") %>% 
            .[[2]] %>% 
            html_text() %>%
            stri_split_fixed("\n            ") %>%
            .[[1]] %>% .[3] %>%
            stri_match_first_regex("FW/result.php\\?name=[0-9a-z]+") %>%
            .[1] %>% paste0(link, .)
        
        s <- html_session(temp)
    }
    
    s  %>% html_nodes("#resultarea") %>% html_text() %>% as.numeric()
}

# Mały test :)

link_to_png <- "https://www.analizy.pl/fundusze/images/quotes/73dbed140062fa1d1ce36cb2ec53f3ed.png"
OCR_png(link_to_png)

# Sprawa nie jest przegrana jak mamy czas - np. ustawiamy pobieranie danych na noc
# Opóźnienie rzędu 5 sekund to tylko 12 wyników na minute, czyli 720 wyników na godzinę




# Roboczo...


# Symulacja przeglądarki : --------------------------------------------------

uastring <- "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.149 Safari/537.36"
s <- html_session(link, httr::user_agent(uastring))


# Można mocniej (tylko nie wiem, czy jeszcze to jest możliwe w R) -----------

# http://nessy.info/?p=119, czyli python i tor


# Symulacja przeglądarki na poważnie: ---------------------------------------

link_to_png <- "https://www.analizy.pl/fundusze/images/quotes/73dbed140062fa1d1ce36cb2ec53f3ed.png"

library('RSelenium')
checkForServer() # search for and download Selenium Server java binary.  Only need to run once.
startServer() # run Selenium Server binary
remDr <- remoteDriver(browserName="firefox", port=4444) # instantiate remote driver to connect to Selenium Server
remDr$open(silent=T) # open web browser
remDr$navigate("http://www.free-ocr.com/")
# ... dopracować


# TESSERACT -----------------------------------------------------------------

source("https://rawgit.com/greenore/initR/master/init.R")
packagesGithub(c("systemR", "ocR"), repo_name="greenore")

