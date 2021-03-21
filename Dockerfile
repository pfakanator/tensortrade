FROM nvcr.io/nvidia/tensorflow:21.02-tf2-py3:latest

WORKDIR /

COPY . ./

SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -yq --assume-yes --no-install-recommends \
  wget \
  zip \
  git \
  python3-pip \
  python3-dev \
  python3-setuptools

RUN pip install --upgrade pip
RUN pip install -e .[tf,ccxt,stochastic,docs,tests]
RUN pip install -r ./requirements.txt
RUN pip install -r ./examples/requirements.txt
