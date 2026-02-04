
SELECT * FROM semestre;

SELECT c.id_cours, c.code_cours, c.intitule, s.annee, s.numero
FROM cours c
LEFT JOIN semestre s ON c.id_semestre = s.id_semestre;


SELECT c.*
FROM cours c
JOIN semestre s ON c.id_semestre = s.id_semestre
WHERE s.numero = 1;


SELECT 
    c.code_cours, c.intitule,
    e.nom AS enseignant,
    d.nom_departement,
    CONCAT(s.annee, '-S', s.numero) AS semestre
FROM cours c
LEFT JOIN enseignant e ON e.id_enseignant = c.id_enseignant_principal
LEFT JOIN departement d ON d.id_departement = c.id_departement
LEFT JOIN semestre s ON s.id_semestre = c.id_semestre;


SELECT s.annee, s.numero, COUNT(c.id_cours) AS nb_cours
FROM semestre s
LEFT JOIN cours c ON c.id_semestre = s.id_semestre
GROUP BY s.id_semestre;


SELECT 
    ex.id_examen, ex.date_examen, ex.type_examen,
    c.intitule AS cours,
    CONCAT(s.annee, '-S', s.numero) AS semestre
FROM examen ex
JOIN cours c ON ex.id_cours = c.id_cours
LEFT JOIN semestre s ON c.id_semestre = s.id_semestre;