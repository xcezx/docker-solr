#!/bin/bash
set -e

ln -sf /usr/share/zoneinfo/$TZ /etc/localtime

if [ ! -L "/opt/solr" ]; then
    curl --retry 3 http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz | tar -C /opt --extract --gzip
    cd /opt
    ln -s solr-$SOLR_VERSION solr
fi

exec "$@"
