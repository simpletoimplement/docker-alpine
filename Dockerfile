FROM    scratch as builder

ADD     rootfs.tar.gz /

ENV     container=docker

RUN     \
        set -eux \
&&      apk upgrade --no-cache --update --no-progress --available -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
&&      update-ca-certificates \
&&      rm -rf \
            /var/apk/* \
            /tmp/*

FROM    scratch

COPY    --from=builder / /

ENV     container=docker

SHELL   ["/bin/bash", "-o", "pipefail", "-c"]

CMD     ["/bin/bash"]

