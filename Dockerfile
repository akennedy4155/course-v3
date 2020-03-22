FROM nvidia/cuda:10.2-base

# Install Python 3.8

# Requirements for install
RUN apt update && apt install -y \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev wget \
    libsqlite3-dev \
    liblzma-dev \
    libbz2-dev \
    nano

# Download and untar Python source
RUN wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
RUN tar -xf Python-3.8.2.tgz

# Configure and install Python from source
RUN cd Python-3.8.2 && ./configure --enable-optimizations --enable-loadable-sqlite-extensions
RUN cd Python-3.8.2 && make && make install

# Install pip and required packages
RUN apt install -y python3-pip
RUN pip3 install notebook
RUN pip3 install fastai
RUN pip3 install ipywidgets
RUN pip3 install kaggle


# Install Kaggle API token and change permissions
RUN mkdir -p /root/.kaggle
COPY kaggle.json /root/.kaggle/kaggle.json
RUN chmod 600 /root/.kaggle/kaggle.json

# more install for version control
RUN pip3 install jupytext
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.contents_manager_class='jupytext.TextFileContentsManager'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.ContentsManager.default_jupytext_formats = '.ipynb,.Rmd'" >> /root/.jupyter/jupyter_notebook_config.py
