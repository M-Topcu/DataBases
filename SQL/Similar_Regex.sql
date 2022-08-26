-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmasik pattern ile sorgulama icin SIMILAR TO kullanilabilir.
Sadece PostgreSql` kullanilir. Buyuk kucuk harf onemlidir.

REGEX : Herhangi bir kod, metin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayan 
kendine ait bir soz dizimi olan bir yapidir. MySQL`de (REGEXP_LIKE), PostrgreSQL`de "~" karakteri ile kullanilir.
*/
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
    INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
    INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);

select * from kelimeler

--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya işlemi için | karakteri kullanılır

select * from kelimeler where kelime SIMILAR TO '%(at|ot|At|AT|aT|Ot|oT|OT)%'; -- buyuk kucuk duyarli
select * from kelimeler where kelime ~~* '&at%' or kelime ~~* '%ot%'; 
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';

-- 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
select * from kelimeler where kelime SIMILAR TO '(ho|Ho|hO|HO|hi|HI|Hi|hI)%';
select * from kelimeler where kelime ilike 'ho%' or kelime ilike 'hi%';