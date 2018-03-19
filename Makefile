.PHONY: build

CONTAINERNAME=thornycrackers_elixir_testing
IMAGENAME=thornycrackers/elixir_testing

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build the Docker image
	docker build -t $(IMAGENAME) ./docker

up: build ## Bring the container up
	docker run -dP -v $(CURDIR):/app --name $(CONTAINERNAME) $(IMAGENAME) /bin/bash -c '/opt/entry.sh'

down: ## Stop the container
	docker stop $(CONTAINERNAME) || echo 'No container to stop'

enter: ## Enter the running container
	docker exec -it $(CONTAINERNAME) /bin/bash

clean: down ## Remove the image and any stopped containers
	docker rm $(CONTAINERNAME) || echo 'No container to remove'
