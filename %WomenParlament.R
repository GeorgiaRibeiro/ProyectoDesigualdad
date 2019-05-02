#================================================#
# Universidad Diego Portales
# Curso de ....
#================================================#
# Desigualdade de Genero no Legislativo
# Geba
# 01/05/2019
#================================================#

# carregar pacotes
library(stringr); library(ggplot2)

# carregar dados
base <- read.csv("WomenInParlament1998-2008.csv", stringsAsFactors=FALSE)

# PS: Nao se converte valores faltantes em 0, nunca
# substituindo valores vazios em NA 
base$`1998`[base$`1998` == "..."] = NA 

# convertendo variáveis numéricas
base$`1998` = as.numeric(base$`1998`)

#grafico
ggplot(base, aes(x=base$Country, y=base$`1998`)) +
  geom_bar(stat="identity")

# ordenar valores crescentes
base$Country = factor(base$Country, levels = base$Country[order(base$`2008`)])

# estetica
ggplot(data = base, aes(x = Country, y=`2008`)) +
  geom_bar(fill="#0072B2",stat="identity") + 
  geom_label(aes(label = `2008`), size = 2.4)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  labs(x = "Países", y = "% de Mujeres en el Parlamento")+
  coord_flip()+
  theme_minimal() 


  