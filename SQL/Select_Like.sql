/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli (pattern) kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir
*/
select * from personel;

-- Ismi A harfi ile baslayan personeli listele
select * from personel WHERE isim like 'A%';

-- Ismi t harfi ile biten personeli listele
select * from personel WHERE isim like '%t';

-- Isminin 2. harfi e olan personeli listeleyiniz
select * from personel WHERE isim like '_e%'

-- 'a' ile baslayip 'n' ile biten personel isimlerini listeleyiniz
select isim from personel where isim ~~* 'a%n';

-- 2. karakteri 'a' ve 4. karakteri 'u' olan personel isimlerini listeleyin
select isim from personel where isim ~~ '_a_u%';

-- icinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%r%';

-- 2. harfi 'e' olup diger harflerinde 'y' olan personeli listeleyiniz
select * from personel where isim ~~* '_e%y%';

-- a harfi olmayan personeli listeleyin
select * from personel where isim !~~* '%a%';

-- 1. ve 7. harfi a olan personali listeleyin
select * from personel where isim ~~* 'a_____a%';

-- Sondan 2. karakteri r olan isim degerlerini listeleyin
select isim from personel where isim ~~ '%r_'; 