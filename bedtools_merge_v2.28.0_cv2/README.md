# CWL and Dockerfile for running Bedtools Merge

## Version of tools in [docker image ](https://hub.docker.com/r/biocontainers/bedtools)

| Tool	| Version	| Location	|
|---	|---	|---	|
| Bedtools  	| v2.28.0_cv2   	|  https://github.com/arq5x/bedtools2/releases/tag/v2.28.0	|

[![](https://img.shields.io/badge/version-2.28.0_cv2-blue)](https://github.com/arq5x/bedtools2/releases/tag/v2.28.0)
## CWL

- CWL specification 1.0
- Use example_inputs.yml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner bedtools_merge_v2.28.0_cv2.cwl example_inputs.yml
```

**If at MSK, using the JUNO cluster having installed toil version 3.19 and manually modifying [lsf.py](https://github.com/DataBiosphere/toil/blob/releases/3.19.0/src/toil/batchSystems/lsf.py#L170) by removing `type==X86_64 &&` you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict bedtools_merge_v2.28.0_cv2.cwl inputs.yaml

#Using toil-cwl-runner
> mkdir run_directory
> toil-cwl-runner --singularity --logFile path/to/run_directory/cwltoil.log  --jobStore path/to/jobStore --batchSystem lsf --workDir /path/to/run_directory --outdir /path/to/run_directory --writeLogs /path/to/run_directory --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 bedtools_merge_v2.28.0_cv2.cwl inputs.yaml > file.stdout 2> file.stderr &
```

## Usage

```bash
> toil-cwl-runner bedtools_merge_v2.28.0_cv2.cwl --help

usage: bedtools_merge_v2.28.0_cv2.cwl [-h] --input INPUT --output_file_name
                                      OUTPUT_FILE_NAME
                                      [--memory_overhead MEMORY_OVERHEAD]
                                      [--memory_per_job MEMORY_PER_JOB]
                                      [--number_of_threads NUMBER_OF_THREADS]
                                      [--distance_between_features DISTANCE_BETWEEN_FEATURES]
                                      [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --input INPUT         BEDgraph format file generated from Bedtools Genomecov
                        module
  --output_file_name OUTPUT_FILE_NAME
  --memory_overhead MEMORY_OVERHEAD
  --memory_per_job MEMORY_PER_JOB
  --number_of_threads NUMBER_OF_THREADS
  --distance_between_features DISTANCE_BETWEEN_FEATURES
                        Maximum distance between features allowed for features
                        to be merged.