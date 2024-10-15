--query 1
SELECT a.codice , a.nome , count(distinct ap.comp)
FROM ArrPart as ap,Aeroporto as a
WHERE a.codice = ap.arrivo
OR a.codice = ap.partenza
GROUP BY a.codice;

--query2
SELECT count(ap.partenza) as num_voli
FROM ArrPart as ap  , Volo as v
WHERE ap.partenza = 'HTR'
AND v.codice = ap.codice
AND v.durataMinuti >= 100;

--query3
SELECT la.nazione, count(distinct la.aeroporto) as num_aeroporti
FROM LuogoAeroporto as la , ArrPart as ap
WHERE la.aeroporto = ap.partenza
AND ap.comp = 'Apitalia'
GROUP BY la.nazione;

--query4
SELECT avg(v.durataMinuti) as media , max(v.durataMinuti)as massimo, min(v.durataMinuti) as minimo
FROM Volo as v 
WHERE v.comp = 'MagicFly';

--query5
SELECT a.codice , a.nome , min(c.annoFondaz)
FROM Compagnia as c , Aeroporto as a , ArrPart as ap
WHERE ap.comp = c.nome 
AND a.codice = ap.partenza
GROUP BY (a.codice);

--query6 ////
SELECT la.nazione , count(distinct ap.partenza)
FROM LuogoAeroporto as la , ArrPart as ap ,LuogoAeroporto as la2
WHERE la.aeroporto = ap.partenza
AND ap.arrivo = la2.aeroporto
GROUP BY la.nazione;

--query7
SELECT a.codice , a.nome, avg(v.durataMinuti)
FROM Volo as v ,  ArrPart as ap , Aeroporto as a
WHERE v.codice = ap.codice
AND ap.partenza = a.codice
GROUP BY a.codice;

--query8
SELECT c.nome , sum(v.durataMinuti)
FROM Volo as v , Compagnia as c 
WHERE c.annoFondaz >= 1950
AND v.comp = c.nome
GROUP BY c.nome;

--query9 ////
SELECT a.codice, a.nome
FROM Aeroporto as a , ArrPart as ap
WHERE a.codice = ap.partenza
GROUP BY a.codice
HAVING count(DISTINCT ap.comp) = 2;

--query10
SELECT la.citta
FROM LuogoAeroporto as la 
GROUP BY  la.citta
HAVING count(la.aeroporto) >= 2;

--qquery11
SELECT c.nome
FROM Compagnia as c , Volo as v 
WHERE c.nome = v.comp
GROUP BY  c.nome
HAVING avg(v.durataMinuti) > 6 * 60;

--query12
SELECT c.nome
FROM Compagnia as c , Volo as v
WHERE v.comp = c.nome
GROUP BY c.nome
HAVING min(v.durataMinuti) > 100;