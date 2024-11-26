DROP TABLE location, voiture, concession, fournisseur, client, historique;

CREATE TABLE historique (
  id numeric(6) PRIMARY KEY,
  dateInscription date,
  nbrVoitureLoue numeric(3)
);

CREATE TABLE client (
  id numeric(4) PRIMARY KEY,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  mail varchar(50) NOT NULL,
  dateNaiss date CHECK (current_date - dateNaiss > 6394) NOT NULL,
  tel varchar(15) NOT NULL,
  adresse varchar(255) NOT NULL,
  departement numeric(2) default 99,
  pays varchar(30) NOT NULL,
  entreprise boolean default false,
  historique_id numeric(6) REFERENCES Historique(id)
);

CREATE TABLE fournisseur (
  entreprise varchar(30) PRIMARY KEY,
  tel varchar(15) NOT NULL,
  email varchar(50) NOT NULL,
  siege_social varchar(30)
);

CREATE TABLE concession (
  ville varchar(30) PRIMARY KEY,
  pays varchar(20) NOT NULL,
  nb_employes numeric(2)
);

CREATE TABLE voiture (
  id numeric(3) PRIMARY KEY,
  marque varchar(30) NOT NULL,
  modele varchar(30) NOT NULL,
  annee numeric(4) NOT NULL,
  prix_journalierHT numeric(7,2) NOT NULL,
  prix_journalierTTC numeric(7,2) NOT NULL,
  typeVoiture varchar(30),
  kilometrage numeric(7) NOT NULL, -- a modifier aprés chaque location
  concession_id varchar(30) REFERENCES concession(ville) NOT NULL,
  fournisseur_id varchar(30) REFERENCES fournisseur(entreprise),
  caution numeric(8,2) NOT NULL
);

CREATE TABLE location (
  client_id numeric REFERENCES client(id),
  voiture_id numeric REFERENCES voiture(id),
  debut date NOT NULL,
  fin date NOT NULL,
  PRIMARY KEY (client_id, voiture_id, debut),
  CHECK (fin > debut)
);