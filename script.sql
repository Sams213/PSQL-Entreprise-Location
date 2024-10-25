CREATE TABLE "client" (
  "id" numeric PRIMARY KEY,
  "nom" varchar,
  "prenom" varchar,
  "mail" varchar,
  "dateNaiss" date,
  "tel" varchar,
  "adresse" varchar,
  "entreprise" bool,
  "historique_id" numeric
);

CREATE TABLE "voiture" (
  "id" numeric PRIMARY KEY,
  "marque" varchar,
  "modele" varchar,
  "annee" numeric,
  "prix_journalier" numeric,
  "type" varchar,
  "kilometrage" numeric,
  "concession_id" numeric,
  "fournisseur_id" numeric
);

CREATE TABLE "fournisseur" (
  "entreprise" varchar PRIMARY KEY,
  "tel" varchar,
  "email" varchar,
  "siege_social" varchar
);

CREATE TABLE "concession" (
  "ville" varchar PRIMARY KEY,
  "pays" varchar,
  "nb_employes" numeric
);

CREATE TABLE "location" (
  "client_id" numeric,
  "voiture_id" numeric,
  "debut" date,
  "fin" date,
  "coutTotal" numeric,
  PRIMARY KEY ("client_id", "voiture_id", "debut")
);

CREATE TABLE "Historique" (
  "id" numeric,
  "dateInscription" date,
  "nbrVoitureLoue" numeric
);

ALTER TABLE "location" ADD FOREIGN KEY ("client_id") REFERENCES "client" ("id");

ALTER TABLE "location" ADD FOREIGN KEY ("voiture_id") REFERENCES "voiture" ("id");

ALTER TABLE "voiture" ADD FOREIGN KEY ("concession_id") REFERENCES "concession" ("ville");

ALTER TABLE "voiture" ADD FOREIGN KEY ("fournisseur_id") REFERENCES "fournisseur" ("entreprise");

ALTER TABLE "client" ADD FOREIGN KEY ("historique_id") REFERENCES "Historique" ("id");
