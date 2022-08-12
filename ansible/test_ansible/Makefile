.PHONY: help
help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $, $}'

.PHONY: playbook
playbook: 
	ansible-playbook -i ./inventory.yml ./playbook.yml

.PHONY: test
test: ## Lance les tests avec molecule
	molecule test

.PHONY: playbook_localhost
playbook_localhost: ## Lance le playbook en local 
	ansible-playbook ./playbook_localhost.yml -K

