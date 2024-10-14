--query 1
SELECT a.codice , a.nome , count(distinct ap.comp)
FROM ArrPart as ap,Aeroporto as a
WHERE a.codice = ap.arrivo
OR a.codice = ap.partenza
GROUP BY a.codice

--query2
Quanti sono i voli che partono dall’aeroporto ‘HTR’ e hanno una durata di almeno 100 minuti

SELECT 
FROM ArrPart as ap , Aeroporto as a , Volo as v
WHERE ap.partenza = a.codice 
AND ap.partenza = 'HTR'
AND v.codice = ap.codice
AND v.durataMinuti = 100
