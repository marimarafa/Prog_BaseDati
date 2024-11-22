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
select p.nome , p.cognome , sum(pr.budget)
from progetto as pr ,AttivitaProgetto as ap , Persona as p
where pr.id = ap.progetto
and p.id = ap.persona
group by pr.id , p.id

--5.Qual è il numero di progetti a cui partecipa ogni
--professore ordinario. Per ogni professore ordinario,
--restituire nome, cognome, numero di progetti nei quali è
--coinvolto 
select p.nome , p.cognome , count(pr.id)
from progetto as pr ,AttivitaProgetto as ap , Persona as p
where pr.id = ap.progetto
and p.id = ap.persona
and p.posizione = 'Professore Ordinario'
group by pr.id,p.id

--6. Qual è il numero di assenze per malattia di ogni
--professore associato. Per ogni professore associato,
--restituire nume, cognome e numero di assenze per
--malattia 
select p.nome , p.cognome , count(a.id) as assenze_malattia
from Assenza as a , Persona as p
where a.persona = p.id
and p.posizione = 'Professore Associato'
and a.tipo = 'Malattia'
group by a.id , p.id

--7. Qual è il numero totale di ore, per ogni persona, dedicate
--al progetto con id ‘5’. Per ogni persona che lavora al
--progetto, restituire nome, cognome e numero di ore totali
--dedicate ad attività progettuali relative al progetto 
select p.nome , p.cognome , sum(ap.OreDurata) as ore_totali_progetto 
from progetto as pr ,AttivitaProgetto as ap , Persona as p
where pr.id = ap.progetto
and p.id = ap.persona
and pr.id = 5
group by p.id

--8. Qual è il numero medio di ore delle attività progettuali
--svolte da ogni persona. Per ogni persona, restituire nome,
--cognome e numero medio di ore delle sue attività
--progettuali (in qualsivoglia progetto)
select p.nome , p.cognome , avg(OreDurata) as num_medio_ore
from AttivitaProgetto as ap , Persona as p
where ap.persona = p.id 
group by ap.OreDurata , p.id

--9. Qual è il numero totale di ore, per ogni persona, dedicate
--alla didattica. Per ogni persona che ha svolto attività
--didattica, restituire nome, cognome e numero di ore totali
--dedicate alla didattica
select p.nome , p.cognome , sum(OreDurata) as num_medio_ore
from AttivitaNonProgettuale as anp , Persona as p
where p.id = anp.persona
group by anp.OreDurata , p.id

--10. Quali sono le persone che hanno svolto attività nel WP
--di id ‘5’ del progetto con id ‘3’. Per ogni persona, restituire
--il numero totale di ore svolte in attività progettuali per il
--WP in questione
select p.nome , p.cognome , OreDurata
from wp , Progetto as pr, Persona as p , AttivitaProgetto as ap
where wp.progetto = pr.id
and wp.id = ap.wp
and ap.persona = p.id 
and pr.id = ap.progetto
and wp.id = 5 
and pr.id = 3
group by p.id , ap.OreDurata

