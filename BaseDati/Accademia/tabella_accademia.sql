CREATE DATABASE Accademia:

CREATE TYPE Strutturato AS ENUM (
    'Ricercatore', 'Professore Associato', 'Professore Ordinario');
    
CREATE TYPE LavoroProgetto AS ENUM (
    'Ricerca e Sviluppo', 'Dimostrazione', 'Management', 'Altro');
    
CREATE TYPE LavoroNonProgettuale AS ENUM ('Didattica', 'Ricerca', 'Missione', 'Incontro Dipartimentale', 'Incontro                      
    Accademico', 'Altro');
    
CREATE TYPE CausaAssenza AS ENUM (
    'Chiusura Universitaria', 'Maternità', 'Malattia');
    
CREATE DOMAIN PosInteger AS Integer
    default 0
    check (value >= 0)
    
CREATE TYPE StringaM AS String
    varchar(100)
    
CREATE DOMAIN NumeroOre AS Integer
    default 0
    check (value >= 0 and value <= 8)

CREATE DOMAIN DENARO AS Real
    default 0
    check (value >= 0)
    

    
CREATE TABLE Persona (
    id NOT NULL,
    nome CHARACTER varying (100) NOT NULL,
    cognome CHARACTER varying (100) NOT NULL,
    posizione Strutturato,
    stipendio Integer default 0,
    PRIMARY KEY (id)
);

CREATE TABLE Progetto(
    id NOT NULL,
    nome CHARACTER varying (100) NOT NULL,
    inizio DATE,
    fine DATE,
    budget Integer default 0,
    unique (nome),
    CONSTRAINT chk_inizio_fine CHECK (inizio < fine),
    PRIMARY KEY (id)

);

CREATE TABLE WP (
    progetto NOT NULL,
    id NOT NULL,
    nome CHARACTER varying (100) NOT NULL,
    inizio DATE,
    fine DATE,
    CONSTRAINT chk_inizio_fine CHECK (inizio < fine),
    UNIQUE (progetto,nome),
    foreing KEY (progetto) AS reference Progetto (id)

);


CREATE TABLE AttivitaProgetto (
id NOT NULL,
persona NOT NULL,
proggetto NOT NULL,
wp NOT NULL,
giorno DATE,
OreDurata NumeroOre,
tipo LavoroProgetto,
PRIMARY KEY (wp),
foreingn KEY (persona) AS reference Persona(id),
foreingn KEY (progetto) AS reference Progetto(id)


);


CREATE TABLE AttivitaNonProgettuale (
id NOT NULL,
persona NOT NULL,
tipo LavoroNonProgettuale,
giorno DATE,
OreDurata NumeroOre,
foreingn KEY (persona) AS reference Persona(id)

);



CREATE TABLE Assenza (
id NOT NULL,
persona NOT NULL,
tipo CausaAssenza,
giorno DATE,
UNIQUE(persona,giorno),
foreingn KEY (persona) AS reference Persona(id)

);



