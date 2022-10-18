-- sql_practise 1                                                                             
create table personel                                                                         
(                                                                                             
id serial primary key  ,   -- serial id yi auto increment gibi otomatik artirir                                                                  
isim  varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
                                                                                              
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                 
insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

-- 1) Tablo bilgilerini listeleyiniz.
select * from personel;

-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
SELECT isim,yas,maas FROM personel;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
SELECT * FROM personel WHERE id=8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
SELECT isim,yas,email FROM personel WHERE id=5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE yas>30;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE maas<>21000;

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE isim ILIKE 'A%';

-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE isim ILIKE '%n';

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE email LIKE '%gmail.com';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE email NOT LIKE '%gmail.com';
--% ile arama yaptigimiz için null gelmez

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE id IN (3,5,7,9);

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE yas NOT IN (39,48,54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE yas BETWEEN 30 AND 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE yas NOT BETWEEN 30 AND 40;

-- 15) emaili null olan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE email IS NULL;

-- 16) personel bilgilerini yaşa göre sıralayınız.
SELECT * FROM personel ORDER BY yas ASC;

-- 17) personel bilgilerini maaşa göre sıralayınız.
SELECT maas FROM personel ORDER BY maas;

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
SELECT yas FROM personel ORDER BY yas DESC;

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
SELECT maas FROM personel ORDER BY maas DESC;

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
SELECT * FROM personel ORDER BY maas DESC LIMIT 3;