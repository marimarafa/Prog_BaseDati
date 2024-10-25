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
WITH num_voli as (
SELECT la.citta , count(ap.arrivo) as num_arr
FROM ArrPart as ap , LuogoAeroporto as la
WHERE ap.arrivo = la.aeroporto
GROUP BY la.citta
),
media_voli as (
    SELECT avg(num_voli.num_arr) as med_arr
    FROM num_voli 
)
SELECT nv.citta , nv.num_arr
FROM num_voli as nv, media_voli as mv
WHERE nv.num_arr > mv.med_arr

--query4
WITH part_ita as (
    SELECT ap.comp , avg(v.durataMinuti) as med_part
    FROM LuogoAeroporto as la , ArrPart as ap , Volo as v
    WHERE la.aeroporto = ap.partenza
    AND v.codice = ap.codice
    AND la.nazione = 'Italy'
    GROUP BY ap.comp
),
media_tot as ( 
    SELECT avg(v.durataMinuti) as med_voli
    FROM LuogoAeroporto as la , ArrPart as ap , Volo as v
    WHERE la.aeroporto = ap.partenza
    AND v.codice = ap.codice
    AND la.nazione = 'Italy'
    )
SELECT pa.comp , mt.med_voli
FROM part_ita as pa , media_tot as mt
WHERE pa.med_part < mt.med_voli

--query5
WITH media_voli as (
SELECT la.citta , avg(v.durataMinuti) as dur_med
FROM LuogoAeroporto as la , Volo as v , ArrPart as ap
WHERE ap.codice = v.codice
AND ap.arrivo = la.aeroporto
GROUP BY la.citta
),
media_tot_voli as (
SELECT v.durataMinuti as sum_tot
FROM Volo as v 
)
SELECT mv.citta , mv.dur_med
FROM media_voli as mv ,media_tot_voli as mtv , Volo as v
GROUP BY mv.citta , mv.dur_med 
HAVING mv.dur_med > (avg(mtv.sum_tot) + STDDEV_SAMP(v.durataMinuti))
OR  mv.dur_med < (avg(mtv.sum_tot) - STDDEV_SAMP(v.durataMinuti))

--query6
WITH num_citta as (
    SELECT nazione,aeroporto, count(citta) as n_citta
    FROM LuogoAeroporto 
    GROUP BY nazione , aeroporto 
)
SELECT DISTINCT nc.nazione, nc.n_citta
FROM LuogoAeroporto as la1 ,LuogoAeroporto as la2,ArrPart as ap,num_citta as nc
WHERE ap.partenza = la1.aeroporto
AND la2.aeroporto = ap.arrivo
AND la1.nazione <> la2.nazione
AND la1.aeroporto <> la2.aeroporto
AND nc.aeroporto = ap.partenza



