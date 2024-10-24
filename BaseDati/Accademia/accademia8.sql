--query1
Quali sono le persone (id, nome e cognome) che hanno avuto assenze solo nei
giorni in cui non avevano alcuna attivitÃ (progettuali o non progettuali)?

SELECT DISTINCT p.id ,p.nome,p.cognome
FROM Persona as p ,Assenza as a,AttivitaProgetto as ap, AttivitaNonProgettuale as anp
WHERE a.persona = p.id
AND ap.persona = p.id 
AND anp.persona = p.id
AND ap.giorno <> a.giorno
AND anp.giorno <> a.giorno
HAVING count(a.giorno) = 0
