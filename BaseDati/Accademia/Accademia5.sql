--query 1
select w.nome , w.inizio , w.fine
from WP as w , Progetto as pr
where w.progetto = pr.id 
and pr.nome = 'Pegasus';

--query2
select distinct pe.nome,pe.cognome ,pe.posizione
from Persona as pe , AttivitaProgetto as a ,Progetto as pr
where pe.id = a.persona
and pr.nome = 'Pegasus'
and pr.id = a.progetto 
order by cognome desc ;

--query3
select distinct pe.nome,pe.cognome ,pe.posizione
from Persona as pe , AttivitaProgetto as a, AttivitaProgetto as a1 ,Progetto as pr
where pe.id = a.persona
and pr.nome = 'Pegasus'
and pr.id = a.progetto 
and a.persona = a1.persona
and a.id <> a1.id;

--query4
select distinct nome ,cognome, posizione
from Persona as p, Assenza as a
where p.id = a.persona
and p.posizione = 'Professore Ordinario'
and a.tipo = 'Malattia';

--query5
select distinct nome ,cognome, posizione
from Persona as p, Assenza as a , Assenza as a1
where p.id = a.persona
and p.posizione = 'Professore Ordinario'
and a.tipo = 'Malattia'
and a.persona = a1.persona
and a.id <> a1.id ;

--query6
select distinct nome,cognome,posizione
from Persona as p , AttivitaNonProgettuale as a
where p.id = a.persona
and p.posizione = 'Ricercatore'
and a.tipo = 'Didattica';

--query7
select distinct nome ,cognome ,posizione
from Persona as p, AttivitaNonProgettuale as a,AttivitaNonProgettuale as a1
where p.id = a.persona
and p.posizione = 'Ricercatore'
and a.tipo = 'Didattica'
and a.persona = a.persona
and a.id <> a1.id ;

--query8
select  nome, cognome, posizione
from Persona as p, AttivitaNonProgettuale as anp, AttivitaProgetto as ap
where p.id = anp.persona
and anp.persona = ap.persona
and anp.giorno = ap.giorno ;

--query9
select p.nome , p.cognome , ap.giorno , pr.nome as att_prj , ap.OreDurata as h_prj , anp.tipo as att_noprj, anp.OreDurata as h_noprj
from Persona as p , AttivitaProgetto as ap, AttivitaNonProgettuale as anp, Progetto as pr
where p.id = anp.persona
and anp.persona = ap.persona
and anp.giorno = ap.giorno
and ap.progetto = pr.id ;

--query10
select nome , cognome 
from Persona as p , Assenza as a , AttivitaProgetto as ap
where p.id = a.persona
and a.giorno = ap.giorno ;

--query11
select p.nome , p.cognome , a.giorno , a.tipo as causa_ass ,pr.nome as progetto,ap.OreDurata as ore_att_prj
from Persona as p , Assenza as a , AttivitaProgetto as ap , Progetto as pr
where p.id = a.persona
and a.giorno = ap.giorno
and ap.progetto = pr.id ;

--query12
select  distinct w1.nome
from WP as w1 , WP as w2
where w1.nome = w2.nome
and w1.progetto <> w2.progetto ;