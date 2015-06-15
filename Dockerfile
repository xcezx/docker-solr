FROM centos:centos6
MAINTAINER xcezx <main.xcezx@gmail.com>

ENV TZ UTC
ENV SOLR_VERSION 5.2.0

RUN yum -y install java-1.7.0-openjdk curl tar unzip && \
    yum -y clean all

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8983
CMD ["/opt/solr/bin/solr", "-f"]
