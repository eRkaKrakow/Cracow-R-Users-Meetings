library(rvest)
library(downloader)

setwd("I:/kolejki NFZ")

log <- vector()

link <- "http://kolejki.nfz.gov.pl/Informator/PobierzDane/Index/"
s <- html_session(link)

lista_id <- html_nodes(s, ".hashcode") %>% html_text(trim=FALSE)

for (id in lista_id) {
    s <- html_session(paste0("http://kolejki.nfz.gov.pl/Informator/PobierzPlikXLS?term=", id))
    fn <- paste0(gsub("[a-zA-Z;]{0,} filename=", "", s$response$headers$`content-disposition`), ".zip")
    yr <- substr(fn, 4, 7)
    mo <- substr(fn, 8, 9)
    
    if (!dir.exists(paste0("baza-plikow/", yr, " ", mo))) {
        dir.create(paste0("baza-plikow/", yr, " ", mo), recursive = TRUE)
    }
    
    if (!file.exists(paste0("baza-plikow/", yr, " ", mo, "/", fn))) {
        downloader::download(s$url, paste0("baza-plikow/", yr, " ", mo, "/", fn), mode = "wb", quiet = TRUE)
        log <- c(log, paste0("Pobrano plik: baza-plikow/", yr, " ", mo, "/", fn))
        
    } else {
        log <- c(log, paste0("Plik został już wcześniej pobrany: baza-plikow/", yr, " ", mo, "/", fn))
    }
}

write.table(as.data.frame(lista_id), paste0("baza-plikow/", yr, " ", mo, "/lista_id.csv"), row.names = F, col.names = FALSE)

log <- c(log, "KONIEC")

print(log)
