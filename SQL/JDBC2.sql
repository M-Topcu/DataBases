--1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan company ve number_of_employees değerlerini çağırın.

--1. Yol OFFSET ve FETCH NEXT kullanarak
SELECT company, number_of_employees
FROM companies
ORDER BY number_of_employees DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

SELECT * FROM companies;