FROM centos:centos7

RUN ERSION=8u191 && \
    BUILD=b12 && \
    SIG=2787e4a523244c269598db4e85c51e0c && \
    yum -y update && \
    curl --silent --location --retry 3 \
    --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    https://download.oracle.com/otn-pub/java/jdk/"${VERSION}"+"${BUILD}"/"${SIG}"/jdk-"${VERSION}"-linux-x64.rpm \
    echo "fc6f805f93148cb396ca73989d7c9ea5  jdk-8u191-linux-x64.rpm" >> MD5SUM8 && \
    md5sum -c MD5SUM8 && \
    rpm -Uvh jdk-8u191-linux-x64.rpmm && \
    yum -y clean all && \
    rm -f jdk-8u191-linux-x64.rpm MD5SUM8
