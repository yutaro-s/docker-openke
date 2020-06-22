FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-devel

LABEL maintainer="shigeto@stair.center"

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    language-pack-en-base \ 
    parallel \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# set env
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# install utils
RUN conda install -y -c conda-forge pudb
RUN conda install -y scikit-learn

# install openKE
#WORKDIR /tools
#RUN git clone -b OpenKE-PyTorch --depth 1 https://github.com/thunlp/OpenKE
#RUN cd OpenKE/openke && bash make.sh
#ENV PYTHONPATH $PYTHONPATH:/tools/OpenKE
