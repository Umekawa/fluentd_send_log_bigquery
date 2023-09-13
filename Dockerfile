FROM fluent/fluentd:v1.16-1
USER root
RUN apk --no-cache --update add gcc ruby-dev make ruby-bigdecimal libc-dev
RUN gem install fluent-plugin-bigquery
RUN gem install fluent-plugin-record-modifier
