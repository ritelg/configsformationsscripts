.PHONY: install init up  deploy reinstall help

up: ## Lance la vm 
	vagrant up

install: ## Installe le serveur
	ansible-playbook -i hosts install.yml --vault-password-file .vault_pass

deploy: ## Permet de deployer une application

encrypt: ## Encrypte un password avec vault
	ansible-vault encrypt_string

reinstall: ## Reinstall vagrant et lance les playbook
	vagrant destroy --force
	vagrant up
	ssh-keygen -f "/home/ritelg/.ssh/known_hosts" -R 192.168.50.50
	

init: ## Reinitialise la vm
	vagrant snapshot restore snapshot2

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
