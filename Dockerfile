FROM node:lts-buster

RUN apt update
RUN apt upgrade -y

RUN git clone https://github.com/ekzhang/sshx /root/sshx/
WORKDIR /root/sshx/

COPY . .

EXPOSE 5000
ENV HOSTNAME 0.0.0.0

CMD ["bash", "LA.sh"]
