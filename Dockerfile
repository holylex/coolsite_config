FROM ubuntu:14.04.01
MAINTAINER Alexandre Perez "holylex@gmail.com"

RUN apt-get update


RUN apt-get install -y software-properties-common
#RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible
RUN apt-get install -y git
RUN apt-get install -y curl
RUN curl -sSL https://github.com/holylex/coolsite_config/archive/master.tar.gz | tar -xzv
ADD hosts /etc/ansible/hosts2
RUN ansible-playbook local.yml -c local
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80

CMD ["nginx"]


