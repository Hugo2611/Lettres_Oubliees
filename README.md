# Lettres oubliées

Archive littéraire privée, conçue pour le web avec React, Vite et Supabase. L’interface est en français et pensée autour d’une lecture calme, d’un index éditorial et d’un mode lecture.

## Démarrer

```sh
npm install
npm run dev
```

Sans variables Supabase, le site utilise un mode de démonstration avec trois textes fictifs. Les lettres ajoutées dans ce mode sont conservées dans le `localStorage` de ce navigateur. Ce stockage n’est pas sécurisé et ne convient jamais à des lettres privées. Effacer les données du site réinitialise les exemples et les ajouts locaux.

## Configurer l’archive privée

1. Créer un projet Supabase privé.
2. Exécuter [`supabase/schema.sql`](supabase/schema.sql) dans l’éditeur SQL du projet.
3. Créer le compte propriétaire dans Supabase Auth. Les inscriptions publiques restent désactivées ; ne créer que les comptes nécessaires depuis le tableau de bord Supabase.
4. Copier `.env.example` vers `.env.local`, puis renseigner l’URL du projet et sa clé publique `anon`/publishable.
5. Redémarrer le serveur de développement. Une fois Supabase configuré, les lettres de démonstration disparaissent et seules les lettres accessibles par la session authentifiée sont demandées.

La clé `service_role` ne doit jamais être utilisée dans le navigateur ou ajoutée aux variables `VITE_*`. Les règles RLS dans `schema.sql` limitent chaque lecture et modification à `auth.uid()`. L’index aléatoire tire les identifiants parmi les lettres autorisées par RLS ; il ne demande pas le contenu des lettres avant d’en ouvrir une. Toutes les opérations client restent soumises aux politiques Supabase.

## Importer les lettres

Dans l’espace « Écrire », coller une lettre ou importer des fichiers TXT, Markdown et JSON. L’import affiche un aperçu avant validation. Format JSON accepté : un objet ou un tableau d’objets avec `title`, `content`, `written_at`, `category`, `recipient`, `tags` et `is_favorite`. Le texte n’est pas réécrit. Pour une archive privée, configurer Supabase avant l’import.

## Déploiement Vercel

Importer le dépôt dans Vercel, conserver la commande `npm run build` et le dossier `dist`, puis ajouter `VITE_SUPABASE_URL` et `VITE_SUPABASE_ANON_KEY` dans les variables d’environnement de production. `vercel.json` renvoie les routes de l’application vers son point d’entrée. Vérifier que les URL de redirection Supabase Auth incluent le domaine déployé.

## Notes

- Les polices Cormorant Garamond, Literata, DM Sans et IBM Plex Mono sont chargées depuis Google Fonts ; prévoir des polices de repli si l’accès réseau est indisponible.
- Le site est une application web React/Vite, adaptée au besoin web prioritaire. Il n’utilise pas Expo/React Native.
- Les contenus réels ne sont pas embarqués dans les fichiers de démonstration publics.

### Archive de démonstration locale

Les exemples fictifs peuvent être remplacés par un import collé dans l’espace d’écriture. Les lettres de l’utilisateur demeurent dans le localStorage du navigateur tant que Supabase n’est pas configuré. Ce stockage local n’est pas sécurisé ; ne pas déployer l’archive avec ces données ni l’utiliser sur un appareil partagé. Configurer Supabase puis réimporter les lettres pour bénéficier de l’authentification et du RLS. Ces données locales ne sont pas transférées automatiquement.

