FROM    scratch as builder

ADD     rootfs.tar.gz /

ENV     container=docker

RUN     \
        set -eux \
&&      apk upgrade --no-cache --update --no-progress --available -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
&&      curl -L https://github.com/NobodyXu/su-exec/releases/download/v0.3.1/su-exec-musl -o /sbin/su-exec \
&&      chmod +x /sbin/su-exec \
&&      update-ca-certificates \
&&      echo 'alias ll="ls -lah"' >> /root/.bashrc \
&&      echo 'alias vim="vi"' >> /root/.bashrc \
&&      rm -rf \
            /var/apk/* \
            /tmp/*

FROM    scratch

COPY    --from=builder / /

ENV     container=docker

SHELL   ["/bin/bash", "-o", "pipefail", "-c"]

CMD     ["/bin/bash"]

