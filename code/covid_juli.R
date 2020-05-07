library(jsonlite)
cc<-fromJSON("https://juliael.carto.com/api/v2/sql?q=select%20*%20from%20public.contactos")
bd<-cc$rows
head(bd)

cc<-fromJSON("https://juliael.carto.com/api/v2/sql?q=select%20*%20from%20public.contactos_coord")
bd<-cc$rows
head(bd)

cc<-fromJSON("https://juliael.carto.com/api/v2/sql?q=select%20*%20from%20public.contactos_coord_1")
bd<-cc$rows
head(bd)

