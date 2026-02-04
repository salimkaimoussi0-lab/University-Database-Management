-- ------------------------------------------------------------
-- CREATION DES TABLES
-- ------------------------------------------------------------

DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS examen;
DROP TABLE IF EXISTS inscription;
DROP TABLE IF EXISTS cours;
DROP TABLE IF EXISTS etudiant;
DROP TABLE IF EXISTS enseignant;
DROP TABLE IF EXISTS departement;
DROP TABLE IF EXISTS session_examen;

-- Table departement
CREATE TABLE departement (
    id_departement INT PRIMARY KEY,
    nom_departement VARCHAR(100) NOT NULL,
    responsable_id INT NULL
);

-- Table enseignant
CREATE TABLE enseignant (
    id_enseignant INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150),
    telephone VARCHAR(20),
    id_departement INT,
    FOREIGN KEY (id_departement) REFERENCES departement(id_departement)
);

-- Ajout après la création pour FK circulaire
ALTER TABLE departement
ADD CONSTRAINT fk_resp
FOREIGN KEY (responsable_id) REFERENCES enseignant(id_enseignant);

-- Table etudiant
CREATE TABLE etudiant (
    id_etudiant INT PRIMARY KEY,
    num_etudiant VARCHAR(20),
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_naissance DATE,
    email VARCHAR(150),
    telephone VARCHAR(20),
    id_departement INT,
    FOREIGN KEY (id_departement) REFERENCES departement(id_departement)
);

-- Table cours
CREATE TABLE cours (
    id_cours INT PRIMARY KEY,
    code_cours VARCHAR(20),
    intitule VARCHAR(150),
    credits INT,
    id_departement INT,
    id_enseignant_principal INT,
    FOREIGN KEY (id_departement) REFERENCES departement(id_departement),
    FOREIGN KEY (id_enseignant_principal) REFERENCES enseignant(id_enseignant)
);

-- Table session_examen
CREATE TABLE session_examen (
    id_session INT PRIMARY KEY,
    annee INT,
    semestre INT,
    date_debut DATE,
    date_fin DATE
);

-- Table inscription
CREATE TABLE inscription (
    id_inscription INT PRIMARY KEY,
    id_etudiant INT,
    id_cours INT,
    date_inscription DATE,
    statut VARCHAR(20),
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id_etudiant),
    FOREIGN KEY (id_cours) REFERENCES cours(id_cours)
);

-- Table examen
CREATE TABLE examen (
    id_examen INT PRIMARY KEY,
    id_cours INT,
    id_session INT,
    date_examen DATE,
    type_examen VARCHAR(20),
    FOREIGN KEY (id_cours) REFERENCES cours(id_cours),
    FOREIGN KEY (id_session) REFERENCES session_examen(id_session)
);

-- Table note
CREATE TABLE note (
    id_note INT PRIMARY KEY,
    id_examen INT,
    id_etudiant INT,
    valeur INT,
    remarques VARCHAR(255),
    FOREIGN KEY (id_examen) REFERENCES examen(id_examen),
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id_etudiant)
);

-- ------------------------------------------------------------
-- INSERTIONS
-- ------------------------------------------------------------

INSERT INTO departement(id_departement, nom_departement, responsable_id)
VALUES
(1, 'Informatique', NULL),
(2, 'Mathématiques', NULL),
(3, 'Physique', NULL),
(4, 'Chimie', NULL),
(5, 'Électronique', NULL);

INSERT INTO enseignant(id_enseignant, nom, prenom, email, telephone, id_departement)
VALUES
(1, 'Durand', 'Marc', 'marc.durand@univ.fr', '0621436578', 1),
(2, 'Leroy', 'Sophie', 'sophie.leroy@univ.fr', '0612680967', 2),
(3, 'Benoit', 'Luc', 'luc.benoit@univ.fr', '0667093467', 1),
(4, 'Martin', 'Alice', 'alice.martin@univ.fr', '0612457853', 3),
(5, 'Loris', 'Hugo', 'hugo.loris@univ.fr', '0616543489', 4);

UPDATE departement SET responsable_id = 1 WHERE id_departement = 1;
UPDATE departement SET responsable_id = 2 WHERE id_departement = 2;
UPDATE departement SET responsable_id = 4 WHERE id_departement = 3;
UPDATE departement SET responsable_id = 5 WHERE id_departement = 4;
UPDATE departement SET responsable_id = 3 WHERE id_departement = 5;

INSERT INTO etudiant(id_etudiant, num_etudiant, nom, prenom, date_naissance, email, telephone, id_departement)
VALUES
(1, 'E2024001', 'Kaimoussi', 'Salim', '2004-07-14', 'salim.kaimoussi@etu.fr', '060355484', 1),
(2, 'E2024002', 'Hassani', 'Nisrine', '2003-11-03', 'nisrine.hassani@etu.fr', '0700000002', 2),
(3, 'E2024003', 'Diallo', 'Omar', '2001-09-18', 'omar.diallo@etu.fr', '0700000003', 1),
(4, 'E2024004', 'Nguyen', 'Laura', '2003-01-27', 'laura.nguyen@etu.fr', '0700000004', 3),
(5, 'E2024005', 'Alaoui', 'Yassemine', '2004-05-21', 'yassemine.alaoui@etu.fr', '0700000005', 1);

INSERT INTO cours(id_cours, code_cours, intitule, credits, id_departement, id_enseignant_principal)
VALUES
(1, 'INF101', 'Algorithmique', 6, 1, 1),
(2, 'INF102', 'Bases de données', 6, 1, 3),
(3, 'MAT201', 'Analyse II', 5, 2, 2),
(4, 'PHY150', 'Mécanique', 4, 3, 4),
(5, 'CHM110', 'Chimie organique', 5, 4, 5);

INSERT INTO session_examen(id_session, annee, semestre, date_debut, date_fin)
VALUES
(1, 2024, 1, '2024-01-10', '2024-01-20'),
(2, 2024, 2, '2024-06-01', '2024-06-15'),
(3, 2024, 1, '2024-01-22', '2024-01-29'),
(4, 2024, 2, '2024-06-20', '2024-06-30'),
(5, 2024, 1, '2024-02-01', '2024-02-10');

INSERT INTO inscription(id_inscription, id_etudiant, id_cours, date_inscription, statut)
VALUES
(1, 1, 1, '2024-01-02', 'valide'),
(2, 1, 2, '2024-01-05', 'valide'),
(3, 2, 3, '2024-01-08', 'valide'),
(4, 3, 1, '2024-01-07', 'valide'),
(5, 4, 4, '2024-01-06', 'valide');

INSERT INTO examen(id_examen, id_cours, id_session, date_examen, type_examen)
VALUES
(1, 1, 1, '2024-01-15', 'controle'),
(2, 1, 2, '2024-06-10', 'rattrapage'),
(3, 2, 1, '2024-01-17', 'controle'),
(4, 3, 2, '2024-06-05', 'controle'),
(5, 4, 1, '2024-01-18', 'controle');

INSERT INTO note(id_note, id_examen, id_etudiant, valeur, remarques)
VALUES
(1, 1, 1, 16, 'Bon travail'),
(2, 1, 3, 12, 'Peut mieux faire'),
(3, 3, 1, 18, 'Très bon'),
(4, 4, 2, 14, NULL),
(5, 5, 4, 11, 'À revoir');
