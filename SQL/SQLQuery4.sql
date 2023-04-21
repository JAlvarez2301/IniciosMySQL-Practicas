USE sakila;

SELECT FI.title, FI.rental_duration, FI.length
FROM film as FI
WHERE rating = 'PG'
AND special_features LIKE '%TRAILERS%' /* ¡¡¡ CUANDO CONTIENE HAY QUE PONER % !!!  */
AND fi.length between 80 and 90
AND FI.rental_duration between 7 and 8;

SELECT FI.title, FI.rental_duration, FI.length, language.name
FROM film as FI RIGHT JOIN language
ON FI.language_id = language.language_id;

SELECT DISTINCT FI.TITLE
FROM 
CUSTOMER AS CU, 
address AS AD, 
CITY AS CI,
country AS CO,
RENTAL AS RE, 
INVENTORY AS INV,
FILM AS FI
WHERE
FI.film_id = INV.film_id
AND INV.inventory_id = re.inventory_id
AND RE.customer_id = CU.customer_id
AND CU.address_id = ad.address_id
AND AD.city_id = CI.city
AND CI.country_id = CO.country_id
AND FI.length >180;


