#!/bin/bash

########################################################
#
# Description : Script pour creer les labels pour un repository github
#
# Usage : github-addlabels.sh REPOSITORY_PATH GITHUB_TOKEN
#
# Auteur : Gaëtan Ritel
#
# Date : 25/02/24
#
########################################################

RESPOSITORY_PATH="$1"

# Votre token d'accès personnel GitHub. Remplacez ceci par votre vrai token.
GITHUB_TOKEN="$2"

# Labels à créer
# Format: "nom_du_label,couleur,description"
LABELS=(
  "Back,6599c8,Label for backend related issues"
  "Front,6599c8,Label for frontend related issues"
  "Développement,320064,Label for development related tasks"
  "Animation,0000fb,Label for animation related tasks"
  "Conception,9300d1,Label for design related tasks"
  "Feature,6599c8,Label for new features"
  "INFRA,cb3387,Label for infrastructure related issues"
  "Observabilité,cb5a41,Label for observability related issues"
  "Documentation,f4e7ca,Label for documentation related issues"
  "Dette technique,ec4141,Label for technical debt issues"
  "CI/CD,ea901e,Label for CI/CD related tasks"
  "FIX,da153b,Label for bug fixes"
  "En cours,ea901e,Label for current task"
  "Pré Production,ece600,Label for issues related to the pre-production stage"
  "Sprint,6599c8,Label for issues related to sprints"
  "À déployer en Production,8ebc8d,Label for that are ready to be deployed to production"
  "À déployer en Pré Prod,8ebc8d,Label for that are ready to be deployed to pre-production"
  "To Do,5CB85C,Label for new tasks"
  "Doing,5CB85C,Label for finishing"
  "Low,5CB85C,Label for low priority"
  "Medium,F0AD4E,Label for medium priority"
  "High,FF0000,Label for medium priority"
  "CONFIG,8ebc8d,Label for configuration"
)

# Fonction pour créer un label
create_label() {
  label_name=$(echo $1 | cut -d "," -f 1)
  label_color=$(echo $1 | cut -d "," -f 2)
  label_description=$(echo $1 | cut -d "," -f 3-)

  # Appel de l'API GitHub pour créer le label
  curl -s -X POST "https://api.github.com/repos/$RESPOSITORY_PATH/labels" \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -d "{\"name\":\"$label_name\",\"color\":\"$label_color\",\"description\":\"$label_description\"}"
}

# Création des labels
for label in "${LABELS[@]}"; do
  echo "Création du label: $label"
  create_label "$label"
done

echo "Tous les labels ont été créés avec succès."


