
  library("basedosdados")
set_billing_id("cosmic-shift-341512")
query <- bdplyr("mundo_transfermarkt_competicoes.brasileirao_serie_a")
Brasileirao <- bd_collect(query)
library(dplyr)
Brasileirao <- Brasileirao%>%
  select(ano_campeonato, gols_man, gols_vis)
Brasileirao <- Brasileirao %>%
  filter (!is.na(gols_man))
Brasileirao <- Brasileirao %>%
group_by(ano_campeonato) %>%
summarise(mean_gols_man= mean(gols_man), mean_gols_vis= mean(gols_vis))
library(ggplot2)
ggplot(Brasileirao,
       aes(x=ano_campeonato))+
  geom_line(aes(y=mean_gols_man, col="mandante"))+
  geom_line(aes(y=mean_gols_vis, col="visitante"))+
  ggtitle("média de gols por jogo campeonato brasileiro")+
labs(x = "ano do campeonato",
     y = "média de gols" , col="mando" ) 
 
 