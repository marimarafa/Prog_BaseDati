--1. Quali sono le compagnie che hanno voli che atterrano in
un qualche aeroporto di New York
select ap.comp  
from ArrPart as ap , LuogoAeroporto as la
where la.aeroporto = ap.arrivo
and la.citta = 'New York'

--2. Qual è la durata media di un volo di ogni compagnia
--(restituire nome della compagnia e durata media dei suoi
--voli)
select comp , avg(durataMinuti)
from Volo  
group by comp

--3. Quali sono gli aeroporti (restituire, nome e città) situati in Germania
select a.nome , la.citta
from LuogoAeroporto as la , Aeroporto as a
where la.aeroporto = a.codice
and la.nazione = 'Germania'

--4. Quali sono le compagnie (restituire nome e anno di
--fondazione) che hanno voli di durata di meno di 3 ore
select distinct c.nome , c.annoFondaz
from Volo as v , Compagnia as c
where v.comp = c.nome
and (v.durataMinuti * 60) >= 3

--5. Quante sono le compagnie aeree di cui si conosce l’anno
--di fondazione
select count(nome)
from Compagnia
where annoFondaz is not null

--6. Quante sono le compagnie aeree fondate ogni anno. Per
--ogni anno nel quale è stata fondata almeno una
--compagnia, restituire l’anno e il numero di compagnie
--fondate in quell’anno
select annoFondaz , count(nome)
from Compagnia  
group by annoFondaz
having count(nome) >= 1

--7. Quali sono i piani di volo con un cambio che collegano
--Roma a New York in al più 6 ore (escludendo il tempo del
--cambio)
SELECT  v1.codice , v2.codice ,ap1.partenza ,ap1.arrivo,
        ap2.arrivo,(v1.durataMinuti + v2.durataMinuti) AS durata_totale
FROM ArrPart AS ap1,ArrPart AS ap2 ,Volo AS v1 ,Volo AS v2 ,LuogoAeroporto AS la1  ,LuogoAeroporto AS la2 
WHERE ap1.arrivo = ap2.partenza
    AND ap1.codice = v1.codice 
    AND ap2.codice = v2.codice 
    AND ap1.partenza = la1.aeroporto
    AND ap2.arrivo = la2.aeroporto
    ANd la1.citta = 'Roma' 
    AND la2.citta = 'New York' 
    AND (v1.durataMinuti + v2.durataMinuti) * 60 <= 6

--8. Quanti sono, in totale, i piani di volo con un cambio (con entrambi i voli della stessa compagnia) che collegano
--Roma a New York in meno di 6 ore
SELECT  v1.codice ,v1.comp , v2.codice , v2.comp,ap1.partenza ,ap1.arrivo,
        ap2.arrivo,(v1.durataMinuti + v2.durataMinuti) AS durata_totale
FROM ArrPart AS ap1,ArrPart AS ap2 ,Volo AS v1 ,Volo AS v2 ,LuogoAeroporto AS la1  ,LuogoAeroporto AS la2 
WHERE ap1.arrivo = ap2.partenza
    AND ap1.codice = v1.codice and  ap1.comp = v1.comp
    AND ap2.codice = v2.codice and ap2.comp = v2.comp
	AND ap1.comp = ap2.comp
    AND ap1.partenza = la1.aeroporto
    AND ap2.arrivo = la2.aeroporto
    ANd la1.citta = 'Roma' 
    AND la2.citta = 'New York' 
    AND (v1.durataMinuti + v2.durataMinuti) * 60 >= 6

--Quali sono i piani di volo con un cambio in Olanda e voli della stessa compagnia che collegano Roma a New York in
--meno di 6 ore di volo (escludendo il tempo di cambio). ordinare i voli per nome della compagnia crescente

SELECT  v1.codice ,v1.comp , v2.codice , v2.comp,ap1.partenza ,ap1.arrivo,
        ap2.arrivo,(v1.durataMinuti + v2.durataMinuti) AS durata_totale
FROM ArrPart AS ap1,ArrPart AS ap2 ,Volo AS v1 ,Volo AS v2 ,LuogoAeroporto AS la1  ,LuogoAeroporto AS la2 ,LuogoAeroporto as la3
WHERE ap1.arrivo = ap2.partenza
    AND la3.aeroporto = ap1.arrivo
    AND ap1.codice = v1.codice and  ap1.comp = v1.comp
    AND ap2.codice = v2.codice and ap2.comp = v2.comp
	AND ap1.comp = ap2.comp
    AND ap1.partenza = la1.aeroporto
    AND ap2.arrivo = la2.aeroporto
    ANd la1.citta = 'Roma' 
    AND la2.citta = 'New York' 
    AND la3.citta = 'Olanda'
    AND (v1.durataMinuti + v2.durataMinuti) * 60 >= 6
ORDER BY 
    v1.comp ASC;

--10. Qual è l’anno nel quale è stata fondata l’ultima compagnia aerea presente nel db
select max(annoFondaz) as anno_fond_ultima_compagnia
from Compagnia 






