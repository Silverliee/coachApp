# Coach - L'Entraînement Simplifié avec Coach

### **Besoin :**

- Saisie des informations sur la charge actuelle par exercice lors de l'entraînement, avec la possibilité d'indiquer si les répétitions sont terminées.
- Accès aux détails des entraînements, y compris le titre, les exercices, le nombre de séries, le nombre de répétitions inter séries, et le temps de récupération.
- Intégration d'un minuteur pour le suivi du temps de récupération.
- Gestion des données d'entraînement.
- Possibilité d'automatiser le processus : lancer l'application, appuyer sur "start", et se laisser guider.

**Extensions possibles :**

- Ajout d'un agenda pour la planification des séances avec ajout de rappel/notification.
- Système de streak pour les jours d’entrainements enchainé

### **Ma Solution :**

**Version 1.0 :**

- Page d'accueil affichant l'entraînement du jour, comprenant les exercices, les séries et les répétitions.
- Section de suivi de progression, avec suivi de la charge actuelle, statut des répétitions, et espace pour des notes personnelles si nécessaire.
- Section minuteur dédiée (pour les temps de récupération entre séries).
- Section "Programme" pour la gestion des données d'entraînement.

**Version 1.1 :**

- Rapport d’entrainement et de progression

**Version 1.2 :**

- Ajout d'un bouton "Commencer" sur la page d'accueil pour afficher l'exercice en cours et le nombre de répétitions restantes.

**Version 1.3** :

- Ajout de la donnée taille au niveau des paramètres utilisateur afin d’ajouter le calcul d’imc et de métabolisme basale

### **Méthodologie :**

1. **Conception détaillée :** Définir clairement les fonctionnalités, l'expérience utilisateur, et l'interface.
2. **Choix technologique :** Opter pour le développement natif avec Kotlin pour Android ou une solution multiplateforme (Flutter, React Native, Xamarin).
3. **Développement :** Commencer la programmation en suivant les spécifications de conception, en incluant les profils d'utilisateurs, les exercices, et la planification des entraînements.
4. **Intégration des fonctionnalités :** Ajouter des fonctionnalités clés telles que le suivi de progression, les rappels d'entraînement, et les vidéos d'exercices.
5. **Tests et débogage :** Effectuer des tests approfondis pour identifier et corriger les erreurs, en garantissant une compatibilité avec divers appareils Android.
6. **Optimisation des performances :** S'assurer de la fluidité et de la réactivité de l'application, même sur des appareils anciens.
7. **Design graphique et UX :** Travailler sur le design et l'expérience utilisateur pour rendre l'application attrayante et conviviale.
8. **Tests bêta :** Organiser des tests bêta avec un groupe d'utilisateurs restreint pour recueillir des retours et repérer les problèmes potentiels.
9. **Lancement :** Publier l'application sur le Google Play Store, en suivant les directives de publication de Google.
10. **Promotion et marketing :** Promouvoir activement l'application via les médias sociaux, le marketing en ligne, et d'autres stratégies de promotion.
11. **Suivi et mise à jour :** Continuer à surveiller les performances, collecter les commentaires des utilisateurs, et effectuer des mises à jour régulières pour améliorer l'application.

Le développement d'une application est un processus continu. Il est essentiel de rester attentif aux besoins des utilisateurs et d'assurer la maintenance et les mises à jour constantes. Bonne chance pour la réalisation de votre application "Coach" !

# Mise en place :

## Conception détaillé :

Fonctionnalités retenue pour la version 1 :

- Page d'accueil affichant l'entraînement du jour, comprenant les exercices, les séries et les répétitions.
- Section de suivi de progression, avec suivi de la charge actuelle, statut des répétitions, et espace pour des notes personnelles si nécessaire.
- Section minuteur dédiée (pour les temps de récupération entre séries).
- Section "Programme" pour la gestion des données d'entraînement.
- Ajouter lors du chargement de l’app des messages type “le saviez vous” (même concept que les messages de chargement de l’app discord)

