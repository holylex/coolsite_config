FROM ubuntu:14.04.1
MAINTAINER Wille Faler "holylex@gmail.com"
RUN apt-get update
RUN apt-get install -y software-properties-common


RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible
ADD hosts /etc/ansible/hosts
ADD local.yml local.yml
RUN ansible-playbook local.yml -c local
EXPOSE 80