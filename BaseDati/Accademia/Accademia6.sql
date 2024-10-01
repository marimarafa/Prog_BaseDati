-- query1
select p.posizione, count(p.posizione) as numero
from Persona as p
where true
group by p.posizione

--query2
select count(p.stipendio) as numero
from Persona as p
where p.stipendio >= 40000

--query3
select count(p.budget) as numero
from Progetto as p
where p.budget >= 50000
and p.fine < CURRENT_DATE

--query4
select avg(ap.OreDurata)as media,max(ap.OreDurata)as massimo,min(ap.OreDurata) as minimo
from  Progetto as p , AttivitaProgetto as ap
where ap.progetto = p.id
and p.nome = 'Pegasus'

--query5
select p.id as id_persona ,p.nome , p.cognome , avg(ap.OreDurata) as media , min(ap.OreDurata) as minimo , max(ap.OreDurata) as massimo
from AttivitaProgetto as ap, Persona as p, Progetto as pr
where pr.id = ap.progetto
and pr.nome = 'Pegasus'
and ap.persona = p.id
group by p.nome ,p.cognome , p.id

--query6
select p.id as id_persona ,p.nome , p.cognome , sum(anp.OreDurata) as ore_didattica
from AttivitaNonProgettuale as anp,Persona as p
where p.id = anp.persona
and anp.tipo = 'Didattica'
group by p.id

--query7
select avg(p.stipendio) as media , max(p.stipendio) as massimo , min(p.stipendio) as minimo
from Persona as p
where p.posizione = 'Ricercatore'

--query8
select p.posizione , avg(p.stipendio) as media , min(p.stipendio) as minimo , max(p.stipendio) as massimo 
from Persona as p 
group by p.posizione

--query9
select pr.id as id_progetto , pr.nome as progetto , sum(ap.OreDurata) as totale_ore
from Persona as p , AttivitaProgetto as ap , Progetto as pr
where p.nome = 'Ginevra'
and p.cognome = 'Riva'
and ap.persona = p.id
and pr.id = ap.progetto
group by pr.id

--query10
select  pr.id as id_progetto ,pr.nome as progetto
from Progetto as pr ,Persona as p , AttivitaProgetto as ap
where p.id = ap.persona
and pr.id = ap.progetto
group by pr.id 
having count(ap.persona) > 2

--query11
select p.id as id_persona , p.nome ,p.cognome
from Persona as p , AttivitaProgetto as ap
where p.id = ap.persona
and p.posizione = 'Professore Associato'
group by p.id 
having count(ap.progetto) > 1
