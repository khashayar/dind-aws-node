FROM docker:latest

ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

RUN apk add --no-cache --update python py-pip;
RUN pip install awscli

RUN apk add --update nodejs nodejs-npm
RUN apk add --update zip
RUN apk add --update curl
