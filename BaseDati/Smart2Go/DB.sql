
Utente(_cf:CodiceFiscale_, nome:varchar,cognome:varchar)

Noleggio(_id:serial_, inizio:timestamp,terminato:Boolean,fine:timestamp*,utente:CodiceFiscale,veicolo:varchar)
fk:(utente) references Utente(cf);
fk:(veicolo) references Veicolo(targa)

Veicolo(_targa:varchar_)

Sinistro(_id:serial_,istante:timestamp,veicolo:varchar)
fk: (veicolo) references Veicolo(targa)
_____________________________________________________

CREATE DOMAIN CodiceFiscale as Varchar(16)
CHECK (VALUE ~ '^[A-Z0-9]{16}$');

CREATE TABLE  UTENTE (
    cf CodiceFiscale not null
    nome varchar(100) not null
    cognome varchar(100) not null
    primary key(cf)
)
CREATE TABLE NOLEGGIO(
    id serial not null
    inizio timestamp not null
    terminato Boolean not null
    fine timestamp 
    utente CodiceFiscale not null
    veicolo varchar not null
    primary key(id)
    foreign key(utente) references UTENTE(cf)
    foreign key(veicolo) references VEICOLO(targa)
    CHECK( when terminato is False then fine is null 
    		else fine >inizio)
    END
CREATE TABLE VEICOLO(
    targa varchar(100) not null
    primary key(targa)
)
CREATE TABLE SINISTRO(
    id serial not null
    istante timestamp
    veicolo varchar
    primary key(id)
    foreign key(veicolo) references VEICOLO(targa)
    
REVOKE DELETE Noleggio FROM public  
