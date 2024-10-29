--query1
select pp.id , pp.nome ,pp.cognome
  from Persona as pp , (
    select p.id 
    from persona as p
    
    except 

    (
      select distinct ass.persona
      from(Assenza as ass left outer join AttivitaProgetto as ap
      on ass.persona = ap.persona 
        and ass.giorno = ap.giorno
        ) left outer join AttivitaNonProgettuale as anp
        on ass.persona = anp.persona
          and ass.giorno = anp.giorno
      where
        ap.id is not null or anp.id is not null
    )
  ) p
  where p.id = pp.id

      --versione 2
      select pp.id , pp.nome ,pp.cognome
      from Persona as pp , (
        select p.id 
        from persona as p
        
        except 

        (
          select distinct ass.persona
          from(Assenza as ass left outer join AttivitaProgetto as ap
          on ass.persona = ap.persona 
            and ass.giorno = ap.giorno
            ) left outer join AttivitaNonProgettuale as anp
            on ass.persona = anp.persona
              and ass.giorno = anp.giorno
          where
            ap.id is not null or anp.id is not null
        )
      ) p
      where p.id = pp.id



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




