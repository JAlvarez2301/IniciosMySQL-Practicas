/*
USE AdventureWorks2019;

SELECT *
FROM HumanResources.Employee
WHERE Gender = 'M';

SELECT COUNT(Gender)
FROM HumanResources.Employee
WHERE gender = 'M';

SELECT *
FROM HumanResources.Employee
WHERE Gender = 'F';
*/
/*
SELECT *
FROM HumanResources.Employee
WHERE Gender = 'F'
AND HireDate > '2012';

/*Sleccionar DNI, JobTitle, Fecha de nacimiento y de contratacion de los empleados 
cuy nivel prganizacional sea 1 */
USE AdventureWorks2019;
SELECT NationalIDNumber, JobTitle, BirthDate, HireDate
FROM HumanResources.Employee
WHERE OrganizationLevel = '1';

/*Contar los empleado cuyo nivel de organizacion sea 2*/

SELECT COUNT(OrganizationLevel)
FROM HumanResources.Employee
WHERE	OrganizationLevel = '2';

/* Listar los JobTitle que sean distintos */
SELECT DISTINCT (JobTitle) 
FROM HumanResources.Employee;

/* Indicar el listado de los empleados del sexo masculino
y que son solteros */

SELECT *
FROM HumanResources.Employee
WHERE Gender = 'M' AND MaritalStatus = 'S';
*/
/* Seleccionar el LoginID y fecha de contratacion de los empleados
contratados entre 2011 y 2014
Ordenador de ultima contratación a primera */
USE AdventureWorks2019;
/*
SELECT LoginID, HireDate
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2011' AND '2014'
ORDER BY HireDate DESC;
*/
SELECT *
FROM HumanResources.Employee;
/* Recuento total de horas de vacaciones por organizationLevel*/

SELECT SUM(VacationHours)
FROM HumanResources.Employee
GROUP BY OrganizationLevel;


/*Recuento total de horas de enfermos y genero mujer*/

SELECT SUM(SickLeaveHours)
FROM HumanResources.Employee
WHERE Gender = 'F';

/*ID y DNI del top 3 Hombre soltero con más horas de vacaciones acumuladas*/


SELECT TOP 3  NationalIDNumber, BusinessEntityID, LoginID
FROM HumanResources.Employee
WHERE Gender = 'M' AND MaritalStatus = 'S'
ORDER BY VacationHours desc;


/*LoginID del Design Engineer con menos horas de enfermo*/

SELECT TOP 1 LoginID, SickLeaveHours, JobTitle 
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer'
ORDER BY SickLeaveHours ASC;

/*Maximo de horas enfermo en la empresa*/

SELECT MAX (SickLeaveHours)
FROM HumanResources.Employee;


/* Media total DE HORAS DE VACACIONES DE TODA LA EMPRESA */

SELECT AVG(VacationHours)
FROM HumanResources.Employee;

/* Seleccionar el historial de pagos del Empleado */
SELECT *
FROM HumanResources.EmployeePayHistory;

/* Mostrar ID y rate del top10 */
SELECT TOP 10 Rate, BusinessEntityID
FROM HumanResources.EmployeePayHistory
Order By Rate DESC;

/* Mostrar id y rate del top10, dni y su nivel de organizacion */
/* Para elegir cada tabla, ponemos el nombre o el alias que le hemos
dado delante de su atributo*/
/* AS solo sirve para renombrar, dar alias */

SELECT TOP 10 Pagos.Rate, Pagos.BusinessEntityID,
emp.NationalIDNumber, emp.OrganizationLevel
FROM HumanResources.EmployeePayHistory as Pagos, HumanResources.Employee as emp
ORDER BY Rate DESC;