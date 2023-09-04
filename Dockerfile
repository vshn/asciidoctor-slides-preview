FROM ghcr.io/vshn/asciidoctor-slides:1.17.0

RUN addgroup -S preview && adduser -S preview -G preview && \
    mkdir -p /presentation && chown -R preview:preview /presentation && \
    mkdir -p /build && chown -R preview:preview /build

WORKDIR /build

# The libnotify requirement courtesy of
# https://github.com/bebraven/platform/pull/82/files
# to fix file system notification issues when running this image in a Mac

RUN apk update && apk add curl unzip build-base ruby-dev ruby-rdoc libnotify && \
    gem install --no-document guard guard-livereload guard-shell libnotify && \
    apk del build-base ruby-dev && \
    curl --silent --location https://github.com/caddyserver/caddy/releases/download/v2.4.6/caddy_2.4.6_linux_amd64.tar.gz -o /build/caddy.tar.gz && \
    tar -zxvf /build/caddy.tar.gz && \
    mv /build/caddy /usr/local/bin/caddy && \
    rm /build/caddy.tar.gz

COPY slides-preview.sh /usr/local/bin/
COPY signal-listener.sh /usr/local/bin/

COPY Caddyfile /Caddyfile
COPY Guardfile /Guardfile

EXPOSE 2020
ENTRYPOINT ["signal-listener.sh"]
