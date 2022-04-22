FROM veupathdb/rserve:latest

MAINTAINER John Brestelli <jbrestel@upenn.edu>


RUN apt-get update \
    && apt -y install ant \
    && apt -y install git \
    && apt -y install wget \
    && apt -y install unzip \
    && apt -y install libaio1 \
    && apt -y install openjdk-8-jdk

WORKDIR /gusApp
WORKDIR /gusApp/gus_home
WORKDIR /gusApp/project_home

ENV GUS_HOME=/gusApp/gus_home
ENV PROJECT_HOME=/gusApp/project_home
ENV PATH=$PROJECT_HOME/install/bin:$PATH
ENV PATH=$GUS_HOME/bin:$PATH

RUN git clone https://github.com/VEuPathDB/install.git && cd install && git checkout 05197ebc4eb2046cc16e632b0b5852f21727a209
RUN mkdir -p $GUS_HOME/config && cp $PROJECT_HOME/install/gus.config.sample $GUS_HOME/config/gus.config

RUN git clone https://github.com/VEuPathDB/CBIL.git && cd CBIL && git checkout 5cfaec3407ad4fd7ab55346678bd910ece5e46a7 && bld CBIL

RUN git clone https://github.com/VEuPathDB/GusAppFramework.git && mv GusAppFramework GUS && cd GUS && git checkout 406b459d82449e3881da9d46426de8a71baeeb9c && bld GUS/PluginMgr && bld GUS/Supported

#RUN git clone https://github.com/VEuPathDB/GusSchema.git && cd GusSchema && git checkout eda5972c19f8ddd0bc018f8a4b6c5a2854d8761f

COPY ./lib/perl $GUS_HOME/lib/perl/

RUN cp $PROJECT_HOME/GUS/Model/lib/perl/GusRow.pm $GUS_HOME/lib/perl/GUS/Model/GusRow.pm

WORKDIR /opt/oracle

RUN wget https://download.oracle.com/otn_software/linux/instantclient/216000/instantclient-basic-linux.x64-21.6.0.0.0dbru.zip && unzip instantclient-basic-linux.x64-21.6.0.0.0dbru.zip
RUN wget https://download.oracle.com/otn_software/linux/instantclient/216000/instantclient-tools-linux.x64-21.6.0.0.0dbru.zip && unzip instantclient-tools-linux.x64-21.6.0.0.0dbru.zip
RUN wget https://download.oracle.com/otn_software/linux/instantclient/216000/instantclient-sqlplus-linux.x64-21.6.0.0.0dbru.zip && unzip instantclient-sqlplus-linux.x64-21.6.0.0.0dbru.zip

ENV ORACLE_HOME=/opt/oracle/instantclient_21_6
ENV LD_LIBRARY_PATH=$ORACLE_HOME
ENV PATH=/opt/oracle/instantclient_21_6:$PATH
