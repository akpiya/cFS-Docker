y# Running cFS in Docker Containers
If you are already running a Linux system then this guide won't be useful for you since cFS should already run on your system. But those on Mac and Windows will either have to use a virtual machine or docker to develop cFS applications. This guide is for developing cFS in a docker container.

## Download Docker Desktop
Go to this link and follow the instructions for downloading [docker desktop](https://www.docker.com/products/docker-desktop/) for your specific platform:

## Clone the cFS repository
Go to your cubesat project directory where all code related to this club will live and git clone the NASA cFS repository:
`
git clone https://github.com/nasa/cFS.git
`

## Create a Dockerfile
The Dockerfile specifies how to build an image. Here is mine that should work for you. Copy and paste the following text into a file named "Dockerfile".
`
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    vim \
    cmake

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]
`

## Build the Image
Go to the directory that contains `Dockerfile` and run the following to build the docker image.
`
docker build -t ubuntu-container .
`

## Run a Docker Container
Run the docker container with the privileged flag set and the volume mounted. Replace PathToCfs with the path to your directory containing cFS
`
docker run -it --privileged --name cFS -v PathToCfs:/app ubuntu-container /bin/bash
`

Once in the terminal install cmake:
`
apt-get install -y cmake
`

And run the following command:
`
echo 1025 > /proc/sys/fs/mqueue/msg_max
`

## Ensure cFS compiles and runs correctly
Go into the `cFS` directory and run the following commands:
`
make Simulation=native prep
make
make install
cd build/exe/cpu1/
./core-cpu1
`

## Exiting and Restarting the Docker Container
Run `exit` in the terminal which will stop the docker container from running. To restart it, run:
`
docker start -i -a cFS
`

