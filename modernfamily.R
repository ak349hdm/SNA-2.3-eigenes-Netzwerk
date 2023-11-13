
#Setup 

install.packages("igraph", repos = 'http://cran.us.r-project.org')
library("igraph")

#Edgelist einlesen 

modernfamily_edgelist = read.csv("modernfamily_edgelist.csv", sep = ";", 
                                 stringsAsFactors = F)
#Edgelist als Matrix 

modernfamily_edgelist <- as.matrix(modernfamily_edgelist)

#Gerichtetes Netzwerk vorbereiten 

modernfamilyNetwork <- graph.edgelist(modernfamily_edgelist, directed = TRUE)
modernfamilyNetwork
View(modernfamilyNetwork)
V(modernfamilyNetwork)$name

#Visualisierung Edgelist 

plot(modernfamilyNetwork, vertex.size = 10, vertex.color = "tomato", 
     vertex.frame.color = NA,
     vertex.lable.cex = .7, 
     vertex.label.color = "black",
     edge.curved = .1, 
     edge.arrow.size = .3, 
     edge.width = .7)
kamadaLayout <- layout.kamada.kawai(modernfamilyNetwork)


#Nodelist einlesen und Eigenschaften anzeigen
modernfamily_Nodelist = read.csv("modernfamily_Nodelist.csv", sep = ";", 
                                 stringsAsFactors = F)
head(modernfamily_Nodelist)

#mehr Eigenschaften im Netzwerk Modern Family einsehbar 

## Edgelist nochmal einlesen 
modernfamily_edgelist = read.csv("modernfamily_edgelist.csv", sep = ";", 
                                 stringsAsFactors = F)

##Nodelist nochmal einlesen 
modernfamily_Nodelist = read.csv("modernfamily_Nodelist.csv", sep = ";", 
                                 stringsAsFactors = F)
head(modernfamily_Nodelist)

#Edgelist und Nodelist zusammenführen ins Netzwerk 
modernfamilyNetwork <- graph_from_data_frame(d = modernfamily_edgelist,
                                             directed = T,
                                             vertices = modernfamily_Nodelist)
                                
modernfamilyNetwork

#Reihenfolge Geschlecht 

V(modernfamilyNetwork)$Geschlecht [1:5]

#Geschlechtern Farben zuordnen 

V(modernfamilyNetwork)$color <- ifelse(V(modernfamilyNetwork)
                                       $Geschlecht=="maennlich", "dodgerblue3",
                                       "pink")

#Visualisierung mit Geschlechtern nach Farben 

plot(modernfamilyNetwork, vertex.size = 10, vertex.frame.color = "black",
     vertex.label.cex = .7, 
     edge.curved = .1, 
     edge.arrow.size = .3)

#Visualisierung nach Rollen in der Familie 

V(modernfamilyNetwork)$color <- NA 
V(modernfamilyNetwork)$color <- ifelse(V(modernfamilyNetwork)
                                       $Rolle == "Vater", "burlywood1", "tomato")
V(modernfamilyNetwork)$color <- ifelse(V(modernfamilyNetwork)
                                       $Rolle == "Mutter", "seagreen", 
                                       V(modernfamilyNetwork)$color)
V(modernfamilyNetwork)$color <- ifelse(V(modernfamilyNetwork)
                                       $Rolle == "Tochter", "pink", 
                                       V(modernfamilyNetwork)$color)
V(modernfamilyNetwork)$color <- ifelse(V(modernfamilyNetwork)
                                       $Rolle == "Sohn", "grey70", 
                                       V(modernfamilyNetwork)$color)
plot(modernfamilyNetwork, vertex.size = 10, 
     vertex.label.cex = .7, 
     edge.curved = .1, 
     vertex.frame.color = "black",
     edge.arrow.size = .3, 
     edge.width = .7, 
     edge.color = "grey30")

#Unterscheidung nach Alter und Visualisierung 

V(modernfamilyNetwork)$size = V(modernfamilyNetwork)$Alter/5

plot(modernfamilyNetwork, vertex.size = 10, 
     vertex.label.cex = .7, 
     edge.curved = .1, 
     vertex.frame.color = "black",
     edge.arrow.size = .3, 
     edge.width = .7, 
     edge.color = "grey30")

 





