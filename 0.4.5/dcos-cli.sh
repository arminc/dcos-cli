#!/bin/sh

mkdir -p /.dcos

export DCOS_CONFIG=/.dcos/dcos.toml

if [ -n "$PEM_FILE" ]
then
	cp $PEM_FILE /aws.pem
  chmod 600 /aws.pem
  eval `ssh-agent -s`
	ssh-add /aws.pem
fi  

cat <<EOF > /.dcos/dcos.toml
[core]
ssl_verify = "false"
dcos_acs_token = "${TOKEN}"
timeout = 5
dcos_url = "${URL}"
reporting = true
EOF

dcos "$@"
