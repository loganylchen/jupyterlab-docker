FROM continuumio/miniconda3
MAINTAINER Chen Yuelong <yuelong.chen.btr@gmail.com>

RUN apt update \
    && apt install -y build-essential gcc
RUN conda install -y  -c conda-forge nodejs jupyterlab julia \
    && conda install -y -c r r \
    && conda install -y -c conda-forge r-irkernel \
    && jupyter notebook --generate-config

WORKDIR /tmp
COPY installIJulia.jl jupyter_notebook_config.py ./
RUN julia installIJulia.jl && \
    cp jupyter_notebook_config.py /root/.jupyter/

RUN rm /tmp/*

WORKDIR /lab

CMD jupyter lab





