FROM ubuntu:16.04

ENV DCOS_CLI_VERSION 0.4.5

RUN apt-get update && \
    apt-get install -y python wget openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py && \
    python get-pip.py && \
    rm get-pip.py && \
    pip install --quiet "dcoscli==$DCOS_CLI_VERSION"

ADD dcos-cli.sh /usr/bin/dcos-cli

ENTRYPOINT ["dcos-cli"]
 