# Running cFS in Docker Containers
If you are already running a Linux system, this guide won't be useful for you since cFS should already run on your system. But those on Mac will either have to use a virtual machine or docker to develop cFS applications. This guide is for creating a docker environment to develop cFS applications.

## Create a Dockerfile
The Dockerfile specifies how to build an image. Copy and paste the following the text in "Dockerfile" into a local file with the same name.

## Build the Image
Go to the directory that contains `Dockerfile` and run the following to build the docker image.
```bash
docker build -t ubuntu .
```

## Port Forwarding
cFS basecamp uses GUIs, so we need to enable port forwarding on the docker container. On Mac this is done using [XQuartz](https://www.xquartz.org/). Follow (this)[!https://gist.github.com/sorny/969fe55d85c9b0035b0109a31cbcb088] tutorial (up to Step 5) to download xQuartz on your **Mac** computer. Once you've successfully run `xhost +locahost` move on to the next section.

## Run a Docker Container
Run the docker container with the privileged flag set and the volume mounted. Replace PathToCfs with the path to your directory containing cFS.
```bash
docker run --sysctl fs.mqueue.msg_max=512 -v <PathToCfs>:/vol -e DISPLAY=docker.for.mac.host.internal:0 -it ubuntu /bin/bash
```

## Ensure cFS compiles and runs correctly
Within the terminal in your Docker container, run `cd /vol` and follow (these)[!https://pypi.org/project/cfs-basecamp/] instructions to clone the git repository and run the software.

## Exiting and Restarting the Docker Container
Run `exit` in the terminal which will stop the docker container from running. To restart it, run:
```bash
docker start -i -a cFS
```
