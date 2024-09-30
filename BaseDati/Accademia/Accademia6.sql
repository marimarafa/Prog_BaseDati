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










6. Qual è il numero totale di ore dedicate alla didattica da ogni docente?
7. Qual è la media, il massimo e il minimo degli stipendi dei ricercatori?
8. Quali sono le medie, i massimi e i minimi degli stipendi dei ricercatori, dei professori
associati e dei professori ordinari?
9. Quante ore ‘Ginevra Riva’ ha dedicato ad ogni progetto nel quale ha lavorato?
10. Qual è il nome dei progetti su cui lavorano più di due strutturati?
11. Quali sono i professori associati che hanno lavorato su più di un progetto?

