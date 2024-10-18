--query1
SELECT v.comp , avg(v.durataMinuti)
FROM  LuogoAeroporto as la , Volo as v , ArrPart as ap
WHERE la.nazione = 'Italy'
AND ap.partenza = la.aeroporto
AND ap.comp = v.comp
AND ap.codice = v.codice 
GROUP BY v.comp

--query2
WITH d_voli as (SELECT codice ,sum(durataMinuti) as durata_voli
FROM Volo 
GROUP BY codice)

SELECT v.comp , avg(v.durataMinuti)
FROM  Volo as v , ArrPart as ap , d_voli
WHERE ap.comp = v.comp
AND ap.codice = v.codice 
GROUP BY v.comp
HAVING  avg(d_voli.durata_voli ) < avg(v.durataMinuti)

--query3
3. Quali sono le città dove il numero totale di voli in arrivo è maggiore del numero
medio dei voli in arrivo per ogni città?

WITH voli_arr as (
    SELECT count(ap.arrivo) as num_voli
    FROM  ArrPArt as ap
)
SELECT la.citta 
FROM LuogoAeroporto as la , ArrPart as ap , voli_arr
WHERE la.aeroporto = ap.arrivo  
GROUP BY la.citta
HAVING count(ap.arrivo) > avg(voli_arr.num_voli)




4. Quali sono le compagnie aeree che hanno voli in partenza da aeroporti in Italia con
una durata media inferiore alla durata media di tutti i voli in partenza da aeroporti
in Italia?
5. Quali sono le città i cui voli in arrivo hanno una durata media che differisce di più
di una deviazione standard dalla durata media di tutti i voli? Restituire città e
durate medie dei voli in arrivo.
6. Quali sono le nazioni che hanno il maggior numero di città dalle quali partono voli
diretti in altre nazioni?