all:

images: hub-image user-image

hub-image:
	docker build -t docker-registry.chivo.cl/jovial/hub docker/hub
	docker push docker-registry.chivo.cl/jovial/hub

user-image:
	docker build -t docker-registry.chivo.cl/jovial/user docker/user
	docker push docker-registry.chivo.cl/jovial/user

install:
	helm install kubernetes/jovial/
