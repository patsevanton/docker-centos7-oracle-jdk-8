FROM centos:centos7

MAINTAINER Pluribus Labs Docker Dev <docker-dev@pluribuslabs.com>

RUN yum -y update && \
    yum -y install wget && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm && \
    echo "6c9adca7ba0f89fe755653d2a62cdbd3  jdk-8u60-linux-x64.rpm" >> MD5SUM && \
    md5sum -c MD5SUM && \
    rpm -Uvh jdk-8u60-linux-x64.rpm && \
    rm -f jdk-8u60-linux-x64.rpm MD5SUM
