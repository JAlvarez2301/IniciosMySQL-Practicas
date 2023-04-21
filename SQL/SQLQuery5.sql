USE sakila;

/* Producto Cartesiano metodo */ 

SELECT TOP 10 Co.country, Count(CU.customer_id) AS NumClientes,
CASE WHEN COUNT(CU.Customer_id) <30
THEN 'Pocos Clientes' ELSE 'Muchos clientes' END AS IndicadorClientes

/* Esta clausula se refiere, a que cuando la cuenta sea <30,
entonces ponemos pocos clientes, sino muchos, y terminamos con el nombre de la tabla */

FROM customer as CU, country as CO, address as AD, city as CI
WHERE CU.address_id = AD.address_id
AND AD.city_id = ci.city_id
AND ci.country_id = co.country_id
GROUP BY CO.country
ORDER BY NumClientes DESC;

/*Ahora con los JOIN*/

SELECT TOP 10 Co.country, Count(CU.customer_id) AS NumClientes
FROM customer as CU INNER JOIN  address as AD ON CU.address_id = AD.address_id
INNER JOIN city AS CI ON CI.city_id = AD.city_id
INNER JOIN country AS CO ON CO.country_id = ci.country_id
GROUP BY CO.country
ORDER BY NumClientes desc, COUNTRY DESC

SELECT TOP 10  CO.country, Count(ST.staff_id) AS NºSTAFF,
CASE WHEN Count(ST.staff_id) >50
THEN 'MUCHOS' ELSE 'POCOS' END AS IndicadorStaff
FROM STAFF AS ST INNER JOIN address as AD on ST.address_id = AD.address_id
INNER JOIN city AS CI ON AD.city_id = CI.city_id
INNER JOIN country AS CO ON CI.country_id = CO.country_id
group by co.country