# Loading data
testi <- read.csv("testimonials.csv")
source('drawnetwork.R')

# Joining First Names and Last Names
testi$Name <- paste(testi$PGP_Fname, testi$PGP_Lname, sep =" ")
testi$FriendName <- paste(testi$Friend_Lname, testi$Friend_Fname, sep  = " ") 
names(testi)
testi <- testi[order(testi$PGP.ID),]
head(testi$PGP.ID)

# Extracting abm students
abm <- testi[grep("abm", testi$PGP.ID),]

# Extracting Names and IDs
friends <- testi[,c(11,12)]
head(friends)
