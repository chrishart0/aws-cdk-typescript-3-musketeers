SHELL=/bin/bash
CDK_DIR=infrastructure/
COMPOSE_RUN = docker-compose run --rm cdk-base
COMPOSE_UP = docker-compose up

all: pre-reqs synth
pre-reqs: _prep-cache container-build npm-install container-info
	

_prep-cache: #This resolves Error: EACCES: permission denied, open 'cdk.out/tree.json'
	mkdir -p infrastructure/cdk.out/

container-build: pre-reqs
	docker-compose build

container-info:
	${COMPOSE_RUN} make _container-info

_container-info:
	./containerInfo.sh

clear-cache:
	${COMPOSE_RUN} rm -rf ${CDK_DIR}cdk.out && rm -rf ${CDK_DIR}node_modules

npm-install: _prep-cache
	${COMPOSE_RUN} make _npm-install

_npm-install:
	cd ${CDK_DIR} && npm install

synth: _prep-cache
	${COMPOSE_RUN} make _synth

_synth:
	cd ${CDK_DIR} && cdk synth --no-staging

bootstrap: _prep-cache
	${COMPOSE_RUN} make _bootstrap

_bootstrap:
	cd ${CDK_DIR} && cdk bootstrap

deploy: _prep-cache
	${COMPOSE_RUN} make _deploy

_deploy: 
	cd ${CDK_DIR} && cdk deploy --require-approval never

destroy:
	${COMPOSE_RUN} make _destroy

_destroy:
	cd ${CDK_DIR} && cdk destroy --force

diff: _prep-cache
	${COMPOSE_RUN} make _diff

_diff: _prep-cache
	cd ${CDK_DIR} && cdk diff
