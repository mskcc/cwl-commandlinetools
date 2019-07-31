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

**If at MSK, using the JUNO cluster having installed toil version 3.19 and manually modifying [lsf.py](https://github.com/DataBiosphere/toil/blob/releases/3.19.0/src/toil/batchSystems/lsf.py#L170) by removing `type==X86_64 &&` you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/trim_galore_0.6.2.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir trimgalore_toil_log
> toil-cwl-runner --singularity --logFile /path/to/trimgalore_toil_log/cwltoil.log  --jobStore /path/to/trimgalore_jobStore --batchSystem lsf --workDir /path/to/trimgalore_toil_log --outdir . --writeLogs /path/to/trimgalore_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/trim_galore_0.6.2.cwl /path/to/inputs.yaml > trimgalore_toil.stdout 2> trimgalore_toil.stderr &
```

### Usage  