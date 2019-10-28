# CWL and Dockerfile for running merge_fastq

## Version of tools in docker image (/container/Dockerfile)

| Tool | Version | Location |
|--- |--- |--- |
| miniconda   | 3 | <https://hub.docker.com/r/continuumio/miniconda3> |
| merge_fastq   | 0.1.7   |  <https://pypi.org/project/merge-fastq/> |

[![](https://images.microbadger.com/badges/version/mskaccess/merge_fastq:0.6.1.svg)](https://microbadger.com/images/mskaccess/merge_fastq:0.6.1 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/mskaccess/merge_fastq:0.6.1.svg)](https://microbadger.com/images/mskaccess/merge_fastq:0.6.1 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/mskaccess/merge_fastq:0.6.1.svg)](https://microbadger.com/images/mskaccess/merge_fastq:0.6.1 "Get your own commit badge on microbadger.com") [![](https://images.microbadger.com/badges/license/mskaccess/merge_fastq:0.6.1.svg)](https://microbadger.com/images/mskaccess/merge_fastq:0.6.1 "Get your own license badge on microbadger.com")

## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner merge_fastq_0.1.7.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster having installed toil version 3.19 and manually modifying [lsf.py](https://github.com/DataBiosphere/toil/blob/releases/3.19.0/src/toil/batchSystems/lsf.py#L170) by removing `type==X86_64 &&` you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/merge_fastq_0\.1\.7/merge_fastq_0\.1\.7\.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir tool_toil_log
> toil-cwl-runner --singularity --logFile /path/to/tool_toil_log/cwltoil.log  --jobStore /path/to/tool_jobStore --batchSystem lsf --workDir /path/to/tool_toil_log --outdir . --writeLogs /path/to/tool_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/merge_fastq_0\.1\.7/merge_fastq_0\.1\.7\.cwl /path/to/inputs.yaml > tool_toil.stdout 2> tool_toil.stderr &
```

### Usage

```bash
> toil-cwl-runner merge_fastq_0\.1\.7\.cwl --help
usage: merge_fastq_0.1.7.cwl [-h]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  
```
