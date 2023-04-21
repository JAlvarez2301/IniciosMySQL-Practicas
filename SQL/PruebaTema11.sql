USE sakila;

SELECT CU.first_name, CU.last_name, AD.address, co.country, AD.district
FROM customer as CU, address as AD, country as CO, city as CI
WHERE CU.address_id = AD.address_id
AND CI.country_id = CO.country_id
AND AD.city_id = CI.city_id
AND ad.district < 'GALICIA'
AND CO.country = 'Spain'
ORDER BY CU.last_name;

SELECT CU.first_name, CU.last_name, fi.title
FROM CUSTOMER AS CU, film AS FI, rental AS RE, inventory AS INV
WHERE CU.customer_id = RE.customer_id 
AND RE.inventory_id = INV.inventory_id
AND INV.film_id = FI.film_id
AND fi.title = 'ACE GOLDFINGER';

SELECT FI.title, FI.length, FI.rating
FROM FILM AS FI, category as CA, film_category as FM
WHERE fM.film_id = FI.film_id
AND FM.category_id = ca.category_id
AND CA.name LIKE '%ACTION%'
AND title LIKE '%ARIZONA%';

SELECT ST.first_name, ST.last_name
FROM staff AS ST
WHERE st.store_id IN(
SELECT ST.store_id
FROM store AS STO, country AS CO, address, city
WHERE STO.store_id = ST.store_id
AND STO.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = CO.country_id
AND CO.country = 'AUSTRALIA');


SELECT fi.film_id, COUNT(fi.film_id) as RecuentoPeliculas
FROM inventory as INV, film as FI
WHERE INV.film_id = fi.film_id
AND FI.film_id IN
(
SELECT fi.film_id
FROM film as FI
WHERE FI.rating = 'G'
AND FI.length > 180
AND Fi.special_features LIKE '%TRAILERS%'
)
GROUP BY FI.film_id;

SELECT ca.name, COUNT(FI.film_id) as RecuentoPeliculas
FROM film_category AS FICA, film AS FI, category as CA
WHERE CA.category_id = FICA.category_id
AND FICA.film_id = Fi.film_id
AND ca.name
IN
(
SELECT category.name
FROM category, film, film_category
WHERE category.name IN ('Children', 'Classics', 'Comedy')
AND film.length > 90
)
GROUP BY ca.name
ORDER BY RecuentoPeliculas DESC;


SELECT  fi.title, COUNT(a.actor_id) AS RecuentoActores
FROM film as FI INNER JOIN film_category as FIC 
ON FI.film_id = fic.film_id INNER JOIN category as CA
ON FIC.category_id = ca.category_id INNER JOIN film_actor AS FA
ON fi.film_id = FA.film_id INNER JOIN actor AS A
ON FA.actor_id = A.actor_id
WHERE ca.name = 'ACTION'
AND fi.length > 180
GROUP BY fi.title;