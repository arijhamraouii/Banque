# 💳 **Projet Banque - Arij Hamraoui**  

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![MuleSoft](https://img.shields.io/badge/MuleSoft-005757?style=for-the-badge&logo=mulesoft&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![ActiveMQ](https://img.shields.io/badge/ActiveMQ-B22222?style=for-the-badge&logo=apache&logoColor=white)

---

## 🎯 **Description du Projet**
**Projet Banque - Arij Hamraoui** est une solution intégrée basée sur :
- **Spring Boot** pour les services REST et SOAP.
- **MuleSoft** pour l'orchestration des flux (ESB).
- **MySQL** pour la gestion des données.
- **ActiveMQ** pour la gestion des messages asynchrones.

### **Fonctionnalités :**
- Création et gestion des comptes bancaires.
- Gestion des transactions bancaires.
- Notifications automatiques via ActiveMQ.
- Génération de rapports financiers.
- Système de satisfaction client.

---

## 🛠️ **Architecture du Projet**

```mermaid
graph TD;
    A[Postman] -->|JSON Requests| B[MuleSoft ESB]
    B --> C{Flow MuleSoft};
    C --> D[Spring Boot REST Services]
    C --> E[C# SOAP Services]
    C --> F[ActiveMQ]
    D --> G[MySQL Database]
    E --> G
