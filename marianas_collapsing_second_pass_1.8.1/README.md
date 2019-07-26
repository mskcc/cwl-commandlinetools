# CWL and Dockerfile for running Marianas - DuplexUMIToCollapsedFastqSecondPass

## Version of tools in docker image (/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| java base image  	| 8 	|   -	|
| Marianas  	| 1.8.1  	|  https://github.com/juberpatel/Marianas/releases/download/v1.8.1/Marianas-1.8.1.jar	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner marianas_first_pass.cwl test_inputs_second_pass.yaml
```