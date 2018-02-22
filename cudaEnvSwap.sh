
# !/bin/bash

CUDA_VERSION=$1

echo 1. delete current cuda symbol link...
sudo rm -rf /usr/local/cuda

echo 2. building new symbol link to cuda-${CUDA_VERSION}...
sudo ln -s /usr/local/cuda-${CUDA_VERSION} /usr/local/cuda

echo 3. reset system environment variables

source ~/.bashrc
sudo ldconfig

echo Successfully resetting CUDA version as ${CUDA_VERSION}.

