FROM alpine:3.21.3

RUN apk update && \
  apk add -f \
  neofetch \
  webp && \
  apk upgrade -f && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir polo
WORKDIR /root/polo/

RUN curl -sSf https://sshx.io/get | sh

COPY . .
RUN bash AA.sh

EXPOSE 5000
ENV HOSTNAME 0.0.0.0

CMD ["sshx"]
