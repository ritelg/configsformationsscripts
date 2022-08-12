FEDORA_NAME := fedora_systemd
DEBIAN_NAME := debian_systemd

.PHONY: fedora_systemd
fedora_systemd:
	docker run -tid --rm --cap-add NET_ADMIN --cap-add SYS_ADMIN --publish-all=true -v /srv/data:/srv/html --name $(FEDORA_NAME) -h $(FEDORA_NAME) --volume /sys/fs/cgroup:/sys/fs/cgroup:ro ritelg/fedora:35-systemd 
	docker exec -it $(FEDORA_NAME) fish

.PHONY: fedora_systemd_build
fedora_systemd_build:
	docker build --rm -t ritelg/fedora:35-systemd ~/Documents/ProjectWeb/Formations_Configs_Scripts/docker/fedora-systemd/

.PHONY: all
all:
	docker_scripts.sh --fedora-systemd

.PHONY: debian_systemd_build
debian_systemd_build:
	docker build --rm -t ritelg/debian:10-systemd ~/Documents/ProjectWeb/Formations_Configs_Scripts/docker/debian-systemd/

.PHONY: debian_systemd
debian_systemd:
	docker run -tid --rm --cap-add NET_ADMIN --cap-add SYS_ADMIN --publish-all=true -v /srv/data:/srv/html -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name $(DEBIAN_NAME) -h $(DEBIAN_NAME) ritelg/debian:10-systemd
	docker exec -it $(DEBIAN_NAME) fish

.PHONY: help
help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
