
Utente(_cf:CodiceFiscale_, nome:varchar,cognome:varchar)

Noleggio(_id:serial_, inizio:timestamp,terminato:Boolean,fine:timestamp*,utente:CodiceFiscale,veicolo:varchar)
fk:(utente) references Utente(cf);
fk:(veicolo) references Veicolo(targa)
check(when terminato = false  then fine is null
        else fine is not null and fine > inizio)

Veicolo(_targa:varchar_)

Sinistro(_id:serial_,istante:timestamp,veicolo:varchar)
fk: (veicolo) references Veicolo(targa)
_____________________________________________________

BEGIN TRANSACTION;

CREATE DOMAIN CodiceFiscale AS VARCHAR(16)
CHECK (VALUE ~ '^[A-Z0-9]{16}$');

CREATE TABLE UTENTE (
    cf CodiceFiscale NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    PRIMARY KEY (cf)
);

CREATE TABLE VEICOLO (
    targa VARCHAR(100) NOT NULL,
    PRIMARY KEY (targa)
);


CREATE TABLE NOLEGGIO (
    id SERIAL NOT NULL,
    inizio TIMESTAMP NOT NULL,
    terminato BOOLEAN NOT NULL,
    fine TIMESTAMP,
    utente CodiceFiscale NOT NULL,
    veicolo VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (utente) REFERENCES UTENTE (cf) DEFERRABLE,
    FOREIGN KEY (veicolo) REFERENCES VEICOLO (targa) DEFERRABLE,
    CHECK (
        (terminato = FALSE AND fine IS NULL) OR 
        (terminato = TRUE AND fine IS NOT NULL AND fine > inizio)
    )
);


CREATE TABLE SINISTRO (
    id SERIAL NOT NULL,
    istante TIMESTAMP NOT NULL,
    veicolo VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (veicolo) REFERENCES VEICOLO (targa) DEFERRABLE
);


REVOKE DELETE ON NOLEGGIO FROM PUBLIC;

COMMIT;
 
