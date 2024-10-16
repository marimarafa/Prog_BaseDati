--query1
SELECT p.posizione , avg(p.stipendio),STDDEV_SAMP(p.stipendio)
FROM Persona as p
GROUP BY p.posizione

--query2
WITH r as (
    SELECT AVG(stipendio) as media_stipedio
    FROM Persona
    WHERE posizione = 'Ricercatore'
)
SELECT p.* 
FROM Persona AS p , r
WHERE p.posizione = 'Ricercatore'
  AND p.stipendio > r.media_stipedio

--query3 
WITH s as (
    SELECT p.posizione,
    STDDEV_SAMP(p.stipendio) as dev, 
    avg(p.stipendio) as med
    FROM Persona as p
    GROUP BY p.posizione
)
SELECT p.posizione , count(p.id)
FROM Persona as p , s
WHERE p.stipendio <=(s.med + s.dev) 
AND p.stipendio >=(s.med - s.dev)
AND p.posizione = s.posizione
GROUP BY p.posizione , s.dev 


--query4
SELECT p.* , sum(ap.OreDurata)
FROM Persona as p , AttivitaProgetto as ap
WHERE p.id = ap.persona
GROUP BY p.id 
HAVING sum(ap.OreDurata) >= 20 

--query5 
WITH d_pr as (
    SELECT avg(p.fine - p.inizio) as durata_progetti
    FROM Progetto as p
)
SELECT p.nome
FROM Progetto as p , d_pr
WHERE (p.fine - p.inizio) > d_pr.durata_progetti



--query6
SELECT pr.id , pr.nome , sum(ap.OreDurata) as ore_dimostrazione
FROM AttivitaProgetto as ap , Progetto as pr
WHERE pr.id = ap.progetto
AND pr.fine < CURRENT_DATE
AND ap.tipo = 'Dimostrazione'
GROUP BY pr.id

--query7
 WITH p_as as (
    SELECT count(a.giorno) as malattia_pas
    FROM Persona as p , Assenza as a
    WHERE p.posizione = 'Professore Associato'
    AND p.id = a.persona
    AND a.tipo = 'Malattia'
 )
SELECT p.id , p.nome , p.cognome,  count(a.giorno) as num_giorni_malattia
FROM Persona as p , Assenza as a , p_as
WHERE p.posizione = 'Professore Ordinario'
AND p.id = a.persona
AND a.tipo = 'Malattia'
GROUP BY p.id
HAVING count(a.giorno) > avg(p_as.malattia_pas)