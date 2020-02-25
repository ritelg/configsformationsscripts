
.PHONY: up
up: ## Lance la vm 
	vagrant up

.PHONY: install
install: ## Installe le serveur
	ansible-playbook -i hosts install.yml 

.PHONY: deploy
deploy: ## Permet de deployer une application

.PHONY: encrypt
encrypt: ## Encrypte un password avec vault
	ansible-vault encrypt_string

.PHONY: reinstall
reinstall: ## Reinstall vagrant et lance les playbook
	vagrant destroy --force
	vagrant up
	ssh-keygen -f "/home/ritelg/.ssh/known_hosts" -R 192.168.50.50

.PHONY: init
init: ## Reinitialise la vm
	vagrant snapshot restore default-save

.PHONY: ssh
ssh: ## SSH
	ssh root@192.168.6.2

.PHONY: ssh_user
ssh_user: ## SSH
	ssh dev@192.168.6.2

.PHONY: help
help: ## Aide
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
