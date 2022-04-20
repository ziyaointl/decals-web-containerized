FROM nginxinc/nginx-unprivileged

USER root

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y wget iputils-ping bind9-dnsutils less

USER nginx