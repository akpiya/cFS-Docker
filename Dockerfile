# Parent image
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    vim \
    cmake \
    libexpat1-dev \
    liblua5.3-dev \
    libjson-c-dev \
    python3-dev \
    python3-pip \
    python3-tk

RUN apt install -y default-jre

RUN pip3 install PySimpleGUI requests paho-mqtt numpy pymupdf

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]
