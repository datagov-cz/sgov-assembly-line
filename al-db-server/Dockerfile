FROM openjdk:11

ARG GRAPHDB_ZIP

RUN \
    # Check for mandatory build arguments
    : "${GRAPHDB_ZIP:?Provide the downloaded GraphDB Free ZIP file}"

ENV GRAPHDB_VOLUME=/graphdb
ENV GRAPHDB_HOME=${GRAPHDB_VOLUME}/home
ENV GRAPHDB_INSTALL_DIR=${GRAPHDB_VOLUME}/dist
RUN mkdir -p $GRAPHDB_VOLUME $GRAPHDB_INSTALL_DIR $GRAPHDB_HOME

ADD $GRAPHDB_ZIP /tmp/$GRAPHDB_ZIP

WORKDIR /tmp
RUN unzip $GRAPHDB_ZIP
RUN export GRAPHDB_DIR=`ls -d graphdb*/` && mv $GRAPHDB_DIR/* $GRAPHDB_INSTALL_DIR

ENV PATH=${GRAPHDB_INSTALL_DIR}/bin:$PATH

ADD rulesets /rulesets

ADD init /root/graphdb-import

RUN rm -rf ${GRAPHDB_HOME}/data

COPY ./data ${GRAPHDB_HOME}/data
COPY ./conf ${GRAPHDB_HOME}/conf

RUN GDB_JAVA_OPTS='-Dgraphdb.home=/graphdb/home' /graphdb/dist/bin/loadrdf -m parallel -i assembly-line /root/graphdb-import/* -f -s

CMD ["-Dgraphdb.home=/graphdb/home","-Dgraphdb.logback=conf/logback.xml"]
ENTRYPOINT ["/graphdb/dist/bin/graphdb"]
EXPOSE 7200