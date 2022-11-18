FROM ghcr.io/votca/buildenv/fedora:latest

RUN pwd
RUN ls

USER root
RUN find / -name .git

WORKDIR /home/votca/votca
RUN cmake -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_BUILD_TYPE=Release \
  -B builddir
RUN cmake --build builddir --parallel 2
RUN cd builddir && ctest --output-on-failure -E regression_
RUN sudo cmake --install builddir
