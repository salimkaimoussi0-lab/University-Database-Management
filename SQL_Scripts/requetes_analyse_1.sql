SELECT e.nom, e.prenom, d.nom_departement
FROM etudiant e
JOIN departement d ON e.id_departement = d.id_departement;


SELECT c.code_cours, c.intitule, c.credits
FROM cours c
WHERE c.id_enseignant_principal = 1;   -- remplacer 1 par l'enseignant voulu


SELECT et.nom, et.prenom
FROM inscription i
JOIN etudiant et ON i.id_etudiant = et.id_etudiant
WHERE i.id_cours = 1;   -- remplacer 1 par le cours souhaité


SELECT c.intitule, i.date_inscription, i.statut
FROM inscription i
JOIN cours c ON i.id_cours = c.id_cours
WHERE i.id_etudiant = 1;   -- remplacer 1 par l’étudiant voulu


SELECT date_examen, type_examen
FROM examen
WHERE id_cours = 1;   -- remplacer 1 par le cours souhaité

SELECT n.valeur, n.remarques, c.intitule
FROM note n
JOIN examen e ON n.id_examen = e.id_examen
JOIN cours c ON e.id_cours = c.id_cours
WHERE n.id_etudiant = 1;   -- remplacer 1 par l’étudiant souhaité


SELECT nom, prenom
FROM enseignant
WHERE id_departement = 1;   -- remplacer 1 par le département voulu


SELECT d.nom_departement, COUNT(e.id_etudiant) AS nbr_etudiants
FROM departement d
LEFT JOIN etudiant e ON d.id_departement = e.id_departement
GROUP BY d.id_departement;


SELECT c.intitule, COUNT(i.id_etudiant) AS nb_inscrits
FROM cours c
JOIN inscription i ON c.id_cours = i.id_cours
GROUP BY c.id_cours
HAVING COUNT(i.id_etudiant) > 30;


SELECT e.nom, e.prenom
FROM etudiant e
LEFT JOIN inscription i ON e.id_etudiant = i.id_etudiant
WHERE i.id_inscription IS NULL;


SELECT e.id_etudiant, e.nom, e.prenom,
       AVG(n.valeur) AS moyenne_generale
FROM etudiant e
JOIN note n ON e.id_etudiant = n.id_etudiant
WHERE e.id_etudiant = 1   -- mettre l'étudiant voulu
GROUP BY e.id_etudiant;


SELECT c.intitule, AVG(n.valeur) AS moyenne
FROM note n
JOIN examen e ON n.id_examen = e.id_examen
JOIN cours c ON e.id_cours = c.id_cours
GROUP BY c.id_cours;


SELECT et.nom, et.prenom, AVG(n.valeur) AS moyenne
FROM note n
JOIN etudiant et ON n.id_etudiant = et.id_etudiant
JOIN examen ex ON n.id_examen = ex.id_examen
WHERE ex.id_cours = 1
GROUP BY et.id_etudiant
ORDER BY moyenne DESC;


SELECT 
    c.intitule,
    (SUM(n.valeur >= 10) / COUNT(*)) * 100 AS taux_reussite
FROM note n
JOIN examen ex ON n.id_examen = ex.id_examen
JOIN cours c ON ex.id_cours = c.id_cours
WHERE c.id_cours = 2;

SELECT e.nom, e.prenom, AVG(n.valeur) AS moyenne_generale
FROM etudiant e
JOIN note n ON e.id_etudiant = n.id_etudiant
WHERE e.id_departement = 3
GROUP BY e.id_etudiant
ORDER BY moyenne_generale DESC
LIMIT 5;
