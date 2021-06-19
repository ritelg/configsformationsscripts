user := $(shell id -u)
group := $(shell id -g)
dr := USER_ID=$(user) GROUP_ID=$(group) docker-compose run --rm
drtest := USER_ID=$(user) GROUP_ID=$(group) docker-compose -f docker-compose-test.yml run --rm

all_container := docker ps -a -q

ENV := dev
docker_compose := USER_ID=$(user) GROUP_ID=$(group) docker-compose -f ./docker/docker-compose.yml


.PHONY: help
help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: registry
registry: ## Lance la registry docker
	$(docker_compose) up registry


## Jenkins

.PHONY: jenkins
jenkins: ## Lance la registry docker
	$(docker_compose) up jenkins

.PHONY: build_jenkins
build_jenkins: ## Lance la registry docker
	$(docker_compose) build jenkins

.PHONY: jenkins_ssh
jenkins_ssh: ## SSH pour le serveur Nodejs
	docker exec -it pipeline-jenkins fish

## DEBIAN


.PHONY: build_debian
build_debian: ## Lance la registry docker
	$(docker_compose) build srv_dev

.PHONY: srv_dev
srv_dev: ## Lance la registry docker
	$(docker_compose) run srv_dev fish

.PHONY: srv_dev_ssh
srv_dev_ssh: ## SSH pour le serveur Nodejs
	docker exec -it srv_dev fish

## GITLAB

.PHONY: gitlab
gitlab: ## Lance Jenkins et 
	sudo $(docker_compose) up gitlab

.PHONY: dev_pipeline
dev_pipeline: ## Lance Jenkins et 
	$(docker_compose) up jenkins registry
