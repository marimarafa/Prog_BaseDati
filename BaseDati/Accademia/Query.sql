--1. Quali sono le persone con stipendio di al massimo 40000 euro 
select  *
from persona
where stipendio >= 40000

--2ricercatori che lavorano ad almeno un progetto e hanno uno stipendio di al massimo 40000
select p.id  , p.nome ,p.cognome
from attivitaProgetto as ap, progetto as pr, persona as p
where ap.progetto = pr.id
and ap.persona = p.id 
and p.posizione = 'Ricercatore'
group by ap.progetto , p.id
having count(ap.progetto) >= 1 

--3.Qual è il budget totale dei progetti nel db
select sum(budget) as budget_totale
from progetto

--4. Qual è il budget totale dei progetti a cui lavora ogni
--persona. Per ogni persona restituire nome, cognome e
--budget totale dei progetti nei quali è coinvolto. 


z