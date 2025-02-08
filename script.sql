DROP TABLE location, voiture, pays, concession, 
fournisseur, client;

CREATE TABLE client (
  id numeric(4) PRIMARY KEY,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  mail varchar(50) NOT NULL,
  dateNaiss date CHECK (current_date - dateNaiss > 6394) NOT NULL,
  tel varchar(15) NOT NULL,
  adresse varchar(255),
  departement numeric(2) default 99,
  pays varchar(30),
  entreprise boolean default false
);

CREATE TABLE fournisseur (
  entreprise varchar(30) PRIMARY KEY,
  tel varchar(15) NOT NULL,
  email varchar(50) NOT NULL,
  siege_social varchar(30)
);

CREATE TABLE pays (
  nom varchar(30) PRIMARY KEY,
  taxe numeric (4,2) CHECK (taxe >= 0)
);

CREATE TABLE concession (
  ville varchar(30) PRIMARY KEY,
  pays varchar(20) REFERENCES pays(nom),
  nb_employes numeric(2)
);

CREATE TABLE voiture (
  id numeric(3) PRIMARY KEY,
  marque varchar(30) NOT NULL,
  modele varchar(30) NOT NULL,
  annee numeric(4) NOT NULL CHECK (annee > 1986 AND annee <= date_part('year', current_date)),
  prix_journalierHT numeric(7,2) NOT NULL CHECK (prix_journalierHT > 0),
  typeVoiture varchar(30),
  kilometrage numeric(7) CHECK (kilometrage >= 0), -- a modifier aprés chaque location
  concession_ville varchar(30) REFERENCES concession(ville) NOT NULL,
  fournisseur_id varchar(30) REFERENCES fournisseur(entreprise) default NULL,
  caution numeric(8,2) NOT NULL CHECK (caution >= 0)
);

CREATE TABLE location (
  client_id numeric(4) REFERENCES client(id),
  voiture_id numeric(3) REFERENCES voiture(id),
  debut date NOT NULL,
  fin date NOT NULL,
  PRIMARY KEY (client_id, voiture_id, debut),
  CHECK (fin > debut)
);


-- INSERT valides

INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise) VALUES 
(1, 'Martin', 'Jean', 'jean.martin@example.com', '1985-06-15', '0612345678', '10 rue de Paris', 63, 'France', false),
(2, 'Halilou', 'Sami', 'sami.halilou@example.com', '1993-02-02', '0612345678', '32 Rue de la roue', 75, 'France',  false),
(3, 'Durant', 'Benjamin', 'benjamin.durant@example.com', '1996-10-26', '0614545678', '24 Rue des meuniers', 32, 'France', true),
(4, 'Rousso', 'Anthony', 'anthony.rousso@example.com', '2000-06-21', '0612346668', '63 BD lafayette', 63, 'France', false),
(5, 'Smith', 'Bob', 'bob.smith@example.com', '1974-12-25', '0654824578', '10 main street', 99, 'USA', false),
(6, 'Fischer', 'Hans', 'hans.fischer@example.com', '1990-09-20', '0654321098', 'Anita-Wiegand-Gasse 77c', 99, 'Germany', true);

INSERT INTO fournisseur (entreprise, tel, email, siege_social) VALUES 
('Audi', '+4930123456789', 'contact@audi.de', 'Ingolstadt'),
('BMW', '+4989987654321', 'contact@bmw.de', 'Munich'),
('Wolkswagen', '+4940112233445', 'contact@wolkswagen.de', 'Wolfsbourg');

INSERT into pays (nom, taxe) VALUES 
('France', 20),
('Allemagne', 19),
('Russie', 18);

INSERT INTO concession (ville, pays, nb_employes) VALUES 
('Paris', 'France', 15),
('Clermont-Ferrand', 'France', 8),
('Berlin', 'Allemagne', 12),
('Moscou', 'Russie', 20);

INSERT INTO voiture (id, marque, modele, annee, prix_journalierHT, typeVoiture, kilometrage, concession_ville, fournisseur_id, caution) VALUES 
(1, 'Audi', 'R8', 2022, 800, 'Supercar', 15000, 'Paris', 'Audi', 8000),
(2, 'BMW', 'M4', 2020, 400, 'Coupe', 25000, 'Paris', 'BMW', 3500),
(3, 'Mercedes-Benz', 'C63 AMG', 2021, 430, 'Berline', 18200, 'Clermont-Ferrand', NULL, 3000),
(4, 'Audi', 'RS7', 2020, 500, 'Berline', 32000, 'Clermont-Ferrand', 'Audi', 6000),
(5, 'BMW', 'M3', 2023, 400, 'Berline', 9530, 'Berlin', 'BMW', 2500),
(6, 'Tesla', 'Roadster', 2024, 1400, 'Coupe Electrique', 3000, 'Berlin', NULL, 12000),
(7, 'Mercedes-Benz', 'G63', 2023, 900, 'SUV', 12000, 'Moscou', NULL, 10000),
(8, 'Porsche', 'Cayenne', 2024, 600, 'SUV', 8000, 'Moscou', 'Wolkswagen', 8000);

INSERT INTO location (client_id, voiture_id, debut, fin) VALUES 
(1, 1, '2024-11-19', '2024-12-05'),
(2, 5, '2024-06-09', '2024-06-12'),
(6, 8, '2024-11-16', '2024-11-27'),
(4, 3, '2024-11-15', '2025-01-17');
