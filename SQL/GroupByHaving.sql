/*
-- GROUP BY -- HAVİNG --
HAVING ifadesinin işlevi WHERE ifadesininkine çok benziyor. Ancak kümeleme fonksiyonları ile
WHERE ifadesi birlikte kullanılmadığında HAVING ifadesine ihtiyac duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır

*/

--Maaş ortalaması 30000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, round(avg(maas)) as ort_maas from personel where cinsiyet = 'E' and maas>30000 group by ulke;
select ulke, round(avg(maas)) as ort_maas from personel where cinsiyet = 'E' group by ulke having avg(maas)>30000;

--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
select ulke, round(avg(maas)) as ort_maas from personel WHERE cinsiyet='E' group by ulke having count(*)>1;