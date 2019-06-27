# CWL and Dockerfile for running Trim Galore

## Version of tools in docker image (/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| Ubuntu base image  	| 18.04  	|   -	|
| cutadapt  	| 2.3  	|  https://pypi.org/project/cutadapt/	|
| FASTQC  	| 0.11.8	|  https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip	|
| Trim Galore  	| 0.6.2	| https://github.com/FelixKrueger/TrimGalore/archive/0.6.2.tar.gz	|

## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner trim_galore_0.6.2.cwl example_inputs.yaml
```
  