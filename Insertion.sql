-- Valid INSERT statements
INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise)
VALUES (1, 'Martin', 'Jean', 'jean.martin@example.com', '1985-06-15', '0612345678', '10 rue de Paris', 63, 'France', false);

INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise)
VALUES (2, 'Dupont', 'Marie', 'marie.dupont@example.com', '1990-09-20', '0654321098', '20 avenue des Champs', 75, 'France', false);

INSERT INTO voiture (id, marque, modele, annee, prix_journalierHT, prix_journalierTTC, typeVoiture, kilometrage, concession_id, fournisseur_id)
VALUES (101, 'Renault', 'Clio', 2020, 35.00, 42.00, 'Citadine', 5000, 'Paris', 'Renault France');

INSERT INTO voiture (id, marque, modele, annee, prix_journalierHT, prix_journalierTTC, typeVoiture, kilometrage, concession_id, fournisseur_id)
VALUES (102, 'Peugeot', '208', 2019, 30.00, 36.00, 'Citadine', 10000, 'Lyon', 'Peugeot France');

INSERT INTO fournisseur (entreprise, tel, email, siege_social)
VALUES ('Renault France', '0145678901', 'contact@renault.fr', 'Boulogne-Billancourt');

INSERT INTO fournisseur (entreprise, tel, email, siege_social)
VALUES ('Peugeot France', '0145678902', 'contact@peugeot.fr', 'Paris');

INSERT INTO concession (ville, pays, nb_employes)
VALUES ('Paris', 'France', 15);

INSERT INTO concession (ville, pays, nb_employes)
VALUES ('Lyon', 'France', 10);

INSERT INTO location (client_id, voiture_id, debut, fin, coutTotal)
VALUES (1, 101, '2023-11-01', '2023-11-10', 420.00);

INSERT INTO location (client_id, voiture_id, debut, fin, coutTotal)
VALUES (2, 102, '2023-11-05', '2023-11-12', 252.00);

INSERT INTO historique (id, dateInscription, nbrVoitureLoue)
VALUES (1001, '2023-01-01', 5);

INSERT INTO historique (id, dateInscription, nbrVoitureLoue)
VALUES (1002, '2023-02-15', 3);


-- Invalid INSERT statements
INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise, historique_id)
VALUES (1, 'Doe', 'John', 'john.doe@example.com', '1980-01-01', '0611111111', '50 rue Lafayette', 75, 'France', false, 1003); -- Duplicate ID

INSERT INTO voiture (id, marque, modele)
VALUES (103, 'Citroen', 'C3'); -- Missing required fields

INSERT INTO voiture (id, marque, modele, annee, prix_journalierHT, prix_journalierTTC, typeVoiture, kilometrage, concession_id, fournisseur_id)
VALUES (104, 'Ford', 'Focus', 2021, 40.00, 48.00, 'Compact', 8000, 'Paris', 'NonExistentSupplier'); -- Invalid foreign key

INSERT INTO location (client_id, voiture_id, debut, fin, coutTotal)
VALUES (999, 101, '2023-11-20', '2023-11-25', 210.00); -- Invalid foreign key

INSERT INTO fournisseur (entreprise, tel, email, siege_social)
VALUES ('A very long supplier name exceeding the varchar limit', '0123456789', 'email@example.com', 'Paris'); -- Exceeding field length

INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise, historique_id)
VALUES (NULL, 'Null', 'Value', 'null.value@example.com', '1995-05-05', '0678901234', 'Null Street', 33, 'France', false, 1004); -- Null primary key

INSERT INTO client (id, nom, prenom, mail, dateNaiss, tel, adresse, departement, pays, entreprise, historique_id)
VALUES (3, 'Invalid', 'Date', 'invalid.date@example.com', '199-15-15', '0612345678', 'Unknown', 1, 'France', false, 1003); -- Invalid date format

INSERT INTO voiture (id, marque, modele, annee, prix_journalierHT, prix_journalierTTC, typeVoiture, kilometrage, concession_id, fournisseur_id)
VALUES (105, 'Toyota', 'Corolla', 2022, -30.00, -36.00, 'Sedan', 0, 'Paris', 'Toyota Supplier'); -- Negative value

INSERT INTO location (client_id, voiture_id, debut, fin, coutTotal)
VALUES (1, NULL, '2023-11-20', '2023-11-25', 210.00); -- Missing required foreign key

INSERT INTO concession (ville, pays, nb_employes)
VALUES ('NonExistentCity', 'France', 5); -- Invalid foreign key
