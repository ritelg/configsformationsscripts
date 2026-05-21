.PHONY: install init_ansible help

install: ## Installe le serveur
	ansible-playbook i "localhost," -c local install.yml --ask-become-pass 
init_ansible: ## Initialisation de ansible
	sudo bash ./init-ansible.sh

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
