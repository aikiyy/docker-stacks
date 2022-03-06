FROM jupyter/datascience-notebook

# Install Jupyter Notebook extensions
RUN conda install -y -c conda-forge jupyter_contrib_nbextensions

# Install python library
COPY ./requirements.txt $HOME/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r $HOME/requirements.txt

# Set up Jupyter Notebook config
RUN ipython profile create
COPY .jupyter/custom $HOME/.jupyter/custom
COPY .ipython/profile_default/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
ENV CONFIG /home/jovyan/.jupyter/jupyter_notebook_config.py
ENV CONFIG_IPYTHON /home/jovyan/.ipython/profile_default/ipython_config.py
COPY .jupyter/nbconfig $HOME/.jupyter/nbconfig

# Load Google Application Credential
ENV GOOGLE_APPLICATION_CREDENTIALS ./config/metabase-189510-5a915957d013.json
