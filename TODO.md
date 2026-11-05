# Lettres oubliées — tâches restantes

Le site tourne en local sur `http://localhost:5173/`. Les six lettres personnelles sont maintenant dans le stockage du navigateur pour cette adresse uniquement. Ce stockage n’est pas sécurisé et ne doit pas être publié ni utilisé sur un appareil partagé.

## Configuration privée

- [ ] Créer un projet Supabase privé.
- [ ] Exécuter `supabase/schema.sql` dans l’éditeur SQL Supabase et vérifier les règles RLS.
- [ ] Créer le compte propriétaire dans Supabase Auth et laisser les inscriptions publiques désactivées.
- [ ] Copier `.env.example` vers `.env.local` et renseigner l’URL Supabase et la clé publique (`anon`/publishable). Ne jamais utiliser la clé `service_role` dans le navigateur.
- [ ] Relancer le site et vérifier connexion, déconnexion, accès refusé sans session et accès autorisé avec la session propriétaire.

## Import des lettres

- [x] Remplacer les trois exemples par les six lettres fournies et vérifier leurs titres dans les archives.
- [ ] Après configuration de Supabase, importer de nouveau les lettres dans l’archive privée. Le stockage actuel du navigateur ne sera pas migré automatiquement.
- [x] Vérifier l’aperçu et la séparation des six lettres avant leur ajout à l’archive locale.
- [ ] Compléter les dates d’écriture, destinataires ou catégories manquants si souhaité.
- [ ] Vérifier la recherche, les favoris, la lecture intégrale et « Relire une lettre » avec les vraies données.

## Mise en ligne

- [ ] Traiter les deux alertes de dépendances modérées signalées par `npm install`.
- [ ] Déployer le projet sur Vercel avec `npm run build` et le dossier `dist`.
- [ ] Ajouter les variables Supabase à l’environnement Vercel et déclarer l’URL du site dans les URL de redirection Supabase Auth.
- [ ] Vérifier les routes, l’authentification et la confidentialité sur le domaine déployé.

## Déjà prêt

- [x] Interface responsive, archives filtrables, lecture, mode lecture, tirage aléatoire et espace d’import/édition.
- [x] Mode démo avec contenus fictifs et avertissement de stockage local non sécurisé.
- [x] Schéma de base, politiques RLS et configuration de redirection Vercel.
- [x] Compilation de production vérifiée avec `npm run build`.
