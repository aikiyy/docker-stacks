.PHONY: run
docker-build-jupyter:
	docker build -t aikiyy/jupyter jupyter

docker-run-jupyter:
	docker run \
		-it \
		-d \
		--name jupyter \
		-p 8888:8888 \
		-v $(CURDIR)/jupyter/.jupyter/nbconfig:/home/jovyan/.jupyter/nbconfig \
		-v $(CURDIR)/jupyter/.ipython/profile_default:/home/jobyan/.ipython/profile_default \
		-v $(#set dir):/home/jovyan \
		aikiyy/jupyter \
		start-notebook.sh \
		--NotebookApp.password=$(#set password)

docker-build-postgres:
	docker build -t aikiyy/postgres postgres

docker-run-postgres:
	docker run \
		-it \
		-d \
		--name postgres \
		-p 5435:5432 \
		-v $(CURDIR)/sql_file:/docker-entrypoint-initdb.d \
		aikiyy/postgres
