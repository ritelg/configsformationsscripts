# Telecargement de video youtube avec youtube-dl

## Une video
youtube-dl <a href="https://www.youtube.com/watch?v=yrlsBc7cHXc">https://www.youtube.com/watch?v=yrlsBc7cHXc</a>

## Choisir le format 
Listes : youtube-dl -F https://www.youtube.com/watch\?v\=yrlsBc7cHXc
Choix : youtube-dl -f 137 https://www.youtube.com/watch\?v\=yrlsBc7cHXc

## Telecharger toute une liste de videos
youtube-dl -a monfichier.txt

## Telecharger tout une chaine Youtube
youtube-dl -citw ytuser:<USER>

## Telecharger une playlist youtube
youtube-dl -citw https://www.youtube.com/playlist\?list\=PLOXDAW8CCLfRwMhJQaL8UAMnxHNSmyFOV
