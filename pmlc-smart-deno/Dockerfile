FROM quay.io/jitesoft/alpine:latest

ARG GIT_REVISION
ENV DENO_DEPLOYMENT_ID=${GIT_REVISION}

#RUN sed -i 's/ftp.halifax.rwth-aachen.de/mirrors.sjtug.sjtu.edu.cn/g' /etc/apk/repositories
RUN apk update && apk upgrade && apk add curl zstd deno icu-data-full && apk cache clean

# TODO
#WORKDIR /app

#COPY . .
#RUN deno cache main.ts && deno task build

#EXPOSE 8000

#CMD ["/usr/bin/deno", "run", "-A", "/app/main.ts"]
