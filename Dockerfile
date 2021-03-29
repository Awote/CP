FROM ubuntu
RUN apt-get -y update
RUN apt-get -y install gcc
RUN apt-get -y install gcc-multilib
RUN apt-get -y install nasm 

COPY c_for_2.c ./
COPY hello.asm ./

