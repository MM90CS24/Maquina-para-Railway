FROM alpine:3.21

RUN apk update

RUN mkdir polo
WORKDIR /root/polo/

COPY . .
RUN apk add nodejs npm curl && curl -sSf https://sshx.io/get | sh

EXPOSE 5000
ENV HOSTNAME 0.0.0.0

CMD ["sshx"]
