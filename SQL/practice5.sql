CREATE TABLE sirketler
(
	sirket_id int,
	sirket_isim VARCHAR(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler
(
	siparis_id int,
	sirket_id int,
	siparis_tarihi DATE
);

INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

SELECT * FROM sirketler;
SELECT * FROM siparisler;

-- SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ve
-- siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT srk.sirket_isim, sip.siparis_id, sip.siparis_tarihi
FROM siparisler sip INNER JOIN sirketler srk
ON srk.sirket_id = sip.sirket_id;

--SORU2: sirketler tablosundaki tum sirketleri(yani isimleri) ve bu sirketlere ait olan
--siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
-- 1. yol left join
SELECT a.sirket_isim, b.siparis_id, b.siparis_tarihi
FROM sirketler a LEFT JOIN siparisler b
ON b.sirket_id = a.sirket_id;

-- 2. yol right join
SELECT b.sirket_isim, a.siparis_id, a.siparis_tarihi
FROM siparisler a RIGHT JOIN sirketler b
ON b.sirket_id = a.sirket_id;

-- SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
-- bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
SELECT a.siparis_id, a.siparis_tarihi, b.sirket_isim
FROM siparisler a LEFT JOIN sirketler b 
ON b.sirket_id = a.sirket_id;
