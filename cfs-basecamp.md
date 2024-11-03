# CFS-Basecamp on Mac
Currently, cFS doens't run on Mac operating systems. This can make development and testing somewhat difficult. A previous write-up has been created to install and run cFS on Mac using an ubuntu docker container. Extending the previous tutorial, this one allows you to run cFS-basecamp on a Mac system.

## Port Forwarding
cFS basecamp uses GUIs, so we need to enable port forwarding on the docker container. On Mac this is done using [XQuartz](https://www.xquartz.org/). Follow (this)[!https://gist.github.com/sorny/969fe55d85c9b0035b0109a31cbcb088] tutorial to download xQuartz on your **Mac** computer. Once you've successfully run `xhost +locahost` move on to the next section.

## Run Docker with x11 port forwarding setup
Now that port forwarding is setup, run your docker container with volumes binded and the display port setup. This can be.
```bash
docker run --sysctl fs.mqueue.msg_max=512 -v .:/vol -e DISPLAY=docker.for.mac.host.internal:0 -it ubuntu /bin/bash
```

