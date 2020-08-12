
# Docker environment for OpenKE-Pytorch

Docker environment for [OpenKE-pytorch](https://github.com/thunlp/OpenKE)


## Requirements
- [Docker](https://docs.docker.com/) >= 19.03
- [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker)


## Build
Build a docker image from a Dockerfile and then compile C++ files in OpenKE

```
make build
```


## Test

Launch a docker container and run an example file in this container

```
make test
```

It took about 40 minutes on GTX 1080Ti.

If you would like to try it without GPU, you will need to set GPU flag to false (`use_gpu = False`) in the python file
and launch a docker container without GPU option (remove `--gpus all`)

