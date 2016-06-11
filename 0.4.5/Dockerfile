FROM alpine:3.4

ENV DCOS_CLI_VERSION 0.4.5

RUN apk update && \
    apk add python wget openssh-client && \
    wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate -O get-pip.py && \
    python get-pip.py && \
    rm -rf get-pip.py /var/cache/apk/* && \
    pip install "dcoscli==$DCOS_CLI_VERSION"

ADD dcos-cli.sh /usr/bin/dcos-cli

ENTRYPOINT ["dcos-cli"]
 