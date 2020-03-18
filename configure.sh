
#!/bin/sh
#
# configure OpenCV with Python/numpy support in an Arm64 chroot on an Intel host.
#
cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D BUILD_PYTHON3=ON \
  -D BUILD_OPENCV_PYTHON2=OFF \
  -D OPENCV_EXTRA_MODULES_PATH=/home/woong/opencv/opencv_contrib-3.4.0/modules \
  -D WITH_NEON=ON \
  -D BUILD_JAVA=OFF \
  -D WITH_LAPACK=OFF \
  -D BUILD_TESTS=OFF  \
  -D BUILD_PERF_TESTS=OFF   \
  -D BUILD_EXAMPLES=ON \
  -D INSTALL_PYTHON_EXAMPLES=ON \
  -D WITH_CAROTENE=OFF \
  -D WITH_TBB=OFF \
  -D WITH_OPENCL=OFF \
  -D WITH_NVCUVID=OFF \
  -D WITH_OPENCL_SVM=OFF \
  -D WITH_OPENCLAMDFFT=OFF \
  -D WITH_OPENCLAMDBLAS=OFF \
  -D WITH_OPENEXR=OFF \
  -D WITH_MATLAB=OFF \
  -D WITH_GTK=OFF \
  -D WITH_GSTREAMER=OFF \
  -D WITH_GPHOTO2=OFF \
  -D WITH_FFMPEG=OFF \
  -D WITH_CUBLAS=OFF \
  -D WITH_CUDA=OFF \
  -D WITH_CUFFT=OFF \
  -D WITH_EIGEN=OFF \
  -D WITH_VTK=OFF \
  -D WITH_JASPER=OFF \
  -D WITH_WEBP=OFF \
  -D WITH_1394=OFF \
  -D BUILD_SHARED_LIBS=ON \
  -DCMAKE_INSTALL_PREFIX=/usr/local \
  -D PYTHON3_LIBRARIES=/usr/aarch64-linux-gnu/lib/libpython3.5m.so \
  -D PYTHON3_LIBRARY=/usr/aarch64-linux-gnu/lib/libpython3.5m.so \
  -D PYTHON_INCLUDE_DIRS=/usr/aarch64-linux-gnu/include/python3.5m \
  -D PYTHON3_INCLUDE_PATH=/usr/aarch64-linux-gnu/include/python3.5m \
  -D PYTHON3_INCLUDE_DIR=/usr/aarch64-linux-gnu/include/python3.5m \
  -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/python3/dist-packages/numpy/core/include \
  -D PYTHON3_NUMPY_VERSION="1.15.0" \
  -DPYTHON_DEFAULT_EXECUTABLE=$(which python3) \
  -D CMAKE_TOOLCHAIN_FILE=../aarch64-gnu.toolchain.cmake \
  ../../../../opencv-3.4.0 2>&1 | tee config.log
