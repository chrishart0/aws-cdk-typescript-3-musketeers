# 3 Musketeers AWS CDK
This is an example of containerized AWS CDK which you may use in any of your projects. 

[What is 3 musketeers?](https://3musketeers.io/docs/docker.html)

## Getting started
The contents of the `infrastructure` directory is the output of running cdk `init sample-app --language typescript`

To use this repo either start from there or replace the `infrastructure` directory with your existing typescript cdk project


# Commands
`make build`

`make npm-install`

`make bootstrap`

`make synth`

`make synth`

`make deploy`

`make destroy`

`make diff`

## Use this in an existing project
If you have an existing project and would like to use this 3 musketeers setup follow these steps

1) Copy the `Makefile`, `entrypoint.sh`, `Dockerfile`, `three_musketeers.env`, and `docker-compose.yaml` files into the root of your project
2) Update the `CDK_PATH` variable in `three_musketeers.env` and `Makefile`
2) `make build`
3) `make npm-install`
4) `make synth`

# Troubleshooting

```
Error: EACCES: permission denied, open 'cdk.out/tree.json'
```
This error is caused by permissions on the cdk.out directory. Ensure your user owns this, not root. To resolve run `make pre-reqs`