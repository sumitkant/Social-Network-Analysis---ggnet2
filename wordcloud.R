library(tm)
library(SnowballC)
library(wordcloud)

# Loading testimonials
setwd("D:/Data Analyst/Own Data/Testimonials")
testimonials <- read.csv("Testimonial_Details.csv", header = T, stringsAsFactors = F)

# Selecting the user
PGPID <- "pgp31398"
userTM <- subset(testimonials, testimonials$PGP.ID == PGPID)

# Create Corpus
tmcorpus <- Corpus(VectorSource(testimonials$Testimonial))
tmcorpus <- tm_map(tmcorpus, PlainTextDocument)
tmcorpus <- tm_map(tmcorpus, removePunctuation)
tmcorpus <- tm_map(tmcorpus, removeWords, stopwords('english'))
tmcorpus <- tm_map(tmcorpus, removeWords, "you")
# Stemming
tmcorpus <- tm_map(tmcorpus, stemDocument)

# CREATING WORDCLOUD
wordcloud(tmcorpus, max.words = 100, random.order = FALSE)

