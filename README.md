# Running cFS in Docker Containers
If you are already running a Linux system, this guide won't be useful for you since cFS should already run on your system. But those on Mac and Windows will either have to use a virtual machine or docker to develop cFS applications. This guide is for creating a docker environment to develop cFS applications.

## Download Docker Desktop
Go to this link and follow the instructions to download [docker desktop](https://www.docker.com/products/docker-desktop/) for your specific platform:

## Clone the cFS repository
Go to your cubesat project directory where all code related to this club will live and clone the NASA cFS repository:
```bash
git clone https://github.com/nasa/cFS.git
```

## Create a Dockerfile
The Dockerfile specifies how to build an image. Here is mine that should work for you. Copy and paste the following text into a file named "Dockerfile".
```bash
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    vim

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]
```

## Build the Image
Go to the directory that contains `Dockerfile` and run the following to build the docker image.
```bash
docker build -t ubuntu-container .
```

## Run a Docker Container
Run the docker container with the privileged flag set and the volume mounted. Replace PathToCfs with the path to your directory containing cFS
```bash
docker run -it --privileged --name cFS -v PathToCfs:/app ubuntu-container /bin/bash
```

Once in the terminal install cmake:
```bash
apt-get install -y cmake
```

And run the following command:
```bash
echo 1024 > /proc/sys/fs/mqueue/msg_max
```

## Ensure cFS compiles and runs correctly
Go into the `cFS` directory and run the following commands:
```bash
make Simulation=native prep
make
make install
cd build/exe/cpu1/
./core-cpu1
```
Several applications will be logged to the screen. Hit `<Ctrl>-c` and examine the logs making sure there are no errors. If there are none, then that's it.

## Exiting and Restarting the Docker Container
Run `exit` in the terminal which will stop the docker container from running. To restart it, run:
```bash
docker start -i -a cFS
```
