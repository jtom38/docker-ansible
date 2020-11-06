.PHONY: help
help: ## Shows this help command
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build-image-latest: ## Builds the 2.10.2 image
	REPO=jtom38
	BUILD=latest
	docker build -t $(REPO)/ansible:$(BUILD) . --build-arg ANSIBLE_VER=2.10.3 TF_VER=0.13.5
	docker run -it jtom38/ansible:latest ansible --version
	docker run -it jtom38/ansible:latest terraform --version
	docker run -it jtom38/ansible:latest molecule --version
	docker run -it jtom38/ansible:latest docker --version

build-image-2.10:
	docker build -t jtom38/ansible:2.10.3 . --build-arg ANSIBLE_VER=2.10.3 --build-arg TF_VER=0.13.5
	docker run -it jtom38/ansible:2.10.3 ansible --version
	docker run -it jtom38/ansible:2.10.3 terraform --version
	docker run -it jtom38/ansible:2.10.3 molecule --version
	docker run -it jtom38/ansible:2.10.3 docker --version

build-image-2.9: ## Builds the 2.9.11 image	

	docker build -t jtom38/ansible:2.9.11 . --build-arg ANSIBLE_VER=2.9.11 TF_VER=0.13.5
	docker run -it jtom38/ansible:2.9.11 ansible --version
	docker run -it jtom38/ansible:2.9.11 terraform --version
	docker run -it jtom38/ansible:2.9.11 molecule --version
	docker run -it jtom38/ansible:2.9.11 docker --version
	docker push jtom38/ansible:2.9.11
