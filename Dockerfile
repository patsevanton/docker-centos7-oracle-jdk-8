FROM centos:centos7

MAINTAINER Pluribus Labs Docker Dev <docker-dev@pluribuslabs.com>

RUN yum -y upgrade && \
    yum -y update && \
    yum -y install wget unzip findutils && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm && \
    echo "1ffe998845b594c66db2703dd5f60d88  jdk-8u102-linux-x64.rpm" >> MD5SUM8 && \
    md5sum -c MD5SUM8 && \
    rpm -Uvh jdk-8u102-linux-x64.rpm && \
    yum -y clean all && \
    rm -f jdk-8u102-linux-x64.rpm MD5SUM8
