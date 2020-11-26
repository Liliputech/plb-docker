# Dockerisons PLB

## Les services disponibles

 1. php.plb, qui contient la partie Web du projet
 2. nginx.plb, qui contient la partie serveur du projet
 3. mariadb.plb, qui contiendra une base de données suffisamment complète pour les tests. Il est possible de se passer de ce service lors de l'installation de PlanningBiblio.

## Prérequis à l'installation

- [ ] Avoir installé [Docker](https://doc.ubuntu-fr.org/docker)

## Installation
 Pour le projet PlanningBiblio sur votre machine, exécutez la commande suivante :

```bash
git clone https://github.com/PlanningBiblio/PlanningBiblio.git
```

Il vous faudra aussi obtenir une copie à jour de Plb-Docker

```bash
git clone https://github.com/sillydebs/plb-docker.git
```

### 1. Rendez-vous à la racine de votre projet depuis votre terminal

```bash
cd plb-docker
```

### 2. Vérifiez que les fichiers et répertoires suivants sont présents à la racine de votre projet

- [ ] le répertoire docker/
- [ ] les fichiers
	- [ ] docker-compose.yml
	- [ ] Dockerfile-php
	- [ ] aliases
        - [ ] .env

Pour vérifier leur présence, entrez la commande ls -lah
```bash
votresession@votremachine:~/plb-docker$ ls -lah
```

### 3. Mettez en place les aliases
```bash
votresession@votremachine:~/plb-docker$ echo "export PLB_DOCKER_HOME=$PWD" >> ~/.bashrc
votresession@votremachine:~/plb-docker$ echo 'source $PLB_DOCKER_HOME/aliases' >> ~/.bashrc
votresession@votremachine:~/plb-docker$ source ~/.bashrc
```

Ces aliases vous permettrons de rapidement démarrer, arréter ou remettre à zéro votre installation PLB pour les test.

 * plb-start : démarre PLB
 * plb-stop : coupe les vm, les données sont sauvegardées jusqu'au prochain start.
 * plb-clean : supprime les machines virtuelles (mais pas de panique, tout est recréé avec plb-start)

Il fera lui-même appel au fichier *docker-compose.yml*, pour installer les services requis et à *Dockerfile-php* pour créer l'image php nécessaire au chargement de PlanningBiblio.

### 4. Démarrer PlanningBiblio!

Si vous avez mis en place les alias, vous pouvez simplement taper:
```bash
votresession@votremachine:~/$ plb-start
```

Sinon :
```bash
votresession@votremachine:~/plb-docker$ docker-compose up
```

Quelques secondes plus tard vous pouvez vous connecter sur http://localhost et accéder à PlanningBiblio!
Les login et mot de passe par défaut sont "admin / test".

Bonne continuation avec Docker et PlanningBiblio !
