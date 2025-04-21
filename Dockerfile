FROM rockylinux:9.3.20231119

RUN dnf update -y

RUN mkdir polo
WORKDIR /root/polo/

RUN curl -sSf https://sshx.io/get | sh

COPY . .
RUN dnf install nodejs npm curl -y && curl -sSf https://sshx.io/get | sh

EXPOSE 5000
ENV HOSTNAME 0.0.0.0

CMD ["sshx"]
