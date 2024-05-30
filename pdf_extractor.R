library(pdftools)
library(tidyverse)
library(stringi)

setwd("C:/Users/curciom/Desktop/proyectos/TRANSPORTE")

vehiculos_pdf <- pdf_text("01-03-2024.pdf")

tabla_vehiculos <- vehiculos_pdf[2] 
tabla_vehiculos <-  strsplit(tabla_vehiculos, "\n") 
tabla_vehiculos <- tabla_vehiculos[[1]]
tabla_vehiculos <- tabla_vehiculos[7:95]
tabla_vehiculos <- str_split_fixed(tabla_vehiculos, " {2,}", 35) 
tabla_vehiculos <- as.data.frame(tabla_vehiculos) 

df <- read.table(text = tabla_vehiculos, header = TRUE, sep = "\t")


colnames(tabla_vehiculos) <-c("I/N","MTM/FMM","T",
                                        "Fab","Marca","Tipo",
                                        "Mod","Desc. marca","Desc. modelo",
                                        "Desc. Tipo", "0Km","2023","2022",
                                        "2021","2020","2019","2018","2017",
                                        "2016","2015","2014","2013","2012",
                                        "2011","2010","2009","2008","2007",
                                        "2006","2005","2004","2003","2002",
                                        "2001","2000")
tabla_vehiculos <- tabla_vehiculos %>%
  filter(Marca != "")


tabla_vehiculos_2 <- gsub(" ", ".", tabla_vehiculos)
tabla_vehiculos[,2]
view(tabla_vehiculos_2)
