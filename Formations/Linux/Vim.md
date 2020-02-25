# Tutoriel de Vim

1. [Liens utiles](#liens-utiles)
2. [Modes](#modes)
3. [Les Verbes](#les-verbes)
4. [Sujets mouvements](#sujets-mouvements)
5. [Sujets objet textes](#sujets-objet-textes)
6. [Sujets cible](#sujets-cible)
7. [Commande sur caractère courant](#commande-sur-caractre-courant)
8. [Registre](#registre)
9. [Insertion](#insertion)
10. [Commandes de base](#commandes-de-base)
11. [Commande Globale](#commande-globale)
12. [Programmeurs](#programmeurs)
13. [Repli](#repli)
14. [Macro](#macros)
15. [Correction orthographe](#correction-orthographe)

## Liens utiles
	* ftp://ftp.traduc.org/pub/lgazette/html/2008/152/lg152-C.html
## Modes
	* Remplacement Shift+r
## Les verbes
	* d ''delete
	* c change
	* >	indenter
	* = auto indenter
	* v visuel (Shift+v : visuel ligne), (Ctrl+v : visuel bloc)
	* y copier
## Sujets mouvements
	* w word
	* b back
	* s sentence
	* p paragraphe
	* $ fin de ligne
	* 2j 2lignes vers le bas
## Sujets objet textes
	* iw inner word
	* it inner tag
	* a( all parentheses
	* i( inner parentheses
## Sujets cible
	* t<caractere> jusqu'à prochaine occurrence du caractère
	* f<caractere> jusqu'à prochaine occurrence du caractère compris
	* T<caractere> pareil t en arrière
	* F<caractere> pareil f en arrière
	* / jusqu'à la recherche
	* % jusqu'à recherche en arrière
## Commande sur caractère courant
	* x supprimer caractère
	* r<caractere> remplace le caractère par le caractère saisi
## Registre
	* dd
	* yy
	* p
## Insertion
	* i insérer avant caractère
	* I insérer en debut de ligne
	* a insérer après caractère
	* A insérer en fin de ligne
## Commandes de base
	* :new crée un nouveau buffer (déplacement Ctrl+w +flèche)
	* :w sauvegarde
	* :q quit
	* :r file
	* :r !commande
	* :!commande
	* :ls lister buffer
## Commande Globale
	* g/pattern/p : affiche les lignes correspondantes
	* g/pattern/d : supprimé ////
	* /pattern/s//pattern/ remplace le premier par le second pattern
## Programmeurs
	* gD : sauter vers definition de fonction
	* gf : va vers le nom de fichier
## Repli
	* zo :ouvrir
	* zc : ferme
	* zf% repli de fonction fermeture accolades
	* zj repli suivant
	* zk precedent repli
## Macros
	* qa démarré enregistrement et enregistre dans a
	* q stoppe enregistrement
	* @a execute macro dans le registre a
## Correction orthographe
	* z= et vous entrez dans le mode "choix de mot" - taper Enter ou le numéro du mot que vous voulez utiliser.
	* zg pour ajouter le mot dans le dictionnaire local
	* zG pour l'ajouter au dictionnaire global
	* ]s pour aller au prochain mot
	* [s pour aller au prochain mot
