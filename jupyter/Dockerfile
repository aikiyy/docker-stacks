FROM jupyter/datascience-notebook

RUN conda install -y -c conda-forge jupyter_contrib_nbextensions

COPY ./requirements.txt $HOME/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r $HOME/requirements.txt

COPY .jupyter/custom $HOME/.jupyter/custom
COPY .ipython/profile_default $HOME/.ipython/profile_default
