--query 1
select w.nome , w.inizio , w.fine
from WP as w , Progetto as pr
where w.progetto = pr.id 
and pr.nome = 'Pegasus'

--query2
--Quali sono il nome, il cognome e la posizione degli strutturati che hanno almeno
--una attività nel progetto ‘Pegasus’, ordinati per cognome decrescente?
select nome,cognome ,posizione
from Persona as pe , AttivitaProgetto as a ,Progetto as pr
where p.id = a.persona
and pr.nome = 'Pegasus'
and pr.id = a.progetto 
and count(a.progetto) >= 1
order by cognome desc 


--query3
select nome,cognome,posizione
from Persona as p , AttivitaProgetto as a
where p.nome = a.persona
and (a.progetto = 'Pegasus' ) 

--query4
select nome,cognome,posizione
from Persona as p, Assenza as a
where p.nome = a.persona
and p.posizione = 'Professore Ordinario'
and a.tipo = 'malattia'