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
select * from kelimeler where kelime ~* 'h[oi](.*)' -- Regexte . bir karakteri temsil eder, koseli parantez de tek karakter icin secenekler

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
select * from kelimeler where kelime SIMILAR TO '%t|%m|%M|%T';
select * from kelimeler where kelime ~~* '%t' or kelime ~~* '%m';
select * from kelimeler where kelime ~* '(.*)[mt]$'; -- $ bitisi gosterir

--h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
select kelime from kelimeler where kelime SIMILAR TO '(H|h)[a-z, A-Z, 0-9](t|T)';
select kelime from kelimeler where kelime ~~* 'h_t';
select kelime from kelimeler where kelime ~* 'h(.)t$';

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan 
--“kelime" değerlerini çağırın.
SELECT kelime from kelimeler where kelime SIMILAR TO '(h|H)[a-e,A-E]%(T|t)';
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t';

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~* '^[say](.*)'; -- ^ baslangici temsil eder

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~* '[maf]$';

-- İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
select * from kelimeler where kelime similar to 'h[a|i]t';
select * from kelimeler where kelime ~ '^h[a|i]t$';

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın. 
select kelime from kelimeler WHERE kelime ~ '^[b-s].l(.*)';

--içerisinde en az 2 adet o o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[oO]%[oO]%';
select * from kelimeler where kelime similar to '%[oO]{2}%'; -- Süslü parantez içinde belirttiğimiz rakam bir önceki 
                                                           --köşeli parantez içinde kaçtane olduğunu belirtir

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[oO]{4}%'; -- yan yana 4 tane

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~* '^[a|s|y](.*)[m|f]$';