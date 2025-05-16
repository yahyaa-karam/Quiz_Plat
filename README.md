# QuizAppJEE

Application web Java EE pour la création, l’assignation et la gestion de quiz.

---

## 📦 Technologies utilisées

- Java EE (Servlets, JSP)
- Hibernate (ORM)
- PostgreSQL (base de données)
- Tomcat (serveur web)
- Maven (build)
- Docker & Docker Compose

---

## 📁 Structure du projet

QuizAppJEE/
├── backend/
│ ├── src/
│ ├── pom.xml
│ └── Dockerfile
├── docker-compose.yml
├── README.md

---

## 🚀 Lancer l'application avec Docker

### 1. Cloner le projet

```bash
git clone <lien-du-repo>
cd QuizAppJEE
``` 
Dans `hibernate.cfg.xml`:
```xml 
<property name="hibernate.connection.url">jdbc:postgresql://db:5432/quizdb</property>  
<property name="hibernate.connection.username">quizuser</property> 
<property name="hibernate.connection.password">quizpass</property>
 ```
### 3. Lancer l'application 
```bash 
docker-compose up --build
```
--- 
## 🌐 Accès


Après le démarrage complet :

- Backend : `http://localhost:8080/quizapp`

---  

## 🛠️ Commandes utiles 

```bash
# Stopper les conteneurs 
docker-compose down
# Voir les logs en direct  
docker-compose logs -f 
# Accès à un conteneur (ex: Tomcat)
docker exec -it quizapp-web bash
```  

---  

## 🧪 Base de données
- Host : `db`
- Port : `5432`
- Nom : `quizdb`
- Utilisateur : `quizuser` 
- Mot de passe : `quizpass`

--- 
## 📝 À faire
- Ajouter des tests unitaires 
- Ajouter CI/CD (GitHub Actions ou Azure Pipelines) 

---