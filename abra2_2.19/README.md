# CWL and Dockerfile for running ABRA2

## Version of tools in docker image (/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| Ubuntu base image  	| 18.04  	|   -	|
| openjdk  	| 8  	|  https://pypi.org/project/cutadapt/	|
| ABRA2  	| 2.19	|  https://github.com/mozack/abra2/releases/download/v2.19/abra2-2.19.jar	|

## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner abra2_2.19.cwl example_inputs.yaml
```
  