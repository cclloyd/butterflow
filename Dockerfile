FROM        jrottenberg/ffmpeg:latest AS base

WORKDIR     /tmp/workdir

RUN     apt-get -yqq update && \
        apt-get install -yq --no-install-recommends unzip wget python-dev ocl-icd-opencl-dev libopencv-dev python-opencv python-setuptools gcc g++ && \
        apt-get autoremove -y && \
        apt-get clean -y

RUN     wget https://github.com/dthpham/butterflow/archive/master.zip && \
        unzip master.zip && \
        cd butterflow-master && \
        python setup.py install

RUN     apt-get remove -yq unzip wget gcc g++ && \
        apt-get autoremove -y && \
        apt-get clean -y


FROM        base AS release
#MAINTAINER  Julien Rottenberg <julien@rottenberg.info>

CMD         ["--help"]
ENTRYPOINT  ["butterflow"]