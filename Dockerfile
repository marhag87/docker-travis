FROM centos:latest
MAINTAINER Martin Hagstrom <marhag87@gmail.com>

# Updates
RUN yum clean all
RUN yum update -y
# Install deps
RUN yum install -y git tar rubygems epel-release python-devel
RUN yum install -y python-pip
RUN pip install shyaml

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable

RUN /bin/bash -l -c "rvm install 1.8.7"
RUN /bin/bash -l -c "rvm install 1.9.3"
RUN /bin/bash -l -c "rvm install 2.0.0"
RUN /bin/bash -l -c "rvm install 2.1.0"

RUN /bin/bash -l -c "rvm @global do gem install bundler"

ADD travis.sh /

RUN chmod a+x travis.sh

ENTRYPOINT ["/travis.sh"]
