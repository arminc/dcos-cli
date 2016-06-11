#DCOS cli

For more info about the DCOS cli https://dcos.io/docs/1.7/usage/cli/

##Building
docker build -t dcos-cli .

##Running
```bash
dcos() {
	docker run --rm -ti \
	-e PEM_FILE=/path/to/aws.pem \
	-e URL=http://DCOS-cluster-url.com/ \
	-e TOKEN=TOKEN \
	-v ${HOME}:${HOME} \
	-w ${PWD} \
	dcos-cli "$@"
}
```

- aws.pem file is the private key to access the cluster
- TOKEN is the token to authenticate to the cluster