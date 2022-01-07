SHELL=/bin/bash

# first target
all: synth

build:
	docker-compose build

synth: 
	docker-compose up synth

deploy: 
	docker-compose up deploy
