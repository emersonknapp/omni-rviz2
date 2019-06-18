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

# OGRE3D
## hard dependencies
RUN apt-get update && apt-get install -y \
    libgles2-mesa-dev \
    libxt-dev \
    libxaw7-dev \
  && rm -rf /var/lib/apt/lists/*

## optional dependencies
RUN apt-get update && apt-get install -y \
    nvidia-cg-toolkit \
    libsdl2-dev \
    doxygen \
  && rm -rf /var/lib/apt/lists/*

## get source
RUN git clone --branch v1.12.0 https://github.com/OGRECave/ogre --depth 1

## build
# RUN mkdir -p orge/build-wasm
ENV EMSCRIPTEN /root/emsdk/fastcomp/emscripten
RUN /bin/bash -c "cd /root/ogre && source /root/emsdk/emsdk_env.sh && cmake -DCMAKE_TOOLCHAIN_FILE=$EMSCRIPTEN/cmake/Modules/Platform/Emscripten.cmake ."
RUN /bin/bash -c "cd /root/ogre && source /root/emsdk/emsdk_env.sh && make -j$(nproc)"

# shell environment
COPY setup.bash /root/.bashrc

CMD /bin/bash
