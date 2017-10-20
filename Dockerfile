FROM amazonlinux

RUN yum install -y rpmbuild rpmdevtools shadow-utils util-linux
RUN useradd -m rpmbuilder
RUN su - rpmbuilder

USER rpmbuilder

WORKDIR /home/rpmbuilder
COPY .rpm* .
RUN mkdir -p rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
RUN mkdir src
