#WordCloud code for Natural Language Processing example

install.packages('wordcloud')
install.packages('RColorBrewer')
library(tm)
library(twitteR)
library(wordcloud)
library(RColorBrewer)
#library(e1071)
library(class)
ckey <- ('oBYz0DjSL8ohSwOE3JppvmDVb')
print(ckey)
cskey <- ('VlmU4Yzm7yUn3XFm8JfGmdvf14PILGsz0ycS8uvWP8ea3rSmOA')
atoken <- ('2547771526-KeSXeN3rvY1O52E3myUiNQadJCTozcKbNPZHbuW')
astoken <- ('d343GgbJa4wOIiKLAPZkpczkJtvH1XMx7qIynbIvbOjgj')

setup_twitter_oauth(ckey, cskey, atoken, astoken)
soccer.tweets <- searchTwitter('soccer',n=2000,lang = 'en')
soccer.text <- sapply(soccer.tweets, function(x) x$getText())
soccer.text <- iconv(soccer.text,'UTF-8','ASCII')
soccer.corpus <- Corpus(VectorSource(soccer.text))
term.doc.matrix <- TermDocumentMatrix(soccer.corpus,
                                      control=list(removePunctuation = TRUE,
                                                                 stopwords = c("soccer","http", stopwords("english")),
                                                                 removeNumbers = TRUE,tolower = TRUE))


head(term.doc.matrix)
term.doc.matrix <- as.matrix(term.doc.matrix)

word.freqs <- sort(rowSums(term.doc.matrix), decreasing=TRUE) 
dm <- data.frame(word=names(word.freqs), freq=word.freqs)

wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))
