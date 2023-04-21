USE sakila;
5
/* Ejercicio 1 */
SELECT title
FROM FILM
WHERE length between 100 and 120
OR length between 50 and 70 ;
/* Ejercicio 2 */
SELECT cu.customer_id
From address as ad INNER JOIN customer as cu
ON Ad.address_id = CU.address_id
WHERE (ad.district LIKE 'ontario'
OR ad.district LIKE 'punjab`'
OR ad.postal_code LIKE '%5'
OR ad.phone LIKE '%5');
/* Ejercicio 3 */
SELECT COUNT(ACTOR_ID)
FROM FILM_ACTOR;
/* Ejercicio 4 */
SELECT fi.title
FROM film AS FI INNER JOIN film_category as fic
ON FI.film_id = fic.film_id INNER JOIN category as ca
ON fic.category_id = ca.category_id
WHERE FI.length < 120
ORDER BY ca.name;
/* Ejercicio 5 */
SELECT AVG(fi.length) as MediaDuracionPeliculasMinutos, ca.name as
NombreDeCategoria
FROM film AS FI INNER JOIN film_category as fic
ON FI.film_id = fic.film_id INNER JOIN category as ca
ON fic.category_id = ca.category_id
GROUP BY ca.name;
/*Ejercicio 6 */
SELECT COUNT(FI.FILM_ID)
FROM film AS FI INNER JOIN film_category as fic
ON FI.film_id = fic.film_id INNER JOIN category as ca
ON fic.category_id = ca.category_id
WHERE fi.rating IN ( 'R', 'PG')
AND CA.name = 'Action';