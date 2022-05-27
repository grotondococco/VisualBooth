# Release Notes
## L’applicativo si pone l’obiettivo di presentare visivamente il funzionamento del noto Algoritmo di Booth facendo uso di un’interfaccia grafica completa sviluppata in Java, in ambiente Processing. Le operazioni sono da  intendersi a lunghezza fissa di 8 bit.
# Presentazione

## ![Main Menu](https://github.com/coccojack/VisualBooth/blob/main/screenshots/menu_principale.PNG)
Avviando il Software il menù principale presenta tre opzioni per il prodotto, indicate in figura dalle frecce rosse.
Esse sono:
1. Prodotto naturale
2. Algoritmo di Booth
3. Prodotto con Bitpair

# Le 3 modalità
# Prodotto naturale
Trattasi del più semplice dei prodotti, analogamente all’algoritmo utilizzato per i numeri decimali:
1. Procedendo dalla cifra meno significativa alla più significativa del secondo fattore si effettua il prodotto della cifra presa in esame con le cifre del primo fattore, andando così a generare il primo risultato nel passo 1.
2. Il risultato ottenuto dunque sarà la ripetizione del primo fattore se la cifra presa in questione del secondo fattore è 1, oppure una serie di zeri se la cifra è 0.
3. L’operazione si ripete per ogni cifra del secondo fattore.
4. Il risultato è calcolato sommando per colonna le cifre di tutti i passi, tenendo in considerazione il riporto.

## ![Simulazione Naturale](https://github.com/coccojack/VisualBooth/blob/main/screenshots/sim_naturale.PNG)
Sarà possibile eseguire il prodotto come nell'usuale operazione sui numeri decimali, utilizzando numeri binari in rappresentazione binaria naturale. Per procedere sarà sufficiente alterare i valori contenuti nel moltiplicando
e nel moltiplicatore in alto a destra cliccandoci sopra. 
Una volta impostati i numeri premendo START sarà possibile vedere ogni singolo passaggio fino al risultato.

# Algorimo di Booth
L’algoritmo di Booth, per il prodotto tra due cifre binarie in complemento a due, si divide in due fasi.
1. La prima fase prevede la conversione del secondo fattore con codifica di Booth:
La codifica di Booth del secondo fattore si ricava nel seguente modo:
    - Si aggiunge uno zero di supporto ai calcoli a destra della cifra meno significativa e si procede accoppiando la cifra presa in esame con quella alla sua destra, spostandosi di una cifra alla volta.
    - La codifica per ogni coppia è la seguente: 11=0 ; 00=0; 10=-1; 01=1.
2. La seconda fase si articola moltiplicando la codifica di Booth del secondo fattore ottenuta per il primo fattore. L’operazione si svolge in maniera analoga a quella in colonna, a differenza che quando la cifra è -1 si effettua il complemento a due del primo fattore come risultato del prodotto per la cifra della codifica.

## ![Simulazione Booth](https://github.com/coccojack/VisualBooth/blob/main/screenshots/sim_booth.PNG)
Dall’istanza in immagine sarà possibile eseguire il prodotto con algoritmo di Booth.
Come per gli altri algoritmi sarà sufficiente alterare i valori contenuti nel moltiplicando e nel moltiplicatore in alto a destra cliccandoci sopra. Una volta impostati i numeri premendo START sarà possibile vedere ogni singolo passaggio fino al risultato.
Il software è inoltre in grado di mostrare la codifica di Booth del secondo fattore evidenziando al passaggio del puntatore le cifre prese in considerazione.

# Algoritmo di Bitpair
Esso è un evoluzione dell’algoritmo di Booth, ideato per compiere meno operazioni, infatti funziona analogamente, con una codifica per il secondo fattore, basata a cascata su quella di Booth.
1. Dopo aver ricavato la codifica di Booth per il secondo fattore, la codifica per il bitpair si ricava dalla codifica di Booth accoppiando a due a due le cifre a partire da quelle meno significative, spostandosi di due cifre alla volta.
2. La codifica per le coppie è la seguente: 0b=b, con b∊{-1,0,+1} ; -1+1=-1; -10=-2; +10=+2; +1-1=+1. Le coppie +1+1 e -1-1 non si presentano mai per la logica dell’algoritmo.
3. Questa codifica porterà ad avere 4 cifre intervallate da zeri, i quali costituiscono delle operazioni nulle in cui si shifta il prodotto alla sinistra. Nel seguente Software questi sono rappresentati da spazi vuoti nella codifica.
4. Una volta ottenuta la codifica la moltiplicazione si svolge in maniera analoga a quella con codifica di Booth, a differenza che quando la cifra della codifica è +2 si effettua uno shift di una posizione a sinistra della cifra, altrimenti se la cifra è -2, oltre allo shift a sinistra si fa la conversione del primo fattore in complemento 
a due.

