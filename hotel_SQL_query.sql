1. Seleziona tutti gli ospiti che sono stati identificati con la carta di identità:

SELECT *
FROM `ospiti`
WHERE `document_type` = 'CI';

2. Seleziona tutti gli ospiti che sono nati dopo il 1988:

SELECT *
FROM `ospiti`
WHERE `date_of_birth` > '1988-01-01';

3. Seleziona tutti gli ospiti che hanno più di 20 anni (al momento dell’esecuzione della query):

SELECT *
FROM `ospiti`
WHERE `date_of_birth` < '2000-01-01';

4. Seleziona tutti gli ospiti il cui nome inizia con la D:

SELECT *
FROM `ospiti`
WHERE `name` LIKE 'd%';

5. Calcola il totale degli ordini accepted:

SELECT SUM(`price`) AS `total`
FROM `pagamenti`
WHERE `status` = 'accepted';

6. Qual è il prezzo massimo pagato?

SELECT MAX(`price`) AS `prezzo max`
FROM `pagamenti`;

7. Seleziona gli ospiti riconosciuti con patente e nati nel 1975:

SELECT *
FROM `ospiti`
WHERE `document_type` = 'driver license'
AND `date_of_birth` BETWEEN '1975-01-01' AND '1975-12-31';

8. Quanti posti letto ha l’hotel in totale?

SELECT SUM(`beds`) AS `posti letto`
FROM `stanze`;
