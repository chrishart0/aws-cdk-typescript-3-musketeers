# 3 Musketeers AWS CDK
This is an example of containerized AWS CDK which you may use in any of your projects. 

[3 Musketeers for an epic Developer Experience](https://www.drewkhoury.com/post/gsd/3-musketeers-for-an-epic-developer-experience-8676ddaf33b2/)
[What is 3 musketeers?](https://3musketeers.io/docs/docker.html)

## Getting started
The contents of the `infrastructure` directory is the output of running cdk `init sample-app --language typescript`

To use this repo either start from there or replace the `infrastructure` directory with your existing typescript cdk project

## Use this in an existing project
If you have an existing project and would like to use this 3 musketeers setup follow these steps

1) Copy the `Makefile`, `Dockerfile`, and `docker-compose.yaml` files into the root of your project
2) Update the `CDK_PATH` variable in `three_musketeers.env` and `Makefile`
2) `make pre-reqs`
4) `make synth`

# Troubleshooting

```
Error: EACCES: permission denied, open 'cdk.out/tree.json'
```
This error is caused by permissions on the cdk.out directory. Ensure your user owns this, not root. To resolve run `make pre-reqs`

# ToDo:
* Detailed how to use guide with gifs/screenshots in README
* Handle different aws profiles
* Handle a new project init
* Find a way not to have to use force on destroy and deploy

# Note:
This repo was put together as part of the [Signet Seal](signetseal.com) project