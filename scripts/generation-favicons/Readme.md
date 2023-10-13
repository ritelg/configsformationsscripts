# Script permettant de générer les favicons et le manifest.json

```bash

Usage: main.py [OPTIONS] SOURCE_FILE

  Création des icones et du manifest.json

Arguments:
  SOURCE_FILE  Fichier source pour la création des icones et du manifest.json
               [required]

Options:
  --manifest-name TEXT          Nom de l’application  [default: Nom de
                                l’application]
  --directory-in-manifest TEXT  Dossier à renseigner dans le manifest.json
                                pour les chemins des fichiers.  [default:
                                favicons/]
  --help                        Show this message and exit.

```

Ensuite ajouter ceci dans le fichier html :

```html
<link rel="apple-touch-icon" sizes="57x57" href="/favicon/apple-icon-57x57.png"/>
<link rel="apple-touch-icon" sizes="60x60" href="/favicon/apple-icon-60x60.png"/>
<link rel="apple-touch-icon" sizes="72x72" href="/favicon/apple-icon-72x72.png"/>
<link rel="apple-touch-icon" sizes="76x76" href="/favicon/apple-icon-76x76.png"/>
<link rel="apple-touch-icon" sizes="114x114" href="/favicon/apple-icon-114x114.png"/>
<link rel="apple-touch-icon" sizes="120x120" href="/favicon/apple-icon-120x120.png"/>
<link rel="apple-touch-icon" sizes="144x144" href="/favicon/apple-icon-144x144.png"/>
<link rel="apple-touch-icon" sizes="152x152" href="/favicon/apple-icon-152x152.png"/>
<link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-icon-180x180.png"/>
<link rel="icon" type="image/png" sizes="192x192"  href="/favicon/android-icon-192x192.png"/>
<link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="96x96" href="/favicon/favicon-96x96.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png"/>
<link rel="manifest" href="/favicon/manifest.json"/>
<meta name="msapplication-TileColor" content="#ffffff"/>
<meta name="msapplication-TileImage" content="/favicon/ms-icon-144x144.png"/>
<meta name="theme-color" content="#ffffff"/>
```