## ![Simulazione Bitpair](https://github.com/coccojack/VisualBooth/blob/main/screenshots/sim_bitpair.PNG)
Analogamente a quanto visto per gli altri algoritmi è possibile eseguire l prodotto con bitpair alterando i valori contenuti nel moltiplicando e nel moltiplicatore in alto a destra cliccandoci sopra. Una volta impostati i numeri premendo START sarà possibile vedere ogni singolo passaggio fino al risultato.
Viene mostrata la codifica in BitPair del secondo fattore, la quale prevede quattro cifre alternate da o perazioni nulle, in corrispondenza delle quali i passi dell’operazioni di moltiplicazione sono tutti zeri.
Quando la cifra della codifica è 2 o -2, una serie di «<<« notifica che è avvenuto uno shift sinistro.
Per ognuno degli algoritmi presentati è possibile tornare indietro utilizzando la funzione apposita «Ritorna al menù» in alto a sinistra

# Modalità Quiz
## ![Quiz Menu](https://github.com/coccojack/VisualBooth/blob/main/screenshots/menu_quiz.PNG)
Per allenarsi e mettersi alla prova è stata implementata una modalità chiamata «quiz» (indicata dalla freccia rossa nell’immagine a sinistra) che permette di testare le proprie conoscenze in tutti e tre gli algoritmi: 
Prodotto Naturale, Algoritmo di Booth e Algoritmo Bitpair.
Una volta selezionata la modalità è sufficiente scegliere l’algoritmo desiderato.

# Facile
## ![Quiz Facile](https://github.com/coccojack/VisualBooth/blob/main/screenshots/quiz_naturale.PNG)
In questa modalità nella sessione «prodotto naturale» l’obiettivo dell’utilizzatore è calcolare il risultato dei
valori generati casualmente premendo il pulsante <start> in alto al centro.
Una comoda etichetta sulla destra ti ricorderà di essere nella modalità desiderata.
Se la soluzione è corretta il programma restituirà <OK> come nell’immagine di esempio.
 
# Media
## ![Quiz Medio](https://github.com/coccojack/VisualBooth/blob/main/screenshots/quiz_booth.PNG)
In questa modalità nella sessione «Algoritmo di Booth» l’obiettivo dell’utilizzatore è indovinare prima la codifica di Booth e solo a quel punto calcolare il risultato.
Una prima etichetta <OK>, come in figura, appare non appena la codifica di Booth è stata indovinata.
Una prima etichetta <OK> appare alla destra della codifica di Booth non appena essa è stata indovinata. 
Successivamente, se la soluzione è corretta, il programma restituirà <OK> in basso a destra.

# Difficile
## ![Quiz Difficile](https://github.com/coccojack/VisualBooth/blob/main/screenshots/quiz_bitpair.PNG)
In questa modalità nella sessione «Bitpair» come per l’algoritmo di Booth l’obiettivo dell’utilizzatore è indovinare prima la codifica Bitpair e solo allora calcolare il risultato.
Questa è la modalità quiz più impegnativa delle tre, poiché bisognerà: 
prima calcolare separatamente la cod. di Booth, dalla quale poi ricavare quella Bitpair;
-oppure applicare la ricodifica Bitpair definita su otto possibili terne di bit (considerando anche il bit a destra della coppia).
Una prima etichetta <OK> appare alla destra della codifica di Bitpair non appena essa è stata indovinata. Successivamente, se la soluzione è corretta, il programma restituirà <OK> in basso a destra.

# Riconoscimenti
La nascita e lo sviluppo del progetto sono da attribuire interamente a:
- [Alfio Alessandro Privitera](https://github.com/AlfioA)
- [Giacomo Andrea Rotondo Cocco](https://github.com/coccojack)
- [Giuseppe Mazzara]
<br>
Studenti dell’Università degli Studi di Catania, L-31 Informatica.

