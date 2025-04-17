FROM debian:latest

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  openssh \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir polo
WORKDIR /root/polo/

RUN curl -sSf https://sshx.io/get | sh

COPY . .
RUN bash AA.sh

EXPOSE 5000
ENV HOSTNAME 0.0.0.0

CMD ["sshx"]
