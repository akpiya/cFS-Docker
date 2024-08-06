# Parent image
FROM ubuntu:20.04

# Maintainer Label
LABEL maintainer="apiya@uchicago.edu"

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    vim

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]
