library(dplyr)
library(tidyverse)
library(ggplot2)
library(car)
library(FactoMineR) 
library(factoextra) 
Popolazione_straniera_per_comune = Popolazione_straniera_per_comune %>%
  filter(Sesso =="totale" & ETA1 == "TOTAL" & Territorio != "Napoli")
write.csv(Popolazione_straniera_per_comune, "pop_straniera_comune.csv")
Redditi_per_comune = Redditi_per_comune %>%
  filter(`Tipo dato`=="contribuenti" & TIME =="2020" & Territorio != "Napoli")
write.csv(Redditi_per_comune, "redditi_comune.csv")
Servizi_bancari_per_comune = Servizi_bancari_per_comune %>%
  filter(`Tipo dato` =="sportelli bancari" & Territorio != "Napoli")
write.csv(Servizi_bancari_per_comune, "servizi_bancari.csv")
Morti_e_feriti_per_comune = Morti_e_feriti_per_comune %>%
  filter(Esito == "ferito" & Territorio != "Napoli")
write.csv(Morti_e_feriti_per_comune,"feriti_comuni.csv")
Istituti_di_cura_per_comune = Istituti_di_cura_per_comune %>%
  filter(`Tipo di istituto` == "totale" & Territorio != "Napoli")
Popolazione_Napoli = Popolazione_Napoli %>%
  filter(`Tipo dato` == "popolazione residente" & Territorio != "Napoli")
Morti_e_feriti_per_comune = Morti_e_feriti_per_comune %>%
  mutate(numero_feriti_ric = case_when(Value < 9 ~ "Numero di feriti basso",
                                       Value >= 9 & Value <= 40 ~ "Numero di feriti medio",
                                       Value > 40 ~ "Numero di feriti alto")) %>%
  mutate(numero_feriti_ric = factor(numero_feriti_ric, levels = c('Numero di feriti basso',
                                                                  'Numero di feriti medio',
                                                                  'Numero di feriti alto',
                                                                  ordered = T)))

df_unito <- merge(Morti_e_feriti_per_comune, Popolazione_straniera_per_comune, by.x = "Territorio", by.y = "Territorio", 
                  all.x = TRUE, all.y = FALSE)

feriti_stranieri_redditi <- merge(df_unito, Redditi_per_comune, by.x = "Territorio", by.y = "Territorio",
                                  all.x = TRUE, all.y = FALSE)
Servizi_bancari_per_comune2 = Servizi_bancari_per_comune %>%
  select(Territorio, Value)

feriti_stranieri_redditi_bancari <- merge(feriti_stranieri_redditi, Servizi_bancari_per_comune2, by.x = "Territorio", by.y = "Territorio",
                                  all.x = TRUE, all.y = FALSE)
feriti_stranieri_redditi_bancari_popolazione <- merge(feriti_stranieri_redditi_bancari, Popolazione_Napoli, by.x = "Territorio", by.y = "Territorio",
                                                      all.x = TRUE, all.y = FALSE)
feriti_stranieri_redditi_bancari$numero_sportelli[is.na(feriti_stranieri_redditi_bancari$numero_sportelli)]<-mean(feriti_stranieri_redditi_bancari$numero_sportelli,na.rm=TRUE)
feriti_stranieri_redditi_bancari$numero_sportelli <- trunc(feriti_stranieri_redditi_bancari$numero_sportelli)
regressione_f_s_r_b_p = feriti_stranieri_redditi_bancari_popolazione %>%
  select(Territorio, numero.feriti, numero.stranieri, numero_sportelli, reddito.contribuenti, numero_residenti)

###standardizzazione e selezione della matrice standardizzata
regressione_f_s_r_b_p = regressione_f_s_r_b_p %>%
  mutate(numero.feriti_std = scale(numero.feriti)) %>%
  mutate(numero.stranieri_std = scale(numero.stranieri)) %>%
  mutate(numero.sportelli_std = scale (numero_sportelli)) %>%
  mutate(reddito.contribuenti_std = scale(reddito.contribuenti)) %>%
  mutate(numero_residenti_std = scale(numero_residenti))
regressione_f_s_r_b_p_std =regressione_f_s_r_b_p %>%
  select(numero.feriti_std, numero.stranieri_std, numero.sportelli_std, numero_residenti_std, reddito.contribuenti_std)
### csv quantitativo
regressione_f_s_r_b_p <- data.frame(regressione_f_s_r_b_p, row.names = 1)
write.csv(regressione_f_s_r_b_p, "Abitabilità_comune.csv")
### modelli di regressione
model <- lm(reddito.contribuenti ~ numero_residenti + numero.feriti + numero.stranieri + numero_sportelli, data = regressione_f_s_r_b_p)
summary(model)
summary(model)$coefficient
confint(model)
avPlots(model)
model1 <- lm(numero_residenti ~ reddito.contribuenti + numero.feriti + numero.stranieri + numero_sportelli, data = regressione_f_s_r_b_p)
summary(model1)
summary(model1)$coefficient
confint(model1)
avPlots(model1)
model2<- lm(numero.stranieri ~ numero.feriti + reddito.contribuenti + numero_sportelli + numero_residenti, data = regressione_f_s_r_b_p)
summary(model2)
summary(model2)$coefficient
confint(model2)
avPlots(model2)
model3<- lm(numero.feriti ~ numero.stranieri + reddito.contribuenti + numero_sportelli + numero_residenti, data = regressione_f_s_r_b_p)
summary(model3)
summary(model3)$coefficient
confint(model3)
avPlots(model3)
model4<- lm(numero_sportelli ~ numero.feriti + reddito.contribuenti + numero.stranieri + numero_residenti, data = regressione_f_s_r_b_p)
summary(model4)
summary(model4)$coefficient
confint(model4)
avPlots(model4)

###ACP###

res.pca <- PCA(regressione_f_s_r_b_p, ncp = 5, scale.unit = T,
               quanti.sup = NULL, quali.sup = NULL, 
               graph = TRUE, axes = c(1,2))


eig.val <- get_eigenvalue(res.pca)
eig.val

eig.val <- round(eig.val, digits = 2)
eig.val

fviz_eig(res.pca, ncp=10, addlabels=T)
eig.val

var <- get_pca_var(res.pca)
var

round(var$coord , 3)
round(var$cor , 3)
round(var$cos2, 3) # Misura quanto bene la variabile Ã¨ rappresentata da una determinata componente
round(var$contrib, 3)

round(var$cos2, 3)
corrplot(var$cos2, is.corr=FALSE, method="pie")
corrplot(var$contrib, is.corr=FALSE)

fviz_cos2(res.pca, choice = "var", axes = 1)
fviz_cos2(res.pca, choice = "var", axes = 2)
fviz_pca_var(res.pca, col.var = "blue", repel = TRUE)
fviz_pca_var(res.pca, col.var = "cos2",
             gradient.cols = c("white", "blue", "red"), 
             repel = TRUE 
)
ind <- get_pca_ind(res.pca)
ind
fviz_pca_ind(res.pca, col.ind = "cos2", 
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE 
)

fviz_pca_ind(res.pca, pointsize = "cos2", 
             pointshape = 21, fill = "yellow",
             repel = TRUE 
)

################################