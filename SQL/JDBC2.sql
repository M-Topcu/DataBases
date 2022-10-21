--1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan company ve number_of_employees değerlerini çağırın.

--1. Yol OFFSET ve FETCH NEXT kullanarak
SELECT company, number_of_employees
FROM companies
ORDER BY number_of_employees DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

--Subquery ile
SELECT company, number_of_employees 
FROM companies
WHERE number_of_employees = (SELECT MAX(number_of_employees) 
							 FROM companies
							 WHERE number_of_employees < (SELECT MAX(number_of_employees) FROM companies));


-- Örnek: number_of_employees degeri ortalamadan az olan number_of_employees degerlerini 16000 olarak update edin
UPDATE companies
SET number_of_employees = 16000
WHERE number_of_employees < (SELECT AVG(number_of_employees) FROM companies);

-- Ornek: Prepared Statement kullanarak company adi IBM olan number_of_employees degerini 9999 olarak guncelleyin
UPDATE companies
SET number_of_employees = 9999
WHERE company = 'IBM';



SELECT * FROM companies;