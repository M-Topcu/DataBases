-- Function olusturma --

-- 1. Ornek: 2 parametre ile calisip bu parametreleri toplayarak donus yapan bir function olusturun
CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC) -- or replace yazmazsak daha onceden boyle bir fonc varsa create yapmaz
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN

RETURN x+y;
END
$$

-- 2. Ornek: Koninin hacmini hesaplayan bir function yazin

CREATE OR REPLACE FUNCTION koniHacim(r NUMERIC, h NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN r*r*3.14*h;
END
$$

SELECT * FROM toplamaF(15,25) AS toplam;
SELECT * FROM konihacim(10,3) AS hacim;
