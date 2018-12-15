FROM centos:centos7 as build
WORKDIR /root
COPY maven.spec maven.spec
RUN yum install -y rpm-build rpmdevtools tree
RUN mkdir -p ~/rpmbuild/{RPMS,SRPMS,BUILD,SOURCES,SPECS}
RUN spectool -g -R maven.spec
RUN tree
RUN rpmbuild maven.spec
RUN tree

#FROM centos:centos7 as production
#COPY --from=build /go/main .
#CMD ["./main"]
