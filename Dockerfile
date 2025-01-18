FROM registry.fedoraproject.org/fedora:latest

RUN useradd -m -G wheel -u 1001 user
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/user

USER user
WORKDIR /home/user
RUN whoami
RUN sudo whoami
