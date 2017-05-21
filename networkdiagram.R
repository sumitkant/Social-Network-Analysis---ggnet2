# Loading data
testi <- read.csv("testimonials.csv")
source('drawnetwork.R')

# Joining First Names and Last Names
testi$Name <- paste(testi$PGP_Fname, testi$PGP_Lname, sep =" ")
testi$FriendName <- paste(testi$Friend_Lname, testi$Friend_Fname, sep  = " ") 
names(testi)

# Extract amb friends
abm <- testi[grep("abm", testi$PGP.ID),]
abm.network <- abm[,c(11:12)]

# Draw abm network
drawnetwork.plotly(abm.network)
drawnetwork(abm.network)

library(ggplot2)
library(ggnet)
library(GGally)
library(network)
library(RColorBrewer)


# x = data.frame(Name = network.vertex.names(net))
# x = merge(x, abm.network, by = "Name", sort = FALSE)$FriendName
# net %v% "Names" = as.character(x)
# 
# colourCount = length(unique(abm.network$FriendName))
# getPalette = colorRampPalette(brewer.pal(9, "Set1"))
# colors <- getPalette(colourCount)
# names(colors) <- unique(x)

abm.network$Name <- as.factor(abm.network$Name)
net = network(abm.network[,c(2,1)], directed = TRUE)

x = data.frame(frndcrcl = network.vertex.names(net))
x <- abm.network$Name
net %v% "frndcrcl" = as.character(x)

getPalette = colorRampPalette(brewer.pal(9, "Set1"))
colors <- getPalette(18)
names(colors) <- levels(x)

ggnet2(net, mode = "fruchtermanreingold",
       alpha = 0.85, 
       size = 10, 
       edge.alpha = 0.35,
       edge.color = "gray50",
       label = abm.network$Name,
       label.size = 4,
       color = "frndcrcl",
       palette = colors,
       arrow.type = "closed", arrow.size = 8, arrow.gap = 0.02, legend.position = "none")

  # windowsFonts(Bebas = windowsFont('Bebas'))


# CAPTAIN JOHNNY & CREW
cjac.ids <- c("pgp31414","pgp31381", "pgp31398", "pgp30407","pgp31216","pgp31222")
cjac.rows <- which(testi$PGP.ID %in% cjac.ids)
cjac <- testi[cjac.rows,]

cjac$Name <- as.factor(cjac$Name)
net = network(cjac[,c(12,11)], directed = TRUE)

x = data.frame(frndcrcl = network.vertex.names(net))
x <- cjac$Name
net %v% "frndcrcl" = as.character(x)

getPalette = colorRampPalette(brewer.pal(9, "Set1"))
colors <- getPalette(31)
names(colors) <- levels(x)

ggnet2(net, mode = "fruchtermanreingold",
       alpha = 0.85, 
       size = 10, 
       edge.alpha = 0.35,
       edge.color = "gray50",
       label = cjac$FriendName,
       label.size = 4,
       color = "frndcrcl",
       palette = "Set2",
       arrow.type = "closed", arrow.size = 8, arrow.gap = 0.02, legend.position = "none")

ggnet2(net, mode = "circle",
       alpha = 0.85, 
       size = "degree", 
       edge.alpha = 0.35,
       edge.color = "gray50",
       label = cjac$Name,
       label.size = 4,
       color = "frndcrcl",
       palette = "Set2",
       arrow.type = "closed", arrow.size = 8, arrow.gap = 0.02, legend.position = "none")


# PGP DATA4
library(ggplot2)
library(ggnet)
library(GGally)
library(network)
library(RColorBrewer)

pgp.ids <- testi[grep("pgp", ids$PGP.ID),]
head(pgp.ids)
dim(pgp.ids)
length(unique(pgp.ids$PGP.ID))

net.pgp <- network(pgp.ids[,c(12,11)], directed = TRUE)

y = data.frame(frndcrcl = network.vertex.names(net.pgp))
y <- pgp.ids$PGP.ID
net.pgp %v% "frndcrcl" = as.character(y)

## Making Color Palette

getPalette = colorRampPalette(brewer.pal(9, "Set1"))
colors.pgp <- getPalette(length(unique(pgp.ids$PGP.ID)))
names(colors.pgp) <- unique(pgp.ids$PGP.ID)
head(colors.pgp)


# Plotting the net
ggnet2(net.pgp, mode = "fruchtermanreingold",
       alpha = 0.85, 
       size = 10, 
       edge.alpha = 0.15,
       edge.color = "gray50",
       label = pgp.ids$PGP.ID,
       label.size = 4,
       color = "frndcrcl",
       palette = colors.pgp,
       arrow.type = "closed", 
       arrow.size = 6, 
       arrow.gap = 0.01, legend.position = "none")
  

