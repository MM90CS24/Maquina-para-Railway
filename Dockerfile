FROM node:lts-buster

RUN git clone https://github.com/ekzhang/sshx
RUN cd sshx
RUN npm install
RUN npm run build

RUN mkdir polo
WORKDIR /root/sshx/polo/

COPY . .

EXPOSE 5000
ENV HOSTNAME 0.0.0.0

CMD ["npm", "run" , "preview"]
