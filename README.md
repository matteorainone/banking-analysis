# Analisi Bancaria

## Introduzione

Benvenuto nel progetto di Analisi Bancaria! Questo repository contiene uno script SQL progettato per estrarre e calcolare varie caratteristiche relative ai clienti bancari. Queste caratteristiche sono cruciali per l'analisi dei dati e possono essere utilizzate come input per modelli di machine learning per prevedere comportamenti o classificare i clienti in base a specifici metriche.

## Obiettivo

L'obiettivo principale di questo script è generare una serie di tabelle temporanee che aggregano e calcolano informazioni dettagliate sui conti bancari, sulle transazioni e sui tipi di conti e transazioni per ciascun cliente. La tabella finale risultante contiene tutte le caratteristiche calcolate e può essere utilizzata per ulteriori analisi o come input per modelli di machine learning.

## Descrizione dello Script

Lo script SQL esegue i seguenti passaggi:

1. **Contare il numero totale di conti per cliente**:
    - Crea una tabella temporanea che contiene il numero totale di conti posseduti da ciascun cliente.

2. **Calcolare il numero di transazioni in entrata e in uscita per cliente**:
    - Crea una tabella temporanea con il numero di transazioni in entrata e in uscita per ciascun cliente.

3. **Calcolare l'importo totale delle transazioni in entrata e in uscita per cliente**:
    - Crea una tabella temporanea con l'importo totale delle transazioni in entrata e in uscita per ciascun cliente.

4. **Contare il numero di conti per tipo**:
    - Crea una tabella temporanea che contiene il numero di conti per ciascun tipo di conto per ciascun cliente.

5. **Contare il numero di transazioni per tipo**:
    - Crea una tabella temporanea con il numero di transazioni per ciascun tipo di transazione per ciascun cliente.

6. **Calcolare l'importo delle transazioni in entrata e in uscita per tipo di conto**:
    - Crea una tabella temporanea con l'importo totale delle transazioni in entrata e in uscita per ciascun tipo di conto per ciascun cliente.

7. **Creare la tabella finale con tutte le caratteristiche per cliente**:
    - Crea una tabella temporanea finale contenente tutte le caratteristiche calcolate per ciascun cliente.

## Utilizzo

Per eseguire lo script, è necessario avere accesso a un database SQL con le seguenti tabelle:

- `banca.cliente`
- `banca.conto`
- `banca.transazioni`
- `banca.tipo_transazione`
- `banca.tipo_conto`

Nel reporsitory è presente lo script `db_bancario.sql` che consente di creare un database `banca` con le caratteristiche richieste.

Lo script crea una serie di tabelle temporanee che aggregano e calcolano le caratteristiche necessarie e infine produce una tabella `cliente_features` contenente tutte le caratteristiche calcolate.

### Esempio di Esecuzione

Per eseguire lo script, utilizzare un client SQL compatibile con il vostro database (ad esempio, MySQL Workbench, DBeaver, ecc.) e copiare/incollare il contenuto dello script nel client. Dopo l'esecuzione, la tabella temporanea `cliente_features` sarà disponibile per ulteriori analisi.

## Conclusione

Questo script SQL è uno strumento potente per l'analisi dei dati bancari, progettato per estrarre e calcolare caratteristiche rilevanti per ciascun cliente. Queste caratteristiche possono essere utilizzate per l'analisi dei dati e sono particolarmente utili come input per modelli di machine learning per prevedere comportamenti o classificare i clienti in base a specifici metriche.

Per qualsiasi domanda o contributo, sentiti libero di contattare il team di sviluppo o creare un problema su GitHub. Buona analisi dei dati!
