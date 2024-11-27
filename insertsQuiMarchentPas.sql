-- INSERT QUI DOIVENT PAS FONCTIONNER

INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise, historique_id)
VALUES (1, 'Doe', 'John', 'john.doe@example.com', '1980-01-01', '0611111111', '50 rue Lafayette', 75, 'France', false, 1003); -- Erreur avec l'ID

INSERT INTO voiture (id, marque, modele)
VALUES (103, 'Citroen', 'C3'); -- Eléments qui manquent

INSERT INTO voiture (id, marque, modele, annee, prix_journalierHT, prix_journalierTTC, typeVoiture, kilometrage, concession_id, fournisseur_id)
VALUES (104, 'Ford', 'Focus', 2021, 40.00, 48.00, 'Compact', 8000, 'Paris', 'NonExistentSupplier'); -- Clé étrangere invalide

INSERT INTO location (client_id, voiture_id, debut, fin, coutTotal)
VALUES (999, 101, '2023-11-20', '2023-11-25', 210.00); -- Clé étrangere invalide

INSERT INTO fournisseur (entreprise, tel, email, siege_social)
VALUES ('Le nom ici est trop long pour le limite de ID', '0123456789', 'email@example.com', 'Paris'); -- Champ trop grands pour la clé primaire

INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise, historique_id)
VALUES (NULL, 'Null', 'Value', 'null.value@example.com', '1995-05-05', '0678901234', 'Null Street', 33, 'France', false, 1004); -- Clé primaire ne doit pas etre null

INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise, historique_id)
VALUES (3, 'Invalid', 'Date', 'invalid.date@example.com', '199-15-15', '0612345678', 'Unknown', 1, 'France', false, 1003); -- Le format de date est invalide

INSERT INTO voiture (id, marque, modele, annee, prix_journalierHT, prix_journalierTTC, typeVoiture, kilometrage, concession_id, fournisseur_id)
VALUES (105, 'Toyota', 'Corolla', 2022, -30.00, -36.00, 'Sedan', 0, 'Paris', 'Toyota Supplier'); -- Nombre négatif invalide

INSERT INTO location (client_id, voiture_id, debut, fin, coutTotal)
VALUES (1, NULL, '2023-11-20', '2023-11-25', 210.00); -- Pas de clé étrangere
