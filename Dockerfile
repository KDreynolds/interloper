FROM ubuntu:latest


RUN apt-get update && \
    apt-get install -y build-essential make cmake git curl


RUN git clone https://github.com/leetal/ios-cmake.git /opt/ios-cmake

RUN mkdir -p /root/dev/3rdParty/ios-cmake-master && \
    cp /opt/ios-cmake/ios.toolchain.cmake /root/dev/3rdParty/ios-cmake-master/

ENV CMTOOLCHAIN=/root/dev/3rdParty/ios-cmake-master/ios.toolchain.cmake
ENV PREFIX=/root/build/iphoneos_arm64
ENV OS=OS64

COPY build-sqlite.sh /usr/local/bin/build-sqlite.sh
COPY build-proj.sh /usr/local/bin/build-proj.sh
COPY build-gdal.sh /usr/local/bin/build-gdal.sh
COPY build-libiconv.sh /usr/local/bin/build-libiconv.sh



RUN chmod +x /usr/local/bin/build-sqlite.sh
RUN chmod +x /usr/local/bin/build-proj.sh
RUN chmod +x /usr/local/bin/build-gdal.sh
RUN chmod +x /usr/local/bin/build-libiconv.sh




RUN /usr/local/bin/build-sqlite.sh && \
    /usr/local/bin/build-libiconv.sh && \
    /usr/local/bin/build-proj.sh


RUN /usr/local/bin/build-gdal.sh