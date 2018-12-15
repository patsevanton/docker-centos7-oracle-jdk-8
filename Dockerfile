FROM centos:centos7

RUN curl --silent --location --retry 3 \
    --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.rpm -o jdk-8u191-linux-x64.rpm && \
    echo "fc6f805f93148cb396ca73989d7c9ea5  jdk-8u191-linux-x64.rpm" >> MD5SUM8 && \
    md5sum -c MD5SUM8 && \
    rpm -Uvh jdk-8u191-linux-x64.rpm && \
    yum -y clean all && \
    rm -rf /var/cache/yum && \
    rm -f jdk-8u191-linux-x64.rpm MD5SUM8 && \
    cd /usr/local/bin && \
    wget http://www-us.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz && \
    tar -xf apache-maven-3.5.3-bin.tar.gz && \
    mv apache-maven-3.5.3 apache-maven && \
    echo "export M2_HOME=/usr/local/bin/apache-maven" > /etc/profile.d/maven.sh && \
    echo "export PATH=${M2_HOME}/bin:${PATH}" > /etc/profile.d/maven.sh && \
    chmod +x /etc/profile.d/maven.sh && \
    source /etc/profile.d/maven.sh
