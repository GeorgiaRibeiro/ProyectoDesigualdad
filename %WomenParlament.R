##Trabalho: Desigualdade de Gênero no Legislativo

getwd()
setwd("/home/geba/Documentos/UDP/Desigualdad")

base <- read.csv("WomenInParlament1998-2008.csv", stringsAsFactors=FALSE)

#Substituindo valores vazios por 0
library(stringr)
str_replace_all(base$X1998, "NA", "0")
View(base$X1998)

#convertendo variáveis numéricas
as.numeric(base$X1998) 
as.numeric(base$X2008)
class(base$X1998) 
class(base$X2008)

#grafico
library(ggplot2)
ggplot(base, aes(x=base$Country, y=base$X1998)) +
  geom_bar(stat="identity")

#estética
ggplot(base, aes(x=reorder(Country, X2008), y=X2008)) +
  geom_bar(fill="#0072B2",stat="identity") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  theme_minimal() +
  xlab("Países") + ylab("% de Mujeres en el Parlamento")

  