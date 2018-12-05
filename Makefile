.PHONY: run
docker-build:
	docker build -t aikiyy/jupyter jupyter

docker-run:
	docker run \
		-it \
		-d \
		--name jupyter \
		-p 8888:8888 \
		-v $(CURDIR)/jupyter/.jupyter/nbconfig:/home/jovyan/.jupyter/nbconfig \
		-v $(#set dir):/home/jovyan \
		aikiyy/jupyter \
		start-notebook.sh \
		--NotebookApp.password=$(#set password)
