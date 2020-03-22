sudo docker run \
    -p 8888:8888 \
    -v fastai-volume-persist:/data \
    -it \
	fastai-docker \
    /bin/bash
