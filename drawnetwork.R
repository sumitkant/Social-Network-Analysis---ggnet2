library(plotly)
library(igraph)
drawnetwork.plotly <- function(dataset) {
  
  frnd.network <- graph.data.frame(dataset, directed=T)
  L <- layout.spring(frnd.network)
  
  vs <- V(frnd.network)
  es <- as.data.frame(get.edgelist(frnd.network))
  
  Nv <- length(vs)
  Ne <- length(es[1]$V1)
  
  Xn <- L[,1]
  Yn <- L[,2]
  
  network <- plot_ly(x = ~Xn, y = ~Yn, mode = "markers", text = vs$label, hoverinfo = "text")
  
  
  edge_shapes <- list()
  for(i in 1:Ne) {
    v0 <- es[i,]$V1
    v1 <- es[i,]$V2
    
    edge_shape = list(
      type = "line",
      line = list(color = "#030303", width = 0.3),
      x0 = Xn[v0],
      y0 = Yn[v0],
      x1 = Xn[v1],
      y1 = Yn[v1]
    )
    
    edge_shapes[[i]] <- edge_shape
  }
  
  axis <- list(title = "", showgrid = FALSE, showticklabels = FALSE, zeroline = FALSE)
  
  p <- layout(
    network,
    title = 'Karate Network',
    shapes = edge_shapes,
    xaxis = axis,
    yaxis = axis
  )
  
  return(p)
}




library(igraph)
drawnetwork <- function(dataset){
  net <- graph.data.frame(dataset, directed=T)
  net <- simplify(net, remove.multiple = F, remove.loops = T) 
  l <- layout_in_circle(net)
  plot(net, layout=l, edge.arrow.size=.5, 
       edge.curved=.2, 
       vertex.label.cex = 0.8, 
       vertex.size = 6,
       edge.color=rgb(0,0,0,0.1),
       vertex.color="orange", 
       vertex.frame.color="#ffffff")
}

