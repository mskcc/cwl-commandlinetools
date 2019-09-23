# CWL and Dockerfile for running GATK4 - Apply BQSR

## Version of tools in [docker image ](https://hub.docker.com/r/broadinstitute/gatk)

| Tool	| Version	| Location	|
|---	|---	|---	|
| GATK  	| 4.1.2.0  	|  https://github.com/broadinstitute/gatk/releases/tag/4.1.2.0	|

[![](https://img.shields.io/badge/version-4.1.2.0-blue)](https://github.com/broadinstitute/gatk/releases/tag/4.1.2.0)
## CWL

- CWL specification 1.0
- Use example_inputs.yml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_ApplyBQSR_4.1.2.0.cwl example_inputs.yml
```

**If at MSK, using the JUNO cluster having installed toil version 3.19 and manually modifying [lsf.py](https://github.com/DataBiosphere/toil/blob/releases/3.19.0/src/toil/batchSystems/lsf.py#L170) by removing `type==X86_64 &&` you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict gatk_ApplyBQSR_4.1.2.0.cwl inputs.yaml

#Using toil-cwl-runner
> mkdir run_directory
> toil-cwl-runner --singularity --logFile path/to/run_directory/cwltoil.log  --jobStore path/to/jobStore --batchSystem lsf --workDir /path/to/run_directory --outdir /path/to/run_directory --writeLogs /path/to/run_directory --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 gatk_ApplyBQSR_4.1.2.0.cwl inputs.yaml > file.stdout 2> file.stderr &
```

## Usage

```bash
> toil-cwl-runner gatk_ApplyBQSR_4.1.2.0.cwl --help

usage: gatk_ApplyBQSR_4.1.2.0.cwl [-h] --reference REFERENCE
                                  [--create_output_bam_index]
                                  --bqsr_recal_file BQSR_RECAL_FILE --input
                                  INPUT [--output_file_name OUTPUT_FILE_NAME]
                                  [--add_output_sam_program_record]
                                  [--add_output_vcf_command_line]
                                  [--arguments_file ARGUMENTS_FILE]
                                  [--cloud_index_prefetch_buffer CLOUD_INDEX_PREFETCH_BUFFER]
                                  [--cloud_prefetch_buffer CLOUD_PREFETCH_BUFFER]
                                  [--create_output_bam_md5]
                                  [--create_output_variant_index]
                                  [--create_output_variant_md5]
                                  [--disable_bam_index_caching]
                                  [--disable_read_filter DISABLE_READ_FILTER]
                                  [--disable_sequence_dictionary_validation]
                                  [--emit_original_quals]
                                  [--exclude_intervals EXCLUDE_INTERVALS]
                                  [--gatk_config_file GATK_CONFIG_FILE]
                                  [--gcs_max_retries GCS_MAX_RETRIES]
                                  [--gcs_project_for_requester_pays GCS_PROJECT_FOR_REQUESTER_PAYS]
                                  [--global_qscore_prior GLOBAL_QSCORE_PRIOR]
                                  [--interval_exclusion_padding INTERVAL_EXCLUSION_PADDING]
                                  [--interval_merging_rule INTERVAL_MERGING_RULE]
                                  [--interval_padding INTERVAL_PADDING]
                                  [--interval_set_rule INTERVAL_SET_RULE]
                                  [--intervals INTERVALS] [--lenient]
                                  [--preserve_qscores_less_than PRESERVE_QSCORES_LESS_THAN]
                                  [--quantize_quals QUANTIZE_QUALS] [--quiet]
                                  [--read_filter READ_FILTER]
                                  [--read_index READ_INDEX]
                                  [--read_validation_stringency READ_VALIDATION_STRINGENCY]
                                  [--seconds_between_progress_updates SECONDS_BETWEEN_PROGRESS_UPDATES]
                                  [--sequence_dictionary SEQUENCE_DICTIONARY]
                                  [--sites_only_vcf_output]
                                  [--use_jdk_deflater] [--use_jdk_inflater]
                                  [--use_original_qualities]
                                  [--memory_overhead MEMORY_OVERHEAD]
                                  [--memory_per_job MEMORY_PER_JOB]
                                  [--number_of_threads NUMBER_OF_THREADS]
                                  [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --reference REFERENCE
                        Reference sequence
  --create_output_bam_index
  --bqsr_recal_file BQSR_RECAL_FILE
                        Input recalibration table for BQSR. Only run ApplyBQSR
                        with the covariates table created from the input BAM
  --input INPUT         A BAM file containing input read data
  --output_file_name OUTPUT_FILE_NAME
                        Output file name. Not Required
  --add_output_sam_program_record
  --add_output_vcf_command_line
  --arguments_file ARGUMENTS_FILE
  --cloud_index_prefetch_buffer CLOUD_INDEX_PREFETCH_BUFFER
  --cloud_prefetch_buffer CLOUD_PREFETCH_BUFFER
  --create_output_bam_md5
  --create_output_variant_index
  --create_output_variant_md5
  --disable_bam_index_caching
  --disable_read_filter DISABLE_READ_FILTER
  --disable_sequence_dictionary_validation
  --emit_original_quals
  --exclude_intervals EXCLUDE_INTERVALS
  --gatk_config_file GATK_CONFIG_FILE
  --gcs_max_retries GCS_MAX_RETRIES
  --gcs_project_for_requester_pays GCS_PROJECT_FOR_REQUESTER_PAYS
  --global_qscore_prior GLOBAL_QSCORE_PRIOR
  --interval_exclusion_padding INTERVAL_EXCLUSION_PADDING
  --interval_merging_rule INTERVAL_MERGING_RULE
  --interval_padding INTERVAL_PADDING
  --interval_set_rule INTERVAL_SET_RULE
  --intervals INTERVALS
  --lenient
  --preserve_qscores_less_than PRESERVE_QSCORES_LESS_THAN
  --quantize_quals QUANTIZE_QUALS
  --quiet
  --read_filter READ_FILTER
  --read_index READ_INDEX
  --read_validation_stringency READ_VALIDATION_STRINGENCY
  --seconds_between_progress_updates SECONDS_BETWEEN_PROGRESS_UPDATES
  --sequence_dictionary SEQUENCE_DICTIONARY
  --sites_only_vcf_output
  --use_jdk_deflater
  --use_jdk_inflater
  --use_original_qualities
  --memory_overhead MEMORY_OVERHEAD
  --memory_per_job MEMORY_PER_JOB
  --number_of_threads NUMBER_OF_THREADS