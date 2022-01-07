SHELL=/bin/bash

# first target
all: synth

build:
	docker-compose build

synth: 
	docker-compose up synth

bootstrap: 
	docker-compose up bootstrap

deploy: 
	docker-compose up deploy

destroy:
	docker-compose up destroy

diff:
	docker-compose up diff


