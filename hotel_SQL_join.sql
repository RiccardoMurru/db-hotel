Join:

1. Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?

SELECT COUNT(`pho`.`ospite_id`) AS `tot_prenotazioni`, `pho`.`ospite_id`, `ospiti`.`name`, `ospiti`.`lastname`
FROM `prenotazioni_has_ospiti` AS `pho`
INNER JOIN `ospiti`
ON `pho`.`ospite_id` = `ospiti`.`id`
GROUP BY `pho`.`ospite_id`
HAVING `tot_prenotazioni` > 2;

2. Stampare tutti gli ospiti per ogni prenotazione

SELECT `ospiti`.`id`, `ospiti`.`name`, `ospiti`.`lastname`, `pho`.`prenotazione_id`
FROM `ospiti`
INNER JOIN `prenotazioni_has_ospiti` AS `pho`
ON `ospiti`.`id` = `pho`.`ospite_id`;

3. Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018

SELECT `pagamenti`.`prenotazione_id`, `pagamenti`.`pagante_id`, `pagamenti`.`price`, `pagamenti`.`status`, `paganti`.`name`, `paganti`.`lastname`, `prenotazioni`.`created_at`
FROM `pagamenti`
INNER JOIN `paganti`
ON `pagamenti`.`pagante_id` = `paganti`.`id`
INNER JOIN `prenotazioni`
ON `pagamenti`.`prenotazione_id` = `prenotazioni`.`id`
WHERE `prenotazioni`.`created_at` LIKE '2018-05-%';

4. Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano

SELECT SUM(`pagamenti`.`price`) AS `tot_price`
FROM `pagamenti`
INNER JOIN `prenotazioni`
ON `pagamenti`.`prenotazione_id` = `prenotazioni`.`id`
INNER JOIN `stanze`
ON `prenotazioni`.`stanza_id` = `stanze`.`id`
WHERE `stanze`.`floor` = 1;

5. Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate)

SELECT *
FROM `stanze`
LEFT JOIN `prenotazioni`
ON `stanze`.`id` = `prenotazioni`.`stanza_id`
WHERE `prenotazioni`.`id` IS NULL;


Group by:

1. Conta gli ospiti raggruppandoli per anno di nascita

SELECT COUNT(`id`) AS `numero_ospiti`, YEAR(`date_of_birth`) AS `anno_nascita`
FROM `ospiti`
GROUP BY YEAR(`date_of_birth`);

2. Somma i prezzi dei pagamenti raggruppandoli per status

SELECT SUM(`price`) AS `total`, `status`
FROM `pagamenti`
GROUP BY `status`;

3. Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni?

SELECT COUNT(`prenotazione_id`) AS `tot_prenotazioni`, `ospite_id`
FROM `prenotazioni_has_ospiti`
GROUP BY `ospite_id`
ORDER BY `tot_prenotazioni` DESC
LIMIT 1;