# Image Args
ARG UBUNTU_VER
ARG CUDA_VER

FROM nvidia/cuda:${CUDA_VER}-devel-ubuntu${UBUNTU_VER}
ARG TORCH_VER
ARG TORCHVISION_VER
ARG TORCHAUDIO_VER
ARG PYTORCH_EXTRA_IDX_URL

LABEL maintainer="Edgar Y. Walker <eywalker@uw.edu>, Daniel Sitonic <sitonic@uw.edu>"

# Deal with pesky Python 3 encoding issue
ENV LANG C.UTF-8

# Prevent Debian/Ubuntu from asking questions
ENV DEBIAN_FRONTEND noninteractive

# # Install essential Ubuntu packages
# # and upgrade pip
# RUN rm -rf /var/lib/apt/lists/*
# RUN apt-get update && \
#     apt-get install -y build-essential && \
#     apt-get install -y software-properties-common \
#     build-essential \
#     git \
#     wget \
#     vim \
#     curl \
#     zip \
#     zlib1g-dev \
#     unzip \
#     pkg-config \
#     libgl-dev \
#     libblas-dev \
#     liblapack-dev \
#     python3-tk \
#     python3-wheel \
#     python3-pip \
#     graphviz \
#     libhdf5-dev \
#     swig \
#     apt-transport-https \
#     lsb-release \
#     ca-certificates &&\
#     apt-get clean &&\
#     # best practice to keep the Docker image lean
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# # Install PyTorch
# RUN echo $TORCH_VER
# RUN pip3 --no-cache-dir install torch==$TORCH_VER torchvision==$TORCHVISION_VER torchaudio==$TORCHAUDIO_VER $([ -z "$PYTORCH_EXTRA_IDX_URL" ] && echo "" || echo "--extra-index-url $PYTORCH_EXTRA_IDX_URL")

WORKDIR /src