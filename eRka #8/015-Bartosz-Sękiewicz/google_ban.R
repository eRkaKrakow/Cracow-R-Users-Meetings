library(rvest)

ban <- function() {
    s <- html_session("http://www.google.com")
    search <- html_form(s)[[1]]
    search <- set_values(search, q = "eRkaKrakow") 
    s <- submit_form(s, search, submit = "btnG")
}

replicate(100, ban())
