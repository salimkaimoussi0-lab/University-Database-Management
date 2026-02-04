# Système de Gestion de Base de Données Universitaire (SQL)
## 📖 Présentation

Ce projet consiste en la conception et l'implémentation d'une base de données relationnelle pour la gestion administrative d'une université. 
Le système permet de gérer le cycle de vie complet de la scolarité : de l'inscription des étudiants à la gestion des examens et au calcul des moyennes.

## 🛠️ Fonctionnalités Techniques

### 1. Modélisation de Données (MCD/MLD)
Conception d'un schéma relationnel robuste comprenant :
* **Entités principales :** `Etudiant`, `Enseignant`, `Cours`, `Departement`.
* **Associations complexes :** `Inscription` (Suivi de scolarité), `Examen` (Planification), `Note` (Evaluation).
* **Intégrité référentielle :** Gestion des clés étrangères et contraintes (ex: un département a un responsable qui est un enseignant).

### 2. Scripts SQL & Manipulation de données
* **DDL (Data Definition Language) :** Scripts de création de tables avec contraintes (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`).
* **DML (Data Manipulation Language) :** Insertion de jeux de données cohérents pour tester les cas limites.
* **Requêtes Analytiques (Data Analysis) :**
    * Calculs d'agrégats (Moyennes par cours, Taux de réussite).
    * Jointures multiples (ex: Lier *Etudiant* -> *Inscription* -> *Cours* -> *Examen* -> *Note*).
    * Filtrage et Tris (`GROUP BY`, `HAVING`, `ORDER BY`).

## 📂 Structure du Dépôt

```bash
University-Database-Management/
├── 📂 SQL_Scripts/
│   ├── schema_complet_v2.sql   # Script principal (Création Tables + Insertions)
│   ├── requetes_analyse_1.sql  # Requêtes d'interrogation (Jointures, Filtres)
│   └── requetes_analyse_2.sql  # Requêtes analytiques (Statistiques, Moyennes)
├── 📂 Documentation/
│   ├── Rapport_Complet.pdf     # Modélisation (MCD) et explications
│   └── Resultat*.pdf           # Preuves d'exécution des requêtes
