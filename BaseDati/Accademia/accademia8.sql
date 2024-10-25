--query1
Quali sono le persone (id, nome e cognome) che hanno avuto assenze solo nei
giorni in cui non avevano alcuna attivitÃ (progettuali o non progettuali)?

SELECT DISTINCT p.id ,p.nome,p.cognome
FROM Assenza as a left outer join AttivitaProgetto as ap,Persona as p
on a.giorno = ap.giorno
WHERE p.id = ap.persona
and a.persona = p.id
and count(a.giorno) = 0