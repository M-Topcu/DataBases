/*
DDL - DATA DEFINITION LANGUAGEDATA
CREATE - ALTER - DROP
*/
-- CREATE - TABLO OLUSTURMA --
CREATE TABLE ogrenci(
ogr_no int,
ogr_isim VARCHAR(30),
notlar REAL,
yas int,
adres varchar(50),
kayit_tarih date
);
-- VAR OLAN TABLODAN YENI BIR TABLO OLUSTURMA --
CREATE TABLE ogr_notlari
as
SELECT ogr_no, notlar from ogrenci;

SELECT * FROM ogrenci;
SELECT * from ogr_notlari;
