all:

images: hub-image user-image installer-image

hub-image:
	docker build -t docker-registry.chivo.cl/jovial/hub docker/hub
	docker push docker-registry.chivo.cl/jovial/hub

user-image:
	docker build -t docker-registry.chivo.cl/jovial/user docker/user
	docker push docker-registry.chivo.cl/jovial/user

installer-image:
	docker build -t docker-registry.chivo.cl/jovial/installer docker/conda-installer
	docker push docker-registry.chivo.cl/jovial/installer

install:
	helm install jovial/
