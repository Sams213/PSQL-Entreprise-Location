--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id numeric(4,0) NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    mail character varying(50) NOT NULL,
    datenaiss date NOT NULL,
    tel character varying(15) NOT NULL,
    adresse character varying(255) NOT NULL,
    departement numeric(2,0) DEFAULT 99,
    pays character varying(30),
    entreprise boolean DEFAULT false,
    CONSTRAINT client_datenaiss_check CHECK (((CURRENT_DATE - datenaiss) > 6394))
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: concession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concession (
    ville character varying(30) NOT NULL,
    pays character varying(20),
    nb_employes numeric(2,0)
);


ALTER TABLE public.concession OWNER TO postgres;

--
-- Name: fournisseur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fournisseur (
    entreprise character varying(30) NOT NULL,
    tel character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    siege_social character varying(30)
);


ALTER TABLE public.fournisseur OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    client_id numeric NOT NULL,
    voiture_id numeric NOT NULL,
    debut date NOT NULL,
    fin date NOT NULL,
    CONSTRAINT location_check CHECK ((fin > debut))
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: pays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pays (
    nom character varying(30) NOT NULL,
    taxe numeric(4,2)
);


ALTER TABLE public.pays OWNER TO postgres;

--
-- Name: voiture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voiture (
    id numeric(3,0) NOT NULL,
    marque character varying(30) NOT NULL,
    modele character varying(30) NOT NULL,
    annee numeric(4,0) NOT NULL,
    prix_journalierht numeric(7,2) NOT NULL,
    typevoiture character varying(30),
    kilometrage numeric(7,0),
    concession_ville character varying(30) NOT NULL,
    fournisseur_id character varying(30) DEFAULT NULL::character varying,
    caution numeric(8,2) NOT NULL
);


ALTER TABLE public.voiture OWNER TO postgres;

--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: concession concession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concession
    ADD CONSTRAINT concession_pkey PRIMARY KEY (ville);


--
-- Name: fournisseur fournisseur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fournisseur
    ADD CONSTRAINT fournisseur_pkey PRIMARY KEY (entreprise);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (client_id, voiture_id, debut);


--
-- Name: pays pays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (nom);


--
-- Name: voiture voiture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voiture
    ADD CONSTRAINT voiture_pkey PRIMARY KEY (id);


--
-- Name: concession concession_pays_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concession
    ADD CONSTRAINT concession_pays_fkey FOREIGN KEY (pays) REFERENCES public.pays(nom);


--
-- Name: location location_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: location location_voiture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_voiture_id_fkey FOREIGN KEY (voiture_id) REFERENCES public.voiture(id);


--
-- Name: voiture voiture_concession_ville_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voiture
    ADD CONSTRAINT voiture_concession_ville_fkey FOREIGN KEY (concession_ville) REFERENCES public.concession(ville);


--
-- Name: voiture voiture_fournisseur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voiture
    ADD CONSTRAINT voiture_fournisseur_id_fkey FOREIGN KEY (fournisseur_id) REFERENCES public.fournisseur(entreprise);


--
-- PostgreSQL database dump complete
--

