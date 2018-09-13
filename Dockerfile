FROM fluent/fluentd:stable-onbuild

WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.4.0/bin:$PATH
ENV APK_ADD=".build-deps sudo build-base ruby-dev"
ENV APK_DEL=".build-deps sudo build-base ruby-dev"

ARG GEM_S3_VERSION="-v 1.1.4"
ARG GEM_S3_NAME="fluent-plugin-s3"
ARG GEM_ES_VERSION="-v 2.4.0"
ARG GEM_ES_NAME="fluent-plugin-elasticsearch"
RUN apk add --update --no-cache --virtual $APK_ADD && \
  sudo gem install "${GEM_S3_NAME}" ${GEM_S3_VERSION} && \
  sudo gem install "${GEM_ES_NAME}" ${GEM_ES_VERSION} && \
  sudo gem sources --clear-all && \
  apk del ${APK_DEL} && rm -rf /var/cache/apk/* \
    /home/fluent/.gem/ruby/2.4.0/cache/*.gem

RUN deluser --remove-home postmaster \
  && deluser --remove-home cyrus \
  && deluser --remove-home mail \
  && deluser --remove-home news \
  && deluser --remove-home uucp \
  && deluser --remove-home operator \
  && deluser --remove-home man \
  && deluser --remove-home cron \
  && deluser --remove-home ftp \
  && deluser --remove-home sshd \
  && deluser --remove-home at \
  && deluser --remove-home squid \
  && deluser --remove-home xfs \
  && deluser --remove-home games \
  && deluser --remove-home postgres \
  && deluser --remove-home vpopmail \
  && deluser --remove-home ntp \
  && deluser --remove-home smmsp \
  && deluser --remove-home guest

COPY ./scripts/version-info /usr/bin
EXPOSE 24224

ENTRYPOINT exec fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins
