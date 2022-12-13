# Indice-abitabilit-
Incipit di progetto sviluppato per un'azienda su una bozza di costruzione di un indice di abitabilità dei comuni di Napoli, i dati utilizzati riguardano il reddito, il numero di abitanti, i servizi bancari, il numero di stranieri e il numero di feriti per 91 comuni di Napoli. il linguaggio utilizzato è R e i dati sono stati reperiti dal sito dell'ISTAT. Le variabili utilizzate sono state unicamente quantitative, trattate con due tecniche: Regressione Multipla e PCA.
Importante sottolineare che il lavoro è un work in progress, gli indici non sono ancora sufficienti per applicare una generalizzazione adatta a rilevare la qualità residenziale dei comuni.

Entrambe le tecniche sono state sviluppate utilizzando il dataset finale "Abitabilità_comune" in cui sono state estratte la variabili quantitative presenti nei dataset presenti nella repository. 

REGRESSIONE MULTIPLA

![Regressione_abitabilità](https://user-images.githubusercontent.com/119412116/207337738-d9d72d42-a0e6-4284-b08b-0d00b9e0551b.png)

Com'è possibile notare dai grafici, c'è una forte correlazione lineare positiva tra il reddito dei contribuenti e il numero dei residenti. Indice del fatto che le città più popolate sembrebbero essere anche quelle più ricche e dove, presubilmente, il reddito viene dichiarato con trasparenza.

####

Residual standard error: 1024 on 86 degrees of freedom

Multiple R-squared:  0.9912,	Adjusted R-squared:  0.9907 

F-statistic:  2409 on 4 and 86 DF,  p-value: < 2.2e-16

####

Importante notare dalle statistiche descrittive della regressione che sia la bontà sia la significatività del modello sono molto alte (Adjusted R-squared & p-value).

ACP

Per quanto riguarda L'ACP, come già accennato, le variabili rimangono le stesse. Prima di procedere con l'analisi fattoriale è però interessante visualizzare la spiegabilità del fenomeno secondo le dimensioni individuate attraverso uno screeplot.

![Screeplot_variabilità_spiegata](https://user-images.githubusercontent.com/119412116/207347476-34c5611d-4abe-4ace-8197-722a045ed3ed.png)

Com'è possibile notare, quasi il 90% della variabilità spiegata del fenomeno è riassumibile nelle prime due dimensioni, ossia attraverso i primi due assi. i cui contribuiti sono indicati in successione:

CONTRIBUTI ASSOLUTI

![cotributi assoluti](https://user-images.githubusercontent.com/119412116/207354963-932311c5-3504-43ef-9678-47ad6bbb8c1a.png)


Com'è possibile notare, i contributi maggiori alla formazione del primo asse provengono da numero.feriti, reddito.contribuenti e numero_residenti, per quanto riguarda il secondo invece numero stranieri e numero sportelli hanno i valori più alti. i Grafici in successione possono chiarire ulteriormente l'interpretazione di tali dati.

![Cerchio_correlazioni](https://user-images.githubusercontent.com/119412116/207350945-6cbdc244-1a48-4b7a-979b-35608344cc0d.png)


![torte_contrib_assoluti](https://user-images.githubusercontent.com/119412116/207351059-4cdb82d2-c9f4-4f93-94a2-75f5ca66fc4c.png)

CONTRIBUTI RELATIVI

![contributi relativi](https://user-images.githubusercontent.com/119412116/207355030-2096de57-ba5d-4ca6-909b-756c389f47f3.png)


Per quanto riguarda i contributi relativi invece, vediamo come sulla prima dimensione tutte le variabili sono rappresentate bene, mentre per la seconda i valori accettabili riguardano solo numero stranieri e numero sportelli.

![torte_contrib_relativi](https://user-images.githubusercontent.com/119412116/207351977-c5c1b069-5ac1-4b1d-b4ea-ae4111d6fb0d.png)

RAPPRESENTAZIONE GRAFICA DEI COMUNI

![ACP_abitabilità](https://user-images.githubusercontent.com/119412116/207355583-cb5b4e1e-7b02-49a7-87b8-1f97c7c6f760.png)

Dalla rappresentazione sugli assi dei comuni è possibile sintetizzare le variabili in componenti principali, sull'asse orizzontale abbiamo l'informazione riguardo la qualità della vita, mentre sul secondo abbiamo principalmente il numero di stranieri. I comuni più ricchi e popolati, quindi più appetibili (oltre che ben rappresentati), sembrano essere Pozzuoli, Casoria, Pomigliano D'Arco, Portici, Castellammare di Stabia e Torre del Greco. Mentre quelli che, oltre ad avere redditi e popolazione più bassi, oltre che un numero di stranieri più elevato sembrano essere Palma Campania, Poggiomarino e Terzigno.
