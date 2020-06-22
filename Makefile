.PHONY: build clean launch-cpu launch-gpu test

SHELL=/bin/bash
DOCKER_IMAGE=shigeto/openke:0.1.0

################

build: openke
	#docker build --no-cache=true -t $(DOCKER_IMAGE) -f docker/Dockerfile .
	docker build -t $(DOCKER_IMAGE) -f docker/Dockerfile .
	rm -rf openke/release
	docker run -it --rm -v $(PWD):/workspace -w /workspace/openke $(DOCKER_IMAGE) /bin/bash ./make.sh

openke:
	git clone -b OpenKE-PyTorch --depth 1 https://github.com/thunlp/OpenKE temp
	cp -rf temp/openke . 
	mv temp/benchmarks .
	mv temp/examples .
	git -C temp --no-pager log > openke/version
	rm -rf temp

clean:
	rm -rf openke benchmarks examples

#################

test:
	cp examples/train_distmult_WN18RR.py .
	docker run --gpus all -it --rm -v $(PWD):/workspace -w /workspace $(DOCKER_IMAGE) python train_distmult_WN18RR.py

################

launch-cpu:
	docker run -it --rm -v $(PWD):/workspace -w /workspace $(DOCKER_IMAGE) /bin/bash

launch-gpu:
	docker run --gpus all -it --rm -v $(PWD):/workspace -w /workspace $(DOCKER_IMAGE) /bin/bash


