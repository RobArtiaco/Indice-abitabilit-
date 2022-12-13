# Indice-abitabilit-
Bozza di progetto sviluppato per un'azienda su una bozza di costruzione di un indice di abitabilità dei comuni di Napoli, i dati utilizzati riguardano il reddito, il numero di abitanti, i servizi bancari, il numero di stranieri e il numero di feriti per 91 comuni di Napoli. il linguaggio utilizzato è R e i dati sono stati reperiti dal sito dell'ISTAT. Le variabili utilizzate sono state unicamente quantitative, trattate con due tecniche: Regressione Multipla e PCA.
Importante sottolineare che il lavoro è un work in progress, gli indici non sono ancora sufficienti per applicare una generalizzazione adatta a rilevare la qualità residenziale dei comuni.

Entrambe le tecniche sono state sviluppate utilizzando il dataset finale "Abitabilità_comune" in cui sono state estratte la variabili quantitative presenti nei dataset presenti nella repository. 

REGRESSIONE MULTIPLA
![Regressione_abitabilità](https://user-images.githubusercontent.com/119412116/207337738-d9d72d42-a0e6-4284-b08b-0d00b9e0551b.png)

Com'è possibile notare dai grafici, c'è una forte correlazione lineare positiva tra il reddito dei contribuenti e il numero dei residenti. Indice del fatto che le città più popolate sembrebbero essere anche quelle più ricche e dove, presubilmente, il reddito viene dichiarato con trasparenza.


Residuals:

    Min      1Q  Median      3Q     Max 
-3381.1  -617.3   -32.4   565.3  2849.2 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      250.49462  180.61265   1.387    0.169    
numero_residenti   0.48266    0.01188  40.629  < 2e-16 
numero.feriti     -2.88194    5.09000  -0.566    0.573    
numero.stranieri   0.09529    0.13539   0.704    0.483    
numero_sportelli 179.22484   35.71812   5.018 2.79e-06 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1024 on 86 degrees of freedom
Multiple R-squared:  0.9912,	Adjusted R-squared:  0.9907 
F-statistic:  2409 on 4 and 86 DF,  p-value: < 2.2e-16

                     Estimate   Std. Error    t value     Pr(>|t|)
(Intercept)      250.49462255 180.61264516  1.3869163 1.690516e-01
numero_residenti   0.48265573   0.01187945 40.6294535 6.590251e-58
numero.feriti     -2.88194122   5.08999961 -0.5661967 5.727346e-01
numero.stranieri   0.09528612   0.13538914  0.7037944 4.834621e-01
numero_sportelli 179.22484401  35.71811995  5.0177569 2.786583e-06

                        2.5 %      97.5 %
(Intercept)      -108.5514328 609.5406779
numero_residenti    0.4590402   0.5062713
numero.feriti     -13.0005256   7.2366431
numero.stranieri   -0.1738586   0.3644308
numero_sportelli  108.2195716 250.2301164

Importante notare dalle statistiche descrittive della regressione che sia la bontà sia la significatività del modello sono molto alte (Adjusted R-squared & p-value).
