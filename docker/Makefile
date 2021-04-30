user := $(shell id -u)
group := $(shell id -g)
dr := USER_ID=$(user) GROUP_ID=$(group) docker-compose run --rm
drtest := USER_ID=$(user) GROUP_ID=$(group) docker-compose -f docker-compose-test.yml run --rm

dphp := docker exec dev_php
tphp := docker exec -it test_php
all_container := docker ps -a -q

ENV := dev

.PHONY: help
help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


##############################
#########    YARN    #########
##############################

.PHONY: install
install: node_modules/time vendor/autoload.php ## Installe les différentes dépendances
	yarn run build

.PHONY: yarn
yarn: node_modules/time vendor/autoload.php ## Installe les différentes dépendances
	yarn run dev-server
###########################################
######    DATABASE et FIXTURES    #########
###########################################

.PHONY: seed
seed: vendor/autoload.php ## Génère des données
	$(dphp) php bin/console doctrine:fixtures:load --env=$(ENV)

.PHONY: migrate
migrate: vendor/autoload.php ## Migre la base de donnée
	$(dphp) php php bin/console doctrine:migrations:migrate --env=$(ENV)

.PHONY: db_create
db_create: ## Crée la base de donnée
	$(dphp) bin/console doctrine:database:create --env=$(ENV)

db_update: ## Recree la base de données
	php bin/console doctrine:database:drop --force
	php bin/console doctrine:database:drop --force --env=test
	php bin/console doctrine:database:create
	php bin/console doctrine:database:create --env=test
	php bin/console doctrine:schema:update --force
	php bin/console doctrine:schema:update --force --env=test
	php bin/console doctrine:fixtures:load --no-interaction
	php bin/console doctrine:fixtures:load --env=test --no-interaction
############################
######    TESTS    #########
############################

.PHONY: test
test: vendor/autoload.php ## Execute les tests
	./bin/phpunit -d xdebug.profiler_enable=on -d xdebug.idekey=blacktie $(TEST)

.PHONY: phpunit_watcher
phpunit_watcher: ## Lance le watcher de phpunit
	./vendor/bin/phpunit-watcher watch --filter="nothing"

.PHONY: lint
lint: ## Lance le php-cs-fixer
	./vendor/bin/php-cs-fixer fix --config-set colors 1

.PHONY: phpcs
phpcs: ## Lance le php-cs
	./vendor/bin/phpcs ./src && ./vendor/bin/phpcs ./tests

.PHONY: phpcbf
phpcbf: ## Lance le php-cs
	./vendor/bin/phpcbf ./src && ./vendor/bin/phpcbf ./tests

#####################################
######    DOCKER COMPOSE    #########
#####################################

.PHONY: clean
clean: ## Nettoie les containers laissés en fonction
	docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
.PHONY: dev
dev: vendor/autoload.php ## Lance le serveur de développement
	USER_ID=$(user) GROUP_ID=$(group) docker-compose -f ./docker-compose.yml up -d

.PHONY: delete_container
delete_container:
	docker stop $($(all_container)) && docker rm $($(all_container))

.PHONY: dev_build
dev_build: vendor/autoload.php ## Lance le serveur de développement
	USER_ID=$(user) GROUP_ID=$(group) docker-compose -f ./docker-compose.yml build

.PHONY: dev_test
dev_test: vendor/autoload.php ## Lance le serveur de test
	 docker-compose -f ./docker-compose-test.yml up -d

.PHONY: ssh_dev_php
ssh_dev_php: ## SSH du container dev_php
	docker exec -it dev_php fish

.PHONY: ssh_test_php
ssh_test_php: ## SSH du container test_php
	docker exec -it test_php fish

#############################
######    AUTRES    #########
#############################

.PHONY: doc
doc: ## Génère le sommaire de la documentation
	npx doctoc ./README.md

vendor/autoload.php: composer.lock
	USER_ID=$(user) GROUP_ID=$(group) docker-compose run --rm --no-deps php composer install
	touch vendor/autoload.php

node_modules/time: yarn.lock
	yarn
	touch node_modules/time

