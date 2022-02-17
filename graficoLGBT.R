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

percentis <- LGBT2019 %>%
  select(homicidios)%>%
  mutate(percentil=100*homicidios/sum(homicidios))
install.packages("RColorBrewer")
library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2") 
pie(LGBT2019$homicidios,labels = c("Branca 36,7%", "Parda 27,4%" , "Preta 9,72%" , "Não Identificado 26,1%"),
    border="white", 
    col=myPalette,
    main = "LGBTQIA+ Assassinados em 2019 por etnia")
