sudo docker run \
	-p 8888:8888 \
    --gpus all\
    --name config-test \
    -v fastai-volume-persist:/data \
    --ipc=host \
	fastai-docker \
	jupyter notebook --ip 0.0.0.0 --allow-root --NotebookApp.token='' --NotebookApp.password=''
