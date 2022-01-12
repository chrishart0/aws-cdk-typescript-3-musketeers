SHELL=/bin/bash
CDK_DIR=infrastructure 

# first target
all: synth

pre-reqs: #This resolves Error: EACCES: permission denied, open 'cdk.out/tree.json'
	mkdir -p infrastructure/cdk.out/

build: pre-reqs
	docker-compose build

npm-install: pre-reqs
	docker-compose up npm-install

synth: pre-reqs
	docker-compose up synth

bootstrap: pre-reqs
	docker-compose up bootstrap

deploy: pre-reqs
	docker-compose up deploy

destroy:
	docker-compose up destroy

diff: pre-reqs
	docker-compose up diff


