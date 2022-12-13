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


Residual standard error: 1024 on 86 degrees of freedom
Multiple R-squared:  0.9912,	Adjusted R-squared:  0.9907 
F-statistic:  2409 on 4 and 86 DF,  p-value: < 2.2e-16



Importante notare dalle statistiche descrittive della regressione che sia la bontà sia la significatività del modello sono molto alte (Adjusted R-squared & p-value).
