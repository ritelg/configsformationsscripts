.PHONY: help
help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: lists_ip
lists_ip: # Listes les ips vagrant
	cat Vagrantfile | grep -ri ip:

.PHONY: ssh_jenkins
ssh_jenkins: ## SSH avec Jenkins
	ssh 192.168.5.2
	
.PHONY: ssh_registry
ssh_registry: ## SSH avec Registry
	ssh 192.168.5.5

.PHONY: ssh_gitlab
ssh_gitlab: ## SSH avec Gitlab
	ssh 192.168.5.10

.PHONY: ssh_stage
ssh_stage: ## SSH avec serveur stage
	ssh 192.168.5.7

.PHONY: ssh_prod
ssh_prod: ## SSH avec serveur prod
	ssh 192.168.5.4

.PHONY: ssh_dev
ssh_dev: ## SSH avec serveur dev
	ssh 192.168.5.3