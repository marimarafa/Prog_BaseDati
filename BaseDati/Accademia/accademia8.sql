--query1
Quali sono le persone (id, nome e cognome) che hanno avuto assenze solo nei
giorni in cui non avevano alcuna attivitÃ (progettuali o non progettuali)?

select distinct p.id , p.nome , p.cognome
from persona as p 
join assenza  as a 
on a.persona = p.id
full  outer join Attivitanonprogettuale as  anp 
on anp.giorno = a.giorno 
full outer join AttivitaProgetto as atp 
on atp.giorno = a.giorno 
group by p.id
having count (anp.giorno) = 0
and count (atp.giorno)= 0;

      --versione 2

      select id
      from persona
      except 
      (
        select distinct a.persona
        from Assenza as a , AttivitaProgetto as ap
        where a.persona = ap.persona

        union

        select distinct a.persona
        from Assenza as a , AttivitaNonProgettuale as anp
        where a.persona = anp.persona

      )


--query2
SELECT p.id ,p.nome, p.cognome
FROM persona AS p
LEFT outer JOIN AttivitaProgetto AS ap 
ON p.id = ap.persona
LEFT outer JOIN progetto AS pr 
ON pr.id = ap.progetto 
AND pr.nome = 'Pegasus'
GROUP BY p.id
having count(ap.progetto) = 0;

--query3
  with stip_tot as (
    select max(stipendio) as max_stip
    from persona
    WHERE  (posizione ='Professore Associato' or posizione = 'Professore Ordinario')
)
SELECT p.id , p.nome , p.cognome , p.stipendio
FROM persona as p , stip_tot as st
where p.posizione = 'Ricercatore'
and st.max_stip < p.stipendio
group by p.id;

--query4
with bud_tot as (
    select avg(pr.budget) as max_bud
    from progetto  as pr 
	)
	
select p.id,p.nome,p.cognome
from persona as p , progetto  as pr , AttivitaProgetto as ap, bud_tot as bt
where pr.id = ap.progetto
and p.id = ap.persona
and bt.max_bud < pr.budget
group by p.id;

--query5
WITH med_bud as (
  SELECT avg(budget) AS budget_medio
  FROM progetto
),
sum_durata as (
  SELECT progetto, sum(OreDurata) AS ore_totali
  FROM AttivitaProgetto
  GROUP BY progetto
),
med_ore as (
  SELECT avg(ore_totali) AS ore_medio
  FROM sum_durata
)
SELECT pr.id, pr.nome
FROM progetto as pr, AttivitaProgetto as ap, sum_durata as sd, med_bud, med_ore
WHERE pr.id = ap.Progetto
AND pr.id = sd.Progetto
AND pr.budget < med_bud.budget_medio
AND sd.ore_totali > med_ore.ore_medio
GROUP BY pr.id;




