library(twitteR)
library(plyr)



# uzupełnić własne klucze twittera:
api_key <- "..................."
api_secret <- "..................."
access_token <- "..................."
access_token_secret <- "..................."
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)



# wyciągamy tweety zawierające jakieś słowo/wzorzec/hasztag etc.

szukany_wzorzec = "#Trump"

TwitterTweets <- searchTwitter(searchString = szukany_wzorzec, n=10000, lang = "en")

# tu przerabiamy listę na tabelkę danych
TwitterTweets2.df = do.call("rbind",lapply(TwitterTweets,as.data.frame))


# usuwamy słowo kluczowe, żeby nie psuło wyników:
tweets = gsub(szukany_wzorzec, "", TwitterTweets2.df[,1])

# bierzemy tylko same tweety i ID użytkowników jako nazwy próbek
corpus.table = cbind(tweets, TwitterTweets2.df[,11])



###############################################
###############################################
# topic modeling
###############################################


library(mallet)
library(wordcloud)

# ważny jest plik ze stoplistą, umieszczony w katalogu roboczym;
# w załączniku przesyłam dwie stoplisty: en.txt i pl.txt


mallet.instances = mallet.import(id.array = corpus.table[,1], 
         text.array = corpus.table[,2], stoplist.file = "en.txt",
         token.regexp = "[A-Za-zĄĘÓŚŁŻŹĆŃąęóąśłżźćń]+")
         
         

# najważniejszy parametr: lista słowozbiorów
# w normalnych (tj. dużych) zbiorach danych ma sens dawać >50 słowozbiorów
no.of.topics = 10


# create a topic trainer object
topic.model = MalletLDA(num.topics = no.of.topics)

# load the texts/samples
topic.model$loadDocuments(mallet.instances)

# get the vocabulary, and some statistics about word frequencies
vocabulary = topic.model$getVocabulary()
word.freqs = mallet.word.freqs(topic.model)


# optimize hyperparameters every 20 iterations, after 50 burn-in iterations.
topic.model$setAlphaOptimization(20, 50)

# train a model. Note that hyperparameter optimization is on, by default.
# We can specify the number of iterations. Here we'll use a large-ish round number.
topic.model$train(200)

# NEW: run through a few iterations where we pick the best topic for each token,
# rather than sampling from the posterior distribution.
topic.model$maximize(10)

# Get the probability of topics in documents and the probability of words in topics.
# By default, these functions return raw word counts. Here we want probabilities,
# so we normalize, and add "smoothing" so that nothing has exactly 0 probability.
doc.topics = mallet.doc.topics(topic.model, smoothed=T, normalized=T)
topic.words = mallet.topic.words(topic.model, smoothed=T, normalized=T)

# now, add words' IDs and samples' IDs to both tables
colnames(topic.words) = vocabulary
# names of the samples
rownames(doc.topics) = corpus.table[,2]
# names of the topics: actually, simple numeric IDs
colnames(doc.topics) = 1:length(doc.topics[1,])

         
         
   


############## Eksploracja danych

# wydobywa N najważniejszych słów ('no.of.words') dla słowozbioru X ('topic.id')
no.of.words = 10
topic.id = 1
current.topic = sort(topic.words[topic.id,], decreasing = T)[1:no.of.words]

# chmura słów z zadanego słowozbioru:
wordcloud(names(current.topic),current.topic, random.order = FALSE, rot.per = 0)