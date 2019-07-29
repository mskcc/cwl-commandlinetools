# CWL and Dockerfile for running Waltz - Count Reads

## Version of tools in docker image (/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| java base image  	| 8 	|   -	|
| waltz  	| 3.1.1  	|  https://github.com/juberpatel/Waltz/releases/download/v3.1.1/Waltz-3.1.1.jar	|

[![](https://img.shields.io/badge/version-3.1.1-blue)](https://github.com/juberpatel/Waltz/releases/tag/v3.1.1)
## CWL

- CWL specification 1.0
- Use example_inputs.yml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner waltz_count_reads_3.1.1.cwl example_inputs.yml
```

**If at MSK, using the JUNO cluster having installed toil version 3.19 and manually modifying [lsf.py](https://github.com/DataBiosphere/toil/blob/releases/3.19.0/src/toil/batchSystems/lsf.py#L170) by removing `type==X86_64 &&` you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict waltz_count_reads_3.1.1.cwl inputs.yaml

#Using toil-cwl-runner
> mkdir run_directory
> toil-cwl-runner --singularity --logFile path/to/run_directory/cwltoil.log  --jobStore path/to/jobStore --batchSystem lsf --workDir /path/to/run_directory --outdir /path/to/run_directory --writeLogs /path/to/run_directory --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 waltz_count_reads_3.1.1.cwl inputs.yaml > file.stdout 2> file.stderr &
```

## Usage

```bash
> toil-cwl-runner waltz_count_reads_3.1.1.cwl --help

usage: waltz_count_reads_3.1.1.cwl [-h] --bam BAM --gene_list GENE_LIST
                                   [--coverage_threshold COVERAGE_THRESHOLD]
                                   [--memory_per_job MEMORY_PER_JOB]
                                   [--memory_overhead MEMORY_OVERHEAD]
                                   [--number_of_threads NUMBER_OF_THREADS]
                                   --bed_file BED_FILE
                                   [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --bam BAM
  --gene_list GENE_LIST
  --coverage_threshold COVERAGE_THRESHOLD
  --memory_per_job MEMORY_PER_JOB
  --memory_overhead MEMORY_OVERHEAD
  --number_of_threads NUMBER_OF_THREADS
  --bed_file BED_FILE
```
