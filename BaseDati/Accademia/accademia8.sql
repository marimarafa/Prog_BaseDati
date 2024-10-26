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

--query2
SELECT p.id ,p.nome, p.cognome
FROM persona AS p
LEFT outer JOIN AttivitaProgetto AS ap ON p.id = ap.persona
LEFT outer JOIN progetto AS pr ON pr.id = ap.progetto 
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
group by p.id

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
group by p.id

--query5
5. Quali sono i progetti con un budget inferiore allala media, ma con un numero
complessivo di ore dedicate alle attività di ricerca sopra la media?

select
from progetto as pr, 
where



