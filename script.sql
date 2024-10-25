CREATE TABLE client (
  id numeric(4) PRIMARY KEY,
  nom varchar(50),
  prenom varchar(50),
  mail varchar(50),
  dateNaiss date,
  tel varchar(15),
  adresse varchar(255),
  entreprise boolean,
  historique_id numeric(6) REFERENCES Historique(id)
);

CREATE TABLE voiture (
  id numeric(3) PRIMARY KEY,
  marque varchar(30),
  modele varchar(30),
  annee numeric(4),
  prix_journalier numeric(3,2),
  typeVoiture varchar(30),
  kilometrage numeric(7),
  concession_id varchar(30) REFERENCES concession(ville),
  fournisseur_id varchar(30) REFERENCES fournisseur(entreprise)
);

CREATE TABLE fournisseur (
  entreprise varchar(30) PRIMARY KEY,
  tel varchar(15),
  email varchar(50),
  siege_social varchar(30)
);

CREATE TABLE concession (
  ville varchar(30) PRIMARY KEY,
  pays varchar(20),
  nb_employes numeric(2)
);

CREATE TABLE location (
  client_id numeric REFERENCES client(id),
  voiture_id numeric REFERENCES voiture(id),
  debut date,
  fin date,
  coutTotal numeric(5,2),
  PRIMARY KEY (client_id, voiture_id, debut)
);

CREATE TABLE Historique (
  id numeric(6),
  dateInscription date,
  nbrVoitureLoue numeric(3)
);
