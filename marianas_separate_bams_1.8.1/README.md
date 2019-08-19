# CWL and Dockerfile for running Marianas - SeparateBams

## Version of tools in docker image (../marianas_process_loop_umi_1.8.1/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| java base image  	| 8 	|   -	|
| Marianas  	| 1.8.1  	|  https://github.com/juberpatel/Marianas/releases/download/v1.8.1/Marianas-1.8.1.jar	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner marianas_seprate_bams_1.8.1.cwl example_inputs.yaml
```

### Usage

```bash
usage: marianas_separate_bams_1.8.1/marianas_separate_bams_1.8.1.cwl
       [-h] --input_bam INPUT_BAM [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --input_bam INPUT_BAM
```
