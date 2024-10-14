--query1
select codice,comp
from Volo
where durataMinuti > 3*60;

--query2
select distinct comp
from Volo
where durataMinuti > 3*60;

--query3
select codice,comp
from ArrPart
where partenza = 'CIA';

--query4
select distinct comp
from ArrPart
where arrivo = 'FCO';

--query5
select codice ,comp
from ArrPart
where partenza = 'FCO'
and arrivo = 'JFK';

--query6
select comp
from ArrPart
where partenza = 'FCO'
and arrivo = 'JFK';

--query7
select distinct comp
from LuogoAeroporto as l1, LuogoAeroporto as l2, ArrPart as a
where l1.citta = 'Roma'
and l2.citta = 'New York'
and l1.aeroporto = a.partenza 
and l2.aeroporto = a.arrivo;

--query8
select ar.codice as codiceIATA , ar.nome,l.citta
from ArrPart as a , Aeroporto as ar,LuogoAeroporto as l
where a.comp = 'MagicFly'
and a.partenza = ar.codice
and l.aeroporto = ar.codice;

--query9
select a.codice , a.comp , a.partenza , a.arrivo
from ArrPart as a, LuogoAeroporto as l1,LuogoAeroporto as l2
where a.partenza = l1.aeroporto
and l1.citta = 'Roma'
and a.arrivo = l2.aeroporto
and l2.citta = 'New York'

--query10
select distinct a1.comp ,a1.codice as codice_volo1, a1.partenza, a1.arrivo as scalo, a2.codice as codice_volo2, a2.arrivo
from ArrPart as a1 ,ArrPart as a2 , LuogoAeroporto as l1 ,LuogoAeroporto as l2 
where a1.partenza = l1.aeroporto
and l1.citta = 'Roma'
and a2.arrivo = l2.aeroporto
and l2.citta = 'New York'
and a1.comp = a2.comp
and a1.arrivo = a2.partenza 

--query11
select comp
from  Compagnia as c, ArrPart as a
where a.partenza = 'FCO'
and a.arrivo = 'JFK'
and a.comp = c.nome
and c.annoFondaz is NOT NULL

