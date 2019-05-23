.PHONY: run
docker-build-jupyter:
	docker build -t aikiyy/jupyter jupyter

docker-run-jupyter:
	docker run \
		-it \
		-d \
		--name jupyter \
		-p 8888:8888 \
		-v $(JUPYTER_DOCKER_HOME_DIR):/home/jovyan/work \
		aikiyy/jupyter \
		start-notebook.sh \
		--NotebookApp.token='' \
		--NotebookApp.password=''

docker-build-postgres:
	docker build -t aikiyy/postgres postgres

docker-run-postgres:
	docker run \
		-it \
		-d \
		--name postgres \
		-p 5434:5432 \
		-v $(CURDIR)/sql_file:/docker-entrypoint-initdb.d \
		aikiyy/postgres

docker-build-rstudio:
	docker build -t aikiyy/rstudio rstudio

docker-run-rstudio:
	docker run \
		-it \
		-d \
		--name rstudio \
		-p 8787:8787 \
		-v $(R_DOCKER_HOME_DIR):/home/rstudio \
		aikiyy/rstudio
