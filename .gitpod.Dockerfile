FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget bzip2 ca-certificates

RUN wget -qO /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget bzip2 ca-certificates git

RUN wget -qO /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN /bin/bash -c "source activate base && \
    conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda install -y mamba && \
    mamba create -y -n snakemake snakemake"

CMD ["bash"]


CMD ["bash"]






