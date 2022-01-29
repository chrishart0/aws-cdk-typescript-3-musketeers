# 3 Musketeers AWS CDK
This is an example of containerized AWS CDK which you may use in any of your projects. 

[3 Musketeers for an epic Developer Experience](https://www.drewkhoury.com/post/gsd/3-musketeers-for-an-epic-developer-experience-8676ddaf33b2/)

[What is 3 musketeers?](https://3musketeers.io/docs/docker.html)

[What is AWS CDK](https://aws.amazon.com/cdk/)

## Getting started
The contents of the `infrastructure` directory is the output of running cdk `init sample-app --language typescript`

To use this repo either start from there or replace the `infrastructure` directory with your existing typescript cdk project

## Use this as a starting point

1) Simply run `make`, this will do all the setup and run `cdk synth` 
```
$ make
```

2) If you have never used aws CDK in your configured AWS account before then you must use the cdk bootstraper
```
$ make bootstrap
```

3) You are now free to run any other commands available such as `cdk diff`, `cdk deploy`, and `cdk destroy`

![Gif demo](./Demo-of-setup-and-diff.gif)

## Use this in an existing project
If you have an existing project and would like to use this 3 musketeers setup follow these steps

1) Copy the `Makefile`, `Dockerfile`, and `docker-compose.yaml` files into the root of your project
2) Update the `CDK_PATH` variable in `three_musketeers.env` and `Makefile`
3) run `make` to do initial setup and output cdk synth to verify everything is configured right


# Commands

## Helper commands
Run the needed setup steps to allow working with CDK
```
$ make pre-reqs
```

Spits out some useful troubleshooting info: see [containerInfo.sh](containerInfo.sh)
```
$ make container-info
```

Deletes contents of cdk.out and node_modules
```
$ make clear-cache
```

Simply run `npm install` from inside of the container
```
$ make npm-install
```

Builds the container image
```
$ make container-build
```

This resolves Error: EACCES: permission denied, open 'cdk.out/tree.json', must be run before any cdk commands are run
```
$ make_prep-cache
```

## CDK Commands
The following commands directly correspond to CDK CLI commands, it is an action item to implement all CDK commands


```
$ make bootstrap
```

See the CloudFromation output
```
$ make synth
```

Output the difference between what is currently deployed to AWS and what is written in your CDK stack/s
```
$ make diff
```

```
$ make deploy
```

```
$ make destroy
```

# Troubleshooting

```
Error: EACCES: permission denied, open 'cdk.out/tree.json'
```
This error is caused by permissions on the cdk.out directory. Ensure your user owns this, not root. To resolve run `make pre-reqs`

# ToDo:
* Handle different aws profiles
* Handle a new project init
* Find a way not to have to use force on destroy and deploy

# Note:
This repo was put together as part of the [Signet Seal](https://signetseal.com) project
