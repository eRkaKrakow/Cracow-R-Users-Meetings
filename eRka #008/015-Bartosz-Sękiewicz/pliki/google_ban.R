library(rvest)

# To tylko próba... byłoby łatwiej siebie zbanować, gdyby wyszukiwane słowa były z sensem

ban <- function() {
    s <- html_session("http://www.google.com")
    search <- html_form(s)[[1]]
    search <- set_values(search, q = paste0(sample(letters, size = 15, replace = TRUE), collapse = "")) 
    s2 <- submit_form(s, search, submit = "btnG")
}

replicate(1000, ban())