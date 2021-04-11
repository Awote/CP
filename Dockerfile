FROM ubuntu
RUN apt update
RUN apt-get install -y gcc build-essential gcc-multilib
COPY asm.c ./
