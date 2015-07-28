FROM daocloud.io/golang:1.3-onbuild

MAINTAINER yj "g@yj.com"


WORKDIR /goapp

ADD . /goapp


RUN wget https://bootstrap.pypa.io/ez_setup.py
RUN python ez_setup.py

RUN git clone https://github.com/neoduan/yj.git
RUN git clone https://github.com/zopefoundation/zdaemon

WORKDIR /goapp/zdaemon

RUN cd /goapp/zdaemon
RUN pwd
RUN python setup.py build
RUN python setup.py install

WORKDIR /goapp/yj/backend
RUN pwd
ENTRYPOINT ["/bin/bash","/goapp/yj/backend/build_docker.sh", "start"]

EXPOSE 80
