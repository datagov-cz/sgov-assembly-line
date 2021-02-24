# adopted from https://raw.githubusercontent.com/Ontotext-AD/graphdb-docker/master/free-edition/Dockerfile

FROM adoptopenjdk/openjdk11:alpine

# Build time arguments
ARG version=9.5.1
ARG edition=free

ENV GRAPHDB_VOLUME=/graphdb
ENV GRAPHDB_HOME=${GRAPHDB_VOLUME}/home

ENV GRAPHDB_INSTALL_DIR=${GRAPHDB_VOLUME}/dist

ADD graphdb-${edition}-${version}-dist.zip /tmp

RUN apk add --no-cache bash util-linux procps net-tools busybox-extras wget less curl && \
    mkdir -p ${GRAPHDB_VOLUME} && \
    cd ${GRAPHDB_VOLUME} && \
    unzip -qq /tmp/graphdb-${edition}-${version}-dist.zip && \
    rm /tmp/graphdb-${edition}-${version}-dist.zip && \
    mv graphdb-${edition}-${version} dist && \
    mkdir -p ${GRAPHDB_HOME}

ADD rulesets /rulesets

ADD init /root/graphdb-import

ENV PATH=${GRAPHDB_INSTALL_DIR}/bin:$PATH

RUN rm -rf ${GRAPHDB_HOME}/data

COPY ./data ${GRAPHDB_HOME}/data
COPY ./conf ${GRAPHDB_HOME}/conf

CMD ["-Dgraphdb.home=/graphdb/home","-Dgraphdb.logback=conf/logback.xml"]

ENTRYPOINT ["/graphdb/dist/bin/graphdb"]
VOLUME ["/graphdb/home"]

EXPOSE 7200
