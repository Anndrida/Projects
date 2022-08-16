library(ggplot2)
library(ggraph)
library(igraph)
library(magrittr)

w <- barabasi.game(150, m = 1)

w %>%
  ggraph(layout = "circlepack", direction = "in") +
  geom_edge_link(color = "orange", edge_width = 0.25) +
  geom_node_point(size = 3, alpha = 1-0.2*distances(w)[1,], color = "blue") + 
  theme_void()


g <- barabasi.game(100, m = 1)

g <- g - V(g)[degree(g) < 3]

V(g)$color <- degree(g)==1

g %>% ggraph(layout = "kk") +
  geom_edge_link(color = "red") +
  geom_node_point(aes(color=color),size = 6 ) + 
  scale_color_manual(values=c("red","green"),
                     labels=c("other degree", "degree 1")) + theme_void()
