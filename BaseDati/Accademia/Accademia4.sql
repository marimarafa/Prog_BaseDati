CREATE DATABASE Accademia:
--query1
select distinct cognome
from Persona
where true;

--query2
select nome,cognome
from Persona
where posizione = 'Ricercatore';

--query3
select id,nome,cognome
from Persona
where posizione = 'Professore Associato' and cognome like 'V%';

--query4
select id,nome,cognome
from Persona
where (posizione ='Professore Associato' or posizione = 'Professore Ordinario') and cognome like 'V%';

--query5
select *
from Progetto
where fine < CURRENT_DATE ;

--query6
select nome
from Progetto
where true
order by inizio asc;

--query7
select nome
from WP
where true
order by nome  asc;

--query8
select distinct tipo
from Assenza
where true;

--query9
select distinct tipo
from AttivitaProgetto
where true;

--query10
select distinct giorno
from AttivitaNonProgettuale
where tipo = 'Didattica'
order by giorno asc;
