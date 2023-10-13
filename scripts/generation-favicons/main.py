from PIL import Image
import json
import typer 
from os import path


icons = {
    'apple-icon-57x57.png': (57, 57),
    'apple-icon-60x60.png': (60, 60),
    'apple-icon-72x72.png': (72, 72),
    'apple-icon-76x76.png': (76, 76),
    'apple-icon-114x114.png': (114, 114),
    'apple-icon-120x120.png': (120, 120),
    'apple-icon-144x144.png': (144, 144),
    'apple-icon-152x152.png': (152, 152),
    'apple-icon-180x180.png': (180, 180),
    'apple-icon.png': (192, 192),
    'apple-icon-precomposed.png': (192, 192),
    'android-icon-36x36.png': (36, 36),
    'android-icon-48x48.png': (48, 48),
    'android-icon-72x72.png': (72, 72),
    'android-icon-96x96.png': (96, 96),
    'android-icon-144x144.png': (144, 144),
    'android-icon-192x192.png': (192, 192),
    'favicon-16x16.png': (16, 16),
    'favicon-32x32.png': (32, 32),
    'favicon-96x96.png': (96, 96),
    'ms-icon-70x70.png': (70, 70),
    'ms-icon-144x144.png': (144, 144),
    'ms-icon-150x150.png': (150, 150),
    'ms-icon-310x310.png': (310, 310),
    'favicon.ico': (16, 16)
}

manifest = {
  "name": "Nom de l'application",
  "icons": [
    {
      "src": "android-icon-36x36.png",
      "sizes": "36x36",
      "type": "image/png",
      "density": "0.75"
    },
    {
      "src": "android-icon-48x48.png",
      "sizes": "48x48",
      "type": "image/png",
      "density": "1.0"
    },
    {
      "src": "android-icon-72x72.png",
      "sizes": "72x72",
      "type": "image/png",
      "density": "1.5"
    },
    {
      "src": "android-icon-96x96.png",
      "sizes": "96x96",
      "type": "image/png",
      "density": "2.0"
    },
    {
      "src": "android-icon-144x144.png",
      "sizes": "144x144",
      "type": "image/png",
      "density": "3.0"
    },
    {
      "src": "android-icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png",
      "density": "4.0"
    }
  ],
}


def create_icons(source_file: str, directory: str):
    global icons
    im = Image.open(source_file)
    for icon in icons:
        im.resize(icons[icon]).save(directory + icon)
        typer.echo("Création de l’icone : " + icon)

def create_manifest(directory: str):
    global manifest
    manifest = json.dumps(manifest, indent=2)
    typer.echo("Création du manifest.json")
    with open(directory + 'manifest.json', 'w') as f:
        f.write(manifest)

def main(
        source_file: str = typer.Argument(..., help="Fichier source pour la création des icones et du manifest.json"),
        manifest_name: str = typer.Option("Nom de l’application", help="Nom de l’application"), 
        directory_in_manifest = typer.Option("favicons/", help="Dossier à renseigner dans le manifest.json pour les chemins des fichiers.")):
    """
    Création des icones et du manifest.json
    """
    typer.echo("Création des icones et du manifest.json")

    global manifest

    if not path.exists(directory_in_manifest):
        typer.echo("Création du dossier : " + directory_in_manifest)
        path.mkdir(directory_in_manifest)

    manifest['name'] = manifest_name
    for icon in manifest['icons']:
        icon['src'] = directory_in_manifest + icon['src']
    
    create_icons(source_file, directory_in_manifest)
    create_manifest(directory_in_manifest)

typer.run(main)
