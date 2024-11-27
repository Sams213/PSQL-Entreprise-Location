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
