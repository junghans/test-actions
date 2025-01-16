ARG TAG=latest
FROM registry.fedoraproject.org/fedora:${TAG}


#RUN ( dnf -y update || dnf -y update ) && \
#    dnf -y install \
#      make cmake gcc-c++ && \
#    dnf clean all

RUN useradd -m -G wheel -u 1001 user
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user
WORKDIR /home/user

COPY . /home/user/code
RUN sudo chown -R user:user /home/user/code

RUN sudo echo Hello
RUN pwd
RUN uname -a
RUN ls -R

#RUN cmake -B builddir -S code && \
#    cmake --build builddir --verbose && \
#    cmake --build builddir --target test
