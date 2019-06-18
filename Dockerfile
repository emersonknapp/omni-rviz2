FROM ubuntu:bionic

# install emscripten dependencies
RUN apt-get update && apt-get install -y \
    git \
    python2.7 \
    nodejs \
    cmake \
    default-jre \
  && rm -rf /var/lib/apt/lists/*
RUN ln -sfn /usr/bin/python2.7 /usr/bin/python

WORKDIR /root


# get and install emscripten
RUN git clone https://github.com/emscripten-core/emsdk.git
RUN ( cd emsdk && git pull && ./emsdk update-tags )
RUN ( cd emsdk && ./emsdk install latest && ./emsdk activate latest)

# install ogre dependencies
# RUN apt-get update && apt-get install -y \
    # libgles2-mesa-dev \
  # && rm -rf /var/lib/apt/lists/*

# shell environment
COPY setup.bash /root/.bashrc

CMD /bin/bash
