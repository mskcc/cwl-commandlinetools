# v0.1.7

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| miniconda | 3 | [https://hub.docker.com/r/continuumio/miniconda3](https://hub.docker.com/r/continuumio/miniconda3) |
| merge\_fastq | 0.1.7 | [https://pypi.org/project/merge-fastq/](https://pypi.org/project/merge-fastq/) |

[![](https://images.microbadger.com/badges/version/mskaccess/merge_fastq:0.6.1.svg)](https://microbadger.com/images/mskaccess/merge_fastq:0.6.1) [![](https://images.microbadger.com/badges/image/mskaccess/merge_fastq:0.6.1.svg)](https://microbadger.com/images/mskaccess/merge_fastq:0.6.1) [![](https://images.microbadger.com/badges/commit/mskaccess/merge_fastq:0.6.1.svg)](https://microbadger.com/images/mskaccess/merge_fastq:0.6.1) [![](https://images.microbadger.com/badges/license/mskaccess/merge_fastq:0.6.1.svg)](https://microbadger.com/images/mskaccess/merge_fastq:0.6.1)

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner merge_fastq_0.1.7.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/merge_fastq_0.1.7/merge_fastq_0.1.7.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir tool_toil_log
> toil-cwl-runner --singularity --logFile /path/to/tool_toil_log/cwltoil.log  --jobStore /path/to/tool_jobStore --batchSystem lsf --workDir /path/to/tool_toil_log --outdir . --writeLogs /path/to/tool_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/merge_fastq_0.1.7/merge_fastq_0.1.7.cwl /path/to/inputs.yaml > tool_toil.stdout 2> tool_toil.stderr &
```

### Usage

```bash
> toil-cwl-runner merge_fastq_0.1.7.cwl --help
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
  --fastq1 FASTQ1       Full path to gziped READ1 fastq files, can be
                        specified multiple times for example: --fastq1
                        test_part1_R1.fastq.gz --fastq1 test_part2_R1.fastq.gz
                        [required]
  --fastq2 FASTQ2       Full path to gziped READ2 fastq files, can be
                        specified multiple times for example: --fastq1
                        test_part1_R2.fastq.gz --fastq1 test_part2_R2.fastq.gz
                        [required]
  --output_path OUTPUT_PATH
                        Full path to write the output files (default: Current
                        working directory)
  --out_fastq1_name OUT_FASTQ1_NAME
                        Name of the merged output READ1 fastq file(default:
                        merged_fastq_R1.fastq.gz)
  --out_fastq2_name OUT_FASTQ2_NAME
                        Name of the merged output READ2 fastq file(default:
                        merged_fastq_R2.fastq.gz)
```

