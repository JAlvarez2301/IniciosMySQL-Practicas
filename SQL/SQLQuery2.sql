USE sakila;

SELECT cu.first_name, cu.email, a.address, c.city, CO.country/* elegimos los datos que queremos, eligiendo que atributo queremos de cada tabla */
FROM address AS A, city as C, customer AS CU, country as CO /* Renombramos el nombre de las tablas */
WHERE CU.address_id = A.address_id /* */
AND A.city_id = C.city_id
AND Co.country_id = C.country_id
ORDER BY cu.first_name asc;

/* Hay que unir cada tabla con su foreign key, aquí por ejemplo son 3 tablas, hacen falta cuatro uniones */

SELECT CU.first_name, CU.last_name, PA.amount, ST.last_update
FROM customer as CU, payment as PA, store as ST
WHERE cu.customer_id = pa.customer_id
AND CU.store_id = ST.store_id
AND pa.amount >10
ORDER BY last_update desc;

