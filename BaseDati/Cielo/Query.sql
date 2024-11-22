--query1
select ap.comp  
from ArrPart as ap , LuogoAeroporto as la
where la.aeroporto = ap.arrivo
and la.citta = 'New York'

--query2
select comp , avg(durataMinuti)
from Volo  
group by comp

--query3
select a.nome , la.citta
from LuogoAeroporto as la , Aeroporto as a
where la.aeroporto = a.codice
and citta = 'Germania'

--query4
select distinct c.nome , c.annoFondaz
from Volo as v , Compagnia as c
where v.comp = c.nome
and (v.durataMinuti * 60) >= 3

--query5
select count(nome)
from Compagnia
where annoFondaz is not null

--query6
select annoFondaz , count(nome)
from Compagnia  
group by annoFondaz
having count(nome) >= 1

--query7
with VoloConCambio as (
    select 
    from LuogoAeroporto as la1 , LuogoAeroporto as la2 
    where 
)

--query8

--query9

--query10
select max(annoFondaz) as anno_ultima_compagnia
from Compagnia 






