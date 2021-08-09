FROM zabbix/zabbix-agent2:alpine-5.2-latest

USER root

RUN set -eux && \
    apk add --no-cache --virtual build-dependencies \
            autoconf \
            automake \
            go \
            g++ \
            make \
            git \
            pcre-dev \
            openssl-dev \
            pacman \
            fakeroot \
            zlib-dev && \
    apk add --update curl && \
    mkdir /sentry && \
    cd /sentry/ && \
    git clone https://github.com/zarplata/zabbix-agent-extension-sentry.git && \
    chown -R zabbix:zabbix /sentry && \
    chmod -R 770 /sentry && \
    cd /sentry/zabbix-agent-extension-sentry/ && \
    sed -i 's/zabbix_agentd.conf.d/zabbix_agentd.d/' /sentry/zabbix-agent-extension-sentry/Makefile && \
    make && \
    make install && \
    cp /sentry/zabbix-agent-extension-sentry/zabbix-3.4_templates.xml /etc/zabbix/ && \
    rm -rf /sentry && \
    apk del --purge --no-network \
            build-dependencies && \
    rm -rf /var/cache/apk/*

USER zabbix
