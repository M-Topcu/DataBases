--Personel isminde bir tablo olusturalim
CREATE TABLE personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(30),
adres varchar(50)
);
--Varolan personel tablosundan pers_id, sehir, adres fieldlarinasahip personel_adres adinda yeni bir tablo olusturalim
CREATE table personel_adres
as
select pers_id, sehir, adres from personel;

SELECT * from personel;
SELECT * FROM personel_adres;

-- DML --> Data Manipulation Lang.
-- INSERT - UPDATE - DELETE
-- Tabloya veri ekleme - guncelleme - silme komutlari
-- INSERT--
CREATE TABLE student(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student VALUES ('1001','Ali Can',25);
INSERT into student VALUES ('1002','Veli Can',35);
INSERT into student VALUES ('1003','Ayse Can',45);
INSERT into student VALUES ('1004','Derya Can',55);

--Tabloya parcali veri ekleme--
INSERT into student(st_name,age) VALUES ('Murat Can',65);

--DQL --> Data Query Lang.
--Select
SELECT * FROM student;
SELECT st_name from student;

-- Select komutu where kosulu--
SELECT * from student where age>35;

--TCL - Transaction Control Lang.
-- Begin - Savepoint - Rollback - Commit
-- Transaction veritabani sistemleriyle bir islem basladiginda baslar ve islem sona erince biter.
-- Bu islemler veri tabani olusturma, veri silme, veri guncelleme, veriyi geri getirme gibi islemler olabilir

CREATE TABLE ogrenciler2
(
id serial,
isim varchar(50),
veli_isim varchar(50),
yazili_notu real
);
BEGIN;
insert into ogrenciler2 values(default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 values(default,'Canan Gul','Ayse Sen',90.5);
SAVEPOINT x;
insert into ogrenciler2 values(default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 values(default,'Ahmet Sen','Ayse Can',65.5);

ROLLBACK to x;

SELECT * from ogrenciler2;

commit;

-- Transaction kullaniminda serial data turu tavsiye edilmez
-- Savepointten sonra ekledigimiz veriler sayac mantigiyla calistigi icin sayac kaldigi yerden calismaya devam eder
-- NOT: PostgreSQL`de transaction kullanimi icin 'Begin' komutuyla baslariz sonrasinda tekrar yanlis bir veriyi 
-- duzeltmek veya bizim icin onemli olan verilerden sonra ekleme yapabilmek icin 'Savepoint savepointAdi' kullaniriz.
-- Savepoint`e donmek icin de 'ROLLBACK TO savepointIsmi'
-- Rollback calistirildiginda savepoint yazdigimiz satirin ustundeki verileri tabloda bize verir ve son olarak
-- transactionu sonlandirmak icin 'COMMIT' komutu kullaniriz.
-- MySQL`de transaction olmadan da kullanilir

-- DML - DELETE - 
-- DELETE FROM tabloAdi --> Tablonun tum icerigini siler
-- veriyi secerek silmek icin where kullanilir
-- DELETE FROM tabloAdi WHERE sutunAdi = veri --> tablodaki istedigimiz veriyi siler

CREATE TABLE ogrenciler
(
id int,
isim varchar(50),
veli_isim varchar(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123,'Ali Can','Hasan',75);
INSERT INTO ogrenciler VALUES(124,'Merve Gul','Ayse',85);
INSERT INTO ogrenciler VALUES(125,'Kemal Yasa','Hasan',85);
INSERT INTO ogrenciler VALUES(126,'Nesibe Yilmaz','Ayse',95);
INSERT INTO ogrenciler VALUES(127,'Mustafa Bak','Can',99);
INSERT INTO ogrenciler VALUES(127,'Mustafa Bak','Ali',99);

SELECT * from ogrenciler;

-- soru : id`si 124 olan ogrenciyi siliniz
DELETE FROM ogrenciler where id = 124;

-- soru 2 : ismi kemal yasa olan satiri siliniz
DELETE FROM ogrenciler where isim = 'Kemal Yasa';

-- Soru 3 : ismi Nesibe Yilmaz veya Mustafa Bak olan kayitlari silelim
DELETE FROM ogrenciler WHERE isim = 'Nesibe Yilmaz' or isim ='Mustafa Bak';

INSERT INTO ogrenciler VALUES(124,'Merve Gul','Ayse',85);
INSERT INTO ogrenciler VALUES(125,'Kemal Yasa','Hasan',85);
INSERT INTO ogrenciler VALUES(126,'Nesibe Yilmaz','Ayse',95);
INSERT INTO ogrenciler VALUES(127,'Mustafa Bak','Can',99);
INSERT INTO ogrenciler VALUES(127,'Mustafa Bak','Ali',99);

-- soru 4 : ismi Ali Can ve id`si 123 olan kaydi siliniz
DELETE FROM ogrenciler where isim = 'Ali Can' and id = 123;

-- Tablodaki tum verileri silelim
DELETE from ogrenciler;

-- DELETE - TRUNCATE --
-- TRUNCATE komutu delete gibi tablodaki verilerin tamamini siler ancak secmeli silme yapamaz
TRUNCATE table ogrenciler;

-- DDL - Data Definition Lang.
-- CREATE - ALTER - DROP
-- ALTER TABLE --
-- Alter table tabloda ADD, TYPE, SET, RENAME veya DROP COLOMNS islemleri icin kullanilir

-- Personel tablosuna cinsiyet ve yas sutunlari ekleyelim
alter table personel add cinsiyet varchar(20), add yas int;
select * from personel;

-- Personel tablosundan sirket field`ini siliniz
alter table personel drop column sirket;

-- Personel tablosunda sehir sutununun ismini ulke olarak degistirelim
alter table personel rename column sehir to ulke;

-- Personel tablosunun adini isciler olarak degistiriniz
alter table personel rename to isciler;

select * from isciler;

-- DDL - FROP komutu
DROP TABLE isciler;

-- CONSTRAINT -- kisitlamalar
-- Primary Key --> Bir sutunun NULL icermemesi ve unique olmasini saglar
-- Foreign Key --> Baska bir tablodaki Primary Key`i referans gostermek icin kullanilir
-- Boylelikle tablolar arasinda iliski kurmus oluruz.
-- UNIQUE --> Bir sutundaki tum degerlerin tek olmasini saglar
-- NOT NULL --> Bir sutunun bos olmamasini saglar
-- NOT NULL kisitlamasi icin CONSTRAINT ismi tanimlanmaz. Bu kisitlama veri turunden hemen sonra yerlestirilir
-- CHECK --> Bir sutuna yerlestirilenilecek deger araligini sinirlandirmak icin kullanilir.

CREATE TABLE calisanlar
(
id char(5) PRIMARY KEY, -- NOT NULL + UNIQUE
isim varchar(50) UNIQUE,
maas int NOT NULL,
ise_baslama date
);

CREATE TABLE calisanlar2
(
id char(5),
isim varchar(50),
maas int NOT NULL,
ise_baslama date,
CONSTRAINT pk_id PRIMARY KEY(id),
CONSTRAINT ism_unq UNIQUE(isim)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yilmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yilmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

select * from calisanlar;

-- FOREIGN KEY --
CREATE TABLE adresler
(
adres_id char(5),
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;