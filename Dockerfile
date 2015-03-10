FROM centos:centos6
MAINTAINER xcezx <main.xcezx@gmail.com>

ENV SOLR_VERSION 5.0.0
ENV TZ Asia/Tokyo
ENV JAVA_OPTION "-Dsolr.solr.home=/opt/solr $JAVA_OPTION"
ENV JETTY_HOME /opt/solr/example

WORKDIR /tmp/workdir

RUN yum -y install java-1.7.0-openjdk curl tar unzip && \
    yum -y clean all

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8983
CMD ["/usr/bin/java", "-jar", "/opt/solr/example/start.jar"]
