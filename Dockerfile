# Template
# Contains pytorch, torchvision, cuda, cudnn
FROM nvcr.io/nvidia/pytorch:23.08-py3

# Mantainer
LABEL maintainer="Jaime Barranco @jaimebarran"

# Install nnUNet integrative framework (this will create a copy of the nnU-Net code on your computer so that you can modify it as needed)
RUN git clone https://github.com/MIC-DKFZ/nnUNet.git && \
    cd nnUNet && \
    pip install -e .

WORKDIR /workspace/nnUNet

# nnUNet environment variables
ARG resources="/opt/nnunet_resources"
ENV nnUNet_raw=$resources"/nnUNet_raw"
ENV nnUNet_preprocessed=$resources"/nnUNet_preprocessed"
ENV nnUNet_results=$resources"/nnUNet_results"

# Install hiddenlayer (hiddenlayer enables nnU-net to generate plots of the network topologies it generates)
RUN pip install --upgrade git+https://github.com/FabianIsensee/hiddenlayer.git

# Build image
# docker build --no-cache -t jaimebarran/nnunet:0.1.0 .
# docker build -t jaimebarran/nnunet:0.1.0 .

# Run container interactively (local image)
# docker run -it --rm docker.io/jaimebarran/nnunet:0.1.0 /bin/bash

# Push image
# docker push jaimebarran/nnunet:0.1.0
