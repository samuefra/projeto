library("basedosdados")
set_billing_id("cosmic-shift-341512")
query <- bdplyr("br_ggb_relatorio_lgbtqi.raca_cor")
LGBT <- bd_collect(query)
library(dplyr)
LGBT2019 <- LGBT %>%
  filter(
    ano==2019
  )
LGBT2019 <- LGBT2019 %>%
  select(raca_cor, homicidios)

install.packages("RColorBrewer")
library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2") 
labels <- 
pie(LGBT2019$homicidios,labels = c("Branca", "Parda" , "Preta" , "Não Identificado"),
    border="white", 
    col=myPalette,
    main = "LGBTQIA+ Assassinados em 2019 por etnia")
