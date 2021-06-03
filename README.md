# OpenPose Docker

OpenPose Python API v1.7.0 with Cuda 10.0, built on [konyaka/openpose-prerequisites](https://hub.docker.com/r/konyaka/openpose-prerequisites).

------

GitHub: https://github.com/Dezreal/openpose-docker

DockerHub: https://hub.docker.com/r/konyaka/openpose

## Features

- **Local building.** The docker build context is self-contained and includes every component excluding [konyaka/openpose-prerequisites](https://hub.docker.com/r/konyaka/openpose-prerequisites). It means all of the building source is static so that incompatibility among versions of dependencies can be avoided. You only need to download the dockerfile and [konyaka/openpose-prerequisites](https://hub.docker.com/r/konyaka/openpose-prerequisites) from the Internet once and can build your docker image off-line.

- Contains Cuda 10.0 and CuDNN 7. Notice that you do not need to install Cuda Toolkit at your host system.

- OpenPose v1.7.0

- Python 3

## Getting Started

### Prerequisites

- [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker)
- (Only tested on) Ubuntu 20.04 with `x86_64` Architecture

### Building

#### Pull the build context

```bash
$ git clone https://github.com/Dezreal/openpose-docker.git
(optional) $ sudo docker pull konyaka/openpose-prerequisites
```

#### Build docker image

```bash
$ cd ./openpose-docker
$ sudo docker build -t openpose .
```

#### Create an run docker container

```bash
$ sudo docker run -it --gpus all openpose
```

#### Test Cuda and Python API

```bash
/openpose/build# nvidia-smi
/openpose/build# python3 demo.py
/openpose/build# exit
```

You will see

```bash
Thu Jun  3 02:43:49 2021       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 460.32.03    Driver Version: 460.32.03    CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  GeForce RTX 206...  Off  | 00000000:01:00.0  On |                  N/A |
| 46%   36C    P8    20W / 184W |    162MiB /  7973MiB |     15%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+


```

and

```bash
Starting OpenPose Python Wrapper...
Auto-detecting all available GPUs... Detected 1 GPU(s), using 1 of them starting at GPU 0.
[ WARN:0] OpenCV/MatExpr: processing of multi-channel arrays might be changed in the future: https://github.com/opencv/opencv/issues/16739
Body keypoints: 
[[[3.2809854e+02 2.1974371e+02 7.5993967e-01]
  [3.2289130e+02 2.1718504e+02 8.3385360e-01]
  [2.9802701e+02 2.2368245e+02 8.8920242e-01]
  [2.7715598e+02 2.5109933e+02 8.6595273e-01]
  [2.9809534e+02 2.7328116e+02 8.2083827e-01]
  [3.4900360e+02 2.1327135e+02 9.2912471e-01]
  [3.6726160e+02 2.3550529e+02 8.7097746e-01]
  [3.6850781e+02 2.6154324e+02 8.3065987e-01]
  [3.2806213e+02 2.8759146e+02 8.6716896e-01]
  [3.1245990e+02 2.8764346e+02 7.8310686e-01]
  [3.2936475e+02 3.3851541e+02 8.6039579e-01]
  [3.3854834e+02 3.9202173e+02 7.7205557e-01]
  [3.3985031e+02 2.8631238e+02 8.6554557e-01]
  [3.4376807e+02 3.3462039e+02 7.7605212e-01]
  [3.4638205e+02 3.7248010e+02 6.3853985e-01]
  [3.2416013e+02 2.1451590e+02 6.8749976e-01]
  [3.3074908e+02 2.1451418e+02 6.3172626e-01]
  [3.1632730e+02 2.0415282e+02 7.0270222e-01]
  [3.3860080e+02 2.0545940e+02 2.5160685e-01]
  [3.5936539e+02 3.8163797e+02 3.0262479e-01]
  [3.5938715e+02 3.8030585e+02 3.8734350e-01]
  [3.4764966e+02 3.7510175e+02 3.5746363e-01]
  [3.4114755e+02 4.1029895e+02 6.9135833e-01]
  [3.3590115e+02 4.0902325e+02 6.3767231e-01]
  [3.3981992e+02 3.9857721e+02 5.6923801e-01]]

 [[0.0000000e+00 0.0000000e+00 0.0000000e+00]
  [4.2074823e+02 3.0593616e+02 8.6281455e-01]
  [4.5077130e+02 3.0857712e+02 8.0427569e-01]

...

```

## 3rdparty

- [OpenPose v1.7.0](https://github.com/CMU-Perceptual-Computing-Lab/openpose)

- [OpenCV 3.14](https://github.com/opencv/opencv/releases/tag/3.4.14)

- [CMake](https://cmake.org/download/)

**Good luck to you!**

