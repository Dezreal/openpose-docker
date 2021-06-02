FROM openpose-prerequisites:latest

ADD ./openpose-1.7.0/ ./openpose/
ADD ./opencv-3.4.14/ ./opencv-3.4.14/
ADD ./cmake-3.20.2-linux-x86_64/ .

# enable cmake
ENV PATH="/cmake-3.20.2-linux-x86_64/bin:${PATH}"

# build opencv3 from static source
WORKDIR /opencv-3.4.14/build
RUN cmake ..
RUN make -j `nproc`
RUN make install

# build openpose v1.7.0 from source with CUDA 10.0
WORKDIR /openpose/build
RUN cmake -DBUILD_PYTHON=ON -DCUDA_ARCH=Manual -DCUDA_ARCH_BIN=75 ..
RUN make -j `nproc`
