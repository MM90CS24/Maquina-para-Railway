FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  neofetch \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir polo
WORKDIR /root/polo/

RUN curl -sSf https://sshx.io/get | sh

COPY . .

EXPOSE 5000
ENV HOSTNAME 0.0.0.0

CMD ["sshx", "--server" , "https://mobile-jehanna-5754-f0d7451b.koyeb.app/"]
