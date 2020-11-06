
FROM ubuntu:focal

ARG USER_NAME=ansible
ARG USER_UID=110
ARG USER_GID=110

# This is defined in the makefile
ARG ANSIBLE_VER=
ARG TF_VER=

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt update -y \
    && apt install -y python3 \
    curl \
    python3-pip \
    sshpass \
    git \
    libssl-dev \
    unzip \
    apt-utils \
    software-properties-common \
    sudo \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" \
    && apt install -y docker-ce-cli

# Install Docker CE CLI. 
#RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
#    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" \
#    && apt-get update \
#    && apt-get install -y docker-ce-cli

RUN pip3 install \
    setuptools \
    molecule \
    # Docker Support
    docker \
    # VMWare support
    PyVmomi \
    # Azure Support
    azure-mgmt-compute \
    azure-mgmt-storage \
    azure-mgmt-resource \
    azure-keyvault-secrets \
    azure-storage-blob \
    # AWS Support
    boto \
    boto3 \
    botocore 

RUN curl https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip > /tmp/terraform.zip && \
    unzip -q /tmp/terraform.zip -d /bin/ && \
    /bin/terraform --version


RUN pip3 install ansible==${ANSIBLE_VER}

VOLUME [ "/var/run/docker.sock", '/workspace/']

CMD [ "sleep", "infinity" ]
