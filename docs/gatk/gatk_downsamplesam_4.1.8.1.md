# ApplyBQSR v4.1.8.1

## Version of tools in [docker image ](https://hub.docker.com/r/broadinstitute/gatk)

| Tool | Version | Location |
| :--- | :--- | :--- |
| GATK | 4.1.8.1 | [https://github.com/broadinstitute/gatk/releases/tag/4.1.8.1](https://github.com/broadinstitute/gatk/releases/tag/4.1.8.1) |

[![](https://img.shields.io/badge/version-4.1.8.1-blue)](https://github.com/broadinstitute/gatk/releases/tag/4.1.8.1)

## CWL

* CWL specification 1.0
* Use example\_inputs.yml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_downsamplesam_4.1.8.1.cwl example_inputs.yml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict gatk_downsamplesam_4.1.8.1.cwl inputs.yaml

#Using toil-cwl-runner
> mkdir run_directory
> toil-cwl-runner --singularity --logFile path/to/run_directory/cwltoil.log  --jobStore path/to/jobStore --batchSystem lsf --workDir /path/to/run_directory --outdir /path/to/run_directory --writeLogs /path/to/run_directory --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 gatk_downsamplesam_4.1.8.1.cwl inputs.yaml > file.stdout 2> file.stderr &
```

## Usage

\`\`\`bash

> toil-cwl-runner gatk_downsamplesam_4.1.8.1.cwl --help

usage: gatk_downsamplesam_4.1.8.1.cwl [-h] --input INPUT --reference REFERENCE
                                      [--output_file_name OUTPUT_FILE_NAME]
                                      [--output_file_name_metrics OUTPUT_FILE_NAME_METRICS]
                                      [--probability PROBABILITY]
                                      [--random_seed RANDOM_SEED]
                                      [--strategy STRATEGY]
                                      [--arguments_file ARGUMENTS_FILE]
                                      [--cloud-index-prefetch-buffer CLOUD_INDEX_PREFETCH_BUFFER]
                                      [--cloud_prefetch_buffer CLOUD_PREFETCH_BUFFER]
                                      [--create_output_bam_index]
                                      [--create_output_bam_md5]
                                      [--disable_bam_index_caching]
                                      [--disable_read_filter DISABLE_READ_FILTER]
                                      [--disable_sequence_dictionary_validation]
                                      [--exclude_intervals EXCLUDE_INTERVALS]
                                      [--gatk_config_file GATK_CONFIG_FILE]
                                      [--gcs_max_retries GCS_MAX_RETRIES]
                                      [--gcs_project_for_requester_pays GCS_PROJECT_FOR_REQUESTER_PAYS]
                                      [--QUIET] [--read_filter READ_FILTER]
                                      [--read_index READ_INDEX]
                                      [--seconds_between_progress_updates SECONDS_BETWEEN_PROGRESS_UPDATES]
                                      [--lenient]
                                      [--number_of_threads NUMBER_OF_THREADS]
                                      [--memory_per_job MEMORY_PER_JOB]
                                      [--memory_overhead MEMORY_OVERHEAD]
                                      [--temporary_directory TEMPORARY_DIRECTORY]
                                      [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --input INPUT         BAM/SAM file containing reads
  --reference REFERENCE
                        Reference sequence file
  --output_file_name OUTPUT_FILE_NAME
                        Output file name. Not Required
  --output_file_name_metrics OUTPUT_FILE_NAME_METRICS
                        Output file name for metrics file. Not Required
  --probability PROBABILITY
                        The probability of keeping any individual read,
                        between 0 and 1.
  --random_seed RANDOM_SEED
                        Random seed used for deterministic results. Setting to
                        null will cause multiple invocations to produce
                        different results.
  --strategy STRATEGY   The --STRATEGY argument is an enumerated type
                        (Strategy), which can have one of the following
                        values: HighAccuracy ConstantMemory Chained default
                        Strategy ConstantMemory
  --arguments_file ARGUMENTS_FILE
  --cloud-index-prefetch-buffer CLOUD_INDEX_PREFETCH_BUFFER
  --cloud_prefetch_buffer CLOUD_PREFETCH_BUFFER
  --create_output_bam_index
  --create_output_bam_md5
  --disable_bam_index_caching
  --disable_read_filter DISABLE_READ_FILTER
                        Read filters to be disabled before analysis
  --disable_sequence_dictionary_validation
  --exclude_intervals EXCLUDE_INTERVALS
  --gatk_config_file GATK_CONFIG_FILE
  --gcs_max_retries GCS_MAX_RETRIES
  --gcs_project_for_requester_pays GCS_PROJECT_FOR_REQUESTER_PAYS
  --QUIET
  --read_filter READ_FILTER
  --read_index READ_INDEX
  --seconds_between_progress_updates SECONDS_BETWEEN_PROGRESS_UPDATES
  --lenient
  --number_of_threads NUMBER_OF_THREADS
  --memory_per_job MEMORY_PER_JOB
  --memory_overhead MEMORY_OVERHEAD
  --temporary_directory TEMPORARY_DIRECTORY
                        Default value: null.


