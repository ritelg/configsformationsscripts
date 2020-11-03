# GIT

## Configs
* git config --global branch.autosetuprebase always

## Revenir en arreiere

* git checkout commit : Voir etat depot au commit mais aucune modification ne doit etre faite
* git checkout commit file : Recupere etat file au moment du commit
* git revert commit : Annule les modifs d'un commit mais en faisant un nouveau commit
* git reset commit : Suprimes les commits apres celui passe mais unstage les modifs
* git reset commit --hard : Reviens a commit mais ne garde pas les modifs
* git reset commit --mixed : Reviens a commit mais unstage les modifs
* git reset commit --soft : Reviens a commit mais stage les modifs

## Remote
* Init repo sans dossier de travail : git init --bare
* Supprimer branch distante : git push origin --delete feats/docs
## Rebase

* Fusions de plusieurs commit : git rebase -i 8255aa8
* Annuler rebase : git rebase --abort

* Supression fichier de tous les commit : git rm --cached <file>


## Stashing
* git stash
* git stash apply ID_STASH
* git stash drop
* git stash NAME
* git stage show ID_STASH
* git stash pop ID_STASH : apply et drop le stash
* git stash branch NOM_BRANCH
* git stash clear : Nettoye tous les stash