## Parcours utilisateur :

### Premier accès de l'utilisateur à l'application :

- L'utilisateur arrive sur l'écran de premier lancement.
- Il remplit des informations sur son prenom, sa date de naissance (pour calculer l'âge), sa taille et son poids. Ces informations sont nécessaires pour calculer son Indice de Masse Corporelle (IMC).

### Utilisateur sans entraînement existant :

- L'utilisateur arrive sur l'onglet "Entraînement".
- Il a la possibilité de créer un nouvel entraînement.
- Il remplit un formulaire avec le nom de l'entraînement et a la possibilité d'ajouter un ou plusieurs exercices.
    - Pour chaque exercice ajouté, un formulaire apparaît, comprenant le nom de l'exercice, le nombre de séries, le nombre de répétitions par série et le temps de récupération entre chaque série.
    - Tous les champs du formulaire sont obligatoires.
    - L'utilisateur peut ajouter autant d'exercices qu'il le souhaite.
    - Il a la possibilité de revenir en arrière sans enregistrer, mais s'il a effectué des modifications, il lui sera demandé s'il est sûr de vouloir abandonner les modifications.
    - Un bouton d'enregistrement permet de sauvegarder les données dans la base.
- Une fois l'enregistrement effectué, l'utilisateur est redirigé vers l'onglet "Entraînement" où son nouvel entraînement est maintenant visible.

### Utilisateur avec un ou plusieurs entraînements existants :

- L'utilisateur arrive sur la page "Entraînement".
- Il peut modifier les entraînements existants :
    - Cette action ouvre un formulaire pré-rempli avec les anciennes données (entraînement et exercices de l'entraînement).
    - L'utilisateur peut apporter les modifications souhaitées dans le formulaire.
    - Il a la possibilité d'enregistrer les modifications ou de revenir en arrière.
        - S'il choisit de revenir en arrière après avoir modifié des éléments du formulaire, une vérification lui est demandée.
- L'utilisateur peut sélectionner et lancer l'entraînement de son choix.
    - Les exercices associés à l'entraînement sélectionné sont affichés.
    - Une fois un exercice choisi, une interface apparaît, montrant le nom de l'exercice, le nombre de répétitions et de séries (sous la forme 0/n, où n est le nombre de séries). La valeur initiale est 0 pour les séries.
        - Si aucune charge n'est enregistrée, la valeur affichée est 0 par défaut.
        - L'utilisateur peut modifier directement la charge de l'exercice sur cette interface.
    - Après avoir terminé une série, un bouton "Succès" est disponible.
    - Ce bouton lance un minuteur respectant le temps de récupération défini pour l'exercice et émet un signal sonore à la fin du temps imparti.
    - Une fois tous les exercices terminés, l'utilisateur revient à la page affichant tous les exercices de l'entraînement. L'entraînement récemment effectué apparaît en vert.
    - Si l'utilisateur n'achève pas une série car elle est trop difficile, un bouton "I can't" le renvoie à la liste des exercices de l'entraînement, et l'entraînement récemment effectué est affiché en orange.
- Le statut des différents exercices est sauvegardé pour ajuster les charges en conséquence pour les futures séances d'entraînement.

## **Choix des technologies :**

- Core → Techno cross plateforme flutter
- Database → SQLite

### Data model :

![Data model coach.drawio.png](https://github.com/Silverliee/coachApp/blob/main/documentation/Data_model_coach.drawio.png)

## Design d’écran :

[https://www.figma.com/file/kySWUGFU2RegWGeug0nYI1/Coach-app?type=design&node-id=0-1&mode=design&t=V0nMFWC1Feznn9Dc-0](https://www.figma.com/file/kySWUGFU2RegWGeug0nYI1/Coach-app?type=design&node-id=0-1&mode=design&t=V0nMFWC1Feznn9Dc-0)

## **Développement :**