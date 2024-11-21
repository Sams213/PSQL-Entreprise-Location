--1. Quels produits ne sont plus en stock ? Qui fournit ces produits ?


--2. Quels clients du Puy-de-Dôme ont loué un produit la semaine dernière ?
SELECT DISTINCT c.id, c.nom, c.prenom, c.mail
FROM location l
JOIN client c ON l.client_id = c.id
JOIN voiture v ON l.voiture_id = v.id
JOIN concession con ON v.concession_id = con.ville
WHERE c.departement = 63
AND l.debut >= CURRENT_DATE - INTERVAL '1 WEEK'
AND l.debut <= CURRENT_DATE;

--3. Quels sont les pays dans lesquels l’entreprise a des clients ?
SELECT DISTINCT c.pays
FROM client c
JOIN voiture v ON c.id = v.id
JOIN concession con ON v.concession_id = con.ville;

--4. Pour un fournisseur de votre choix, lister les produits qu’il fournit ainsi que leur prix de location hors taxe (HT) et taxes comprises (TTC)
SELECT v.marque, v.modele, v.typeVoiture, v.prix_journalierHT AS prix_HT,
       v.prix_journalierTTC AS prix_TTC
FROM voiture v
JOIN fournisseur f ON v.fournisseur_id = f.entreprise
WHERE f.entreprise = 'BMW';

--5. Y a-t-il des articles qui n’ont jamais été loués ? Si oui, lesquels ?
SELECT v.marque, v.modele, v.typeVoiture
FROM voiture v
LEFT JOIN location l ON v.id = l.voiture_id
WHERE l.voiture_id IS NULL;

--6. Quel est le produit le plus cher ?
SELECT v.marque, v.modele, v.prix_journalierTTC
FROM voiture v
ORDER BY v.prix_journalierTTC DESC
LIMIT 1;

--Le moins cher
SELECT v.marque, v.modele, v.prix_journalierTTC
FROM voiture v
ORDER BY v.prix_journalierTTC ASC
LIMIT 1;
