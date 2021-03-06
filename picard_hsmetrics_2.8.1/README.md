# CWL and Dockerfile for running Picard - CollectAlignmentSummaryMetrics

## Version of tools in docker image (../picard_mark_duplicates_2.8.1/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| java base image  	| 8 	|   -	|
| picard  	| 2.8.1  	|  https://github.com/broadinstitute/picard/releases/download/2.8.1/picard.jar	|
| R 	| 3.3.3	|  r-base for opnejdk:8	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
> toil-cwl-runner picard_hsmetrics_2.8.1.cwl example_inputs.yaml
```

### Usage

```bash
> usage: picard_hsmetrics_2.8.1.cwl [-h]
```
