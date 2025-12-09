# Projet Neo4j - Modélisation de la série "Nous les Menteurs"

Ce projet vise à représenter et analyser les relations entre les personnages du roman et de la série *Nous les menteurs* en utilisant une base de données orientée graphes avec Neo4j.  
L’objectif : visualiser et explorer les liens familiaux et les interactions clés de l’histoire.

---
## Table des matières 
- Contexte du projet
- Technologies Utilisées
- Structure du projet
- Étapes du projet
- Auteur

--- 

## Contexte du projet

Dans les bases de données relationnelles classiques, il peut être difficile et coûteux d’explorer des relations complexes entre entités.  
Neo4j permet de modéliser naturellement des réseaux sociaux, des liens familiaux, ou encore des graphes de personnages littéraires.

Ce projet montre comment :
- transformer des données de personnages en un graphe
- analyser leurs relations via des requêtes Cypher
- visualiser les liens significatifs de l’intrigue
  
---

##  Technologies Utilisées

| Outil | Rôle |
|-------|------|
| Neo4j Desktop | Création et gestion de la base de données |
| Langage Cypher | Création des nœuds, relations et requêtes |
| Fichier CSV | Import des données |

---

## Structure du projet
Projet_Neo4j/
│
├── scripts/            # Scripts Cypher pour créer le graphe
├── images/             # Captures pour la documentation
└── README.md           # Documentation du projet

---

## Étapes du projet
1. **Installation de Neo4j Desktop** :
C'est le logiciel qui va servir à réaliser le projet.

  
2. **Création d'une instance et de la base de données** :
Pour commencer ce projet, il a fallu créer une instance dans lequel par la suite, on y mettra les bases de données. 
<img width="1607" height="551" alt="création instance" src="https://github.com/user-attachments/assets/ba8788ee-a665-46f1-9721-9e7d605c3065" />
Sur la photo ci-dessus, on peut y voir l'instance nommée Datacloud avec les différentes bases de données qu'elle contient. Une fois l'instance créée, il faut donc y ajouter des bases de données en cliquant sur Create Database. C'est donc ce que j'ai fais et j'ai créé la base de données nommée wewereliars-data.


3. **Connexion à l'instance créée précédemment** :
Maintenant que l'instance et la base de données sont créées, il faut aller dans la partie requête du logiciel et choisir sur lesquelles on souhaite travailler et s'y connecter (voir captures ci-dessous).
Aucune instance connectée pour le moment :
<img width="472" height="57" alt="se connecter à l&#39;instance" src="https://github.com/user-attachments/assets/2ef8dfec-3817-43f6-92bc-38f6389dfe00" />

Cliquer sur connecter pour se connecter à l'instance datacloud :
<img width="1151" height="567" alt="connecte instance 2" src="https://github.com/user-attachments/assets/80ab4d3e-4fb4-4f52-b929-67a0a5e6c4e9" />


4. **Connexion à la base de données (database)** :
Maintenant que l'instance est connectée, il faut choisir une base de données et s'y connecter également (voir capture ci-dessous).
<img width="688" height="40" alt="connecte database" src="https://github.com/user-attachments/assets/c2c48243-0393-4c5f-ad99-866df02214bf" />


5. **Importation du script dans les requêtes** :
Maintenant que tout est bien connectée il faut à présent remplir cette base de données en mettant dans la partie requêtes toutes les lignes de codes permettant de créer toutes les données des personnages ainsi que les relations entre eux (voir fichier cypher importés sur le github). Ensuite pour visualiser toute la base de données il faut entrer la requête suivante :

MATCH (n) RETURN n;

et on obtient la vue suivante :
<img width="1027" height="687" alt="requete pour visualiser les noeuds" src="https://github.com/user-attachments/assets/95ad3eef-b27a-4c4c-85f9-1063b5c414a8" />

Cette vue nous montre le schéma des différents noeuds. J'ai également la même vue avec plus de détails notamment sur toutes les relations entre les différents noeuds.

<img width="645" height="777" alt="graphe complet" src="https://github.com/user-attachments/assets/9eb4d6d0-3c29-49bb-a364-64723bbf8832" />

On a également les informations suivantes :

<img width="465" height="516" alt="information database" src="https://github.com/user-attachments/assets/97c30bb3-c1aa-4f4f-a4c2-3b5a90f84261" />



6. **Création de requêtes** : 
Maintenant que notre base de données existent et qu'on a toutes nos relations, on peut interroger la page de données à l'aide de requêtes. J'ai donc écris plusieurs requêtes afin de voir un peu plus en détails le modèle de donnnées.

Cette requête permet de visualiser les noeuds des animaux et de connaître la maison à laquelle ils appartiennent.
<img width="926" height="691" alt="requete animaux" src="https://github.com/user-attachments/assets/ef600ca0-2294-45c8-9766-4ccb7491128c" />


Cette requête permet de connaître les différents liens amoureux entre les personnages.
<img width="1022" height="687" alt="requete couple" src="https://github.com/user-attachments/assets/8ba794b0-460e-46b9-9d92-ae054426066a" />


Cette requête permet de savoir à quel maison sont rattachés les personnages.
<img width="1028" height="681" alt="requete maisons" src="https://github.com/user-attachments/assets/2e9ad076-8a28-4ec5-8959-fcfdebb7047b" />


Cette requête permet de visualiser toutes les relations entre un personnage défini, ici Cadence Sinclair et les autres personnages. 
<img width="1006" height="686" alt="requete perso relations" src="https://github.com/user-attachments/assets/89b09364-115f-4ef9-888b-bc43e9f8b9af" />


Cette requête permet de voir tous les noeuds correspondant à des personnages.
<img width="1036" height="677" alt="requete personnages" src="https://github.com/user-attachments/assets/af46058c-cbc4-41ae-8e91-88bd142ab90a" />


Cette requête permet de connaître tous les liens parents enfants qui existent entre les personnages.
<img width="1032" height="687" alt="requetes parents enfants" src="https://github.com/user-attachments/assets/c7c16459-fdc7-4181-b9ab-3c51ee5b020c" />


Cette requête permet d'avoir une vision plus globale de tous les types de relations existant entre les personnages.
<img width="1035" height="683" alt="requete pour total lien et relations" src="https://github.com/user-attachments/assets/70c8d88d-0584-4f8d-a6ac-c009d0d114bb" />


---

## Auteur
Projet réalisé par Coline T.
