SELECT * from adresler;
SELECT * FROM calisanlar;

--INSERT INTO adresler VALUES ('10012', 'Aga sok', '30. cad', 'Antep'); parent tabloda yok, kabul etmez

SELECT * FROM calisanlar, adresler where calisanlar.id = adresler.adres_id;

-- DROP TABLE calisanlar; parent tablo child`i oldugu icin silmez, once child silinmeli

delete from calisanlar where id='10002'; -- parent oldugu icin silemedi

delete from adresler where adres_id = '10002'; -- sildi

delete from calisanlar where id='10002'; -- simdi sildi

-- ON DELETE CASCADE --
-- Her defasinda once child tablodaki verileri silmek yerine on delete cascade ozelligini aktifleyebiliriz
-- Bunun icin FK olan satirin en sonuna on delete cascade yazmamiz yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE notlar( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
ON DELETE CASCADE
);
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90); 

select * from talebeler;

select * from notlar;

DELETE FROM notlar where talebe_id = '123'; -- child
delete from talebeler where id = '126'; -- parent, on delete cascade kullandigimiz icin silebildik, child da gitti

delete from talebeler; -- notlarin da ici bosaldi

drop table talebeler; -- hata verdi
drop table talebeler cascade; -- sildi

-- Talebeler tablosundaki isim sutununa not null kisitlamasi ekleyelim ve veri tipini varchar(30) yapalim
-- once notlar ve talebeleri tekrar olusturduk

ALTER TABLE talebeler
alter column isim type varchar(30),
alter column isim set not null;

-- talebeler tablosundaki yazili_notu sutununa 60`dan buyuk rakam girebilsin
alter table talebeler add constraint sinir check (yazili_notu>60);

insert into talebeler values('128','Mustafa Can', 'Can',45); -- hata

create table ogrenciler(
id int, 
isim varchar(45),
adres varchar(100),
sinav_notu int
);
Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

select * from ogrenciler;
select * from ogrenci_adres;

--Tablodaki bir sutuna PRIMARY KEY ekleme
alter table ogrenciler add primary key (id); -- isim vermeden

-- Primary key olusturmada 2. yol
alter table ogrenciler add constrait pk_id primary key(id); -- isim vererek

--PK`den sonra FK atamak
alter table ogrenci_adres add foreign key (id) references ogrenciler;
-- Child tabloyu parenttan olusturdugumuz icin sutun adi vermedik

--PK` yi costraint silme
alter TABLE ogrenciler drop CONSTRAINT ogrenciler_pkey; -- Once fk yi yap diyor
alter table ogrenci_adres drop CONSTRAINT ogrenci_adres_id_fkey; -- fk kalkti
alter TABLE ogrenciler drop CONSTRAINT ogrenciler_pkey; -- simdi pk kalkti

-- Yazili notu 85`den buyuk olan talebe bilgilerini getirin
select * from talebeler where yazili_notu>85;

-- SELECT komutunda between kosulu
-- BETWEEN belirtilen 2 veri arasindaki bilgileri listeler
-- belirtilen degerler de dahildir

create table personel
(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

select * from personel where id BETWEEN '1003' and '1005';

-- 2. yol
select * from personel where id >='1003' and id<='1005';

-- Derya Soylu ile Yavuz Bal arasindaki personel bilgisini listeleyiniz
select * from personel where isim between 'Derya Soylu' and 'Yavuz Bal';
-- D ile Y arasini getiriyor

-- Maasi 70000 ve ismi Sena Beyaz olanlari listeleyelim
select * from personel where maas=70000 and isim='Sena Beyaz'; -- bos

--IN : Birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutta yazabilme 
--imkanı verir
--Farklı sütunlar için IN kullanılamaz

--id'si 1001,1002 ve 1004 olan personelin bilgilerini listele
select * from personel WHERE id ='1001' or id ='1002' or id = '1004';

-- 2. YOL
select * from personel WHERE id IN ('1001','1002','1004');

-- Maaşı sadece 70000, 100000 olan personeli listele
select * from personel WHERE maas IN (70000,100000);

