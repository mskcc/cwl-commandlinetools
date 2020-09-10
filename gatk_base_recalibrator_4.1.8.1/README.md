# CWL and Dockerfile for running GATK4 - Base Recalibrator

## Version of tools in [docker image ](https://hub.docker.com/r/broadinstitute/gatk)

| Tool	| Version	| Location	|
|---	|---	|---	|
| GATK  	| 4.1.8.1  	|  https://github.com/broadinstitute/gatk/releases/tag/4.1.8.1	|

[![](https://img.shields.io/badge/version-4.1.8.1-blue)](https://github.com/broadinstitute/gatk/releases/tag/4.1.8.1)
## CWL

- CWL specification 1.0
- Use example_inputs.yml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_base_recalibrator_4.1.8.1.cwl example_inputs.yml
```

**If at MSK, using the JUNO cluster having installed toil version 3.19 and manually modifying [lsf.py](https://github.com/DataBiosphere/toil/blob/releases/3.19.0/src/toil/batchSystems/lsf.py#L170) by removing `type==X86_64 &&` you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict gatk_base_recalibrator_4.1.8.1.cwl inputs.yaml

#Using toil-cwl-runner
> mkdir run_directory
> toil-cwl-runner --singularity --logFile path/to/run_directory/cwltoil.log  --jobStore path/to/jobStore --batchSystem lsf --workDir /path/to/run_directory --outdir /path/to/run_directory --writeLogs /path/to/run_directory --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 gatk_base_recalibrator_4.1.8.1.cwl inputs.yaml > file.stdout 2> file.stderr &
```

## Usage

```bash
> toil-cwl-runner gatk_base_recalibrator_4.1.8.1.cwl --help

usage: gatk_base_recalibrator_4.1.8.1.cwl [-h] --input INPUT --known_sites_1
                                         KNOWN_SITES_1 --reference REFERENCE
                                         [--output_file_name OUTPUT_FILE_NAME]
                                         [--add_output_sam_program_record]
                                         [--add_output_vcf_command_line]
                                         [--arguments_file ARGUMENTS_FILE]
                                         [--binary_tag_name BINARY_TAG_NAME]
                                         [--bqsr_baq_gap_open_penalty BQSR_BAQ_GAP_OPEN_PENALTY]
                                         [--cloud-index-prefetch-buffer CLOUD_INDEX_PREFETCH_BUFFER]
                                         [--cloud_prefetch_buffer CLOUD_PREFETCH_BUFFER]
                                         [--create_output_bam_index]
                                         [--create_output_bam_md5]
                                         [--create_output_variant_index]
                                         [--create_output_variant_md5]
                                         [--default_base_qualities DEFAULT_BASE_QUALITIES]
                                         [--deletions_default_quality DELETIONS_DEFAULT_QUALITY]
                                         [--disable_bam_index_caching]
                                         [--disable_read_filter DISABLE_READ_FILTER]
                                         [--disable_sequence_dictionary_validation]
                                         [--exclude_intervals EXCLUDE_INTERVALS]
                                         [--gatk_config_file GATK_CONFIG_FILE]
                                         [--gcs_max_retries GCS_MAX_RETRIES]
                                         [--gcs_project_for_requester_pays GCS_PROJECT_FOR_REQUESTER_PAYS]
                                         [--indels_context_size INDELS_CONTEXT_SIZE]
                                         [--insertions_default_quality INSERTIONS_DEFAULT_QUALITY]
                                         [--interval_exclusion_padding INTERVAL_EXCLUSION_PADDING]
                                         [--interval_merging_rule INTERVAL_MERGING_RULE]
                                         [--interval_padding INTERVAL_PADDING]
                                         [--interval_set_rule INTERVAL_SET_RULE]
                                         [--intervals INTERVALS] [--lenient]
                                         [--low_quality_tail LOW_QUALITY_TAIL]
                                         [--maximum_cycle_value MAXIMUM_CYCLE_VALUE]
                                         [--mismatches_context_size MISMATCHES_CONTEXT_SIZE]
                                         [--mismatches_default_quality MISMATCHES_DEFAULT_QUALITY]
                                         [--preserve_qscores_less_than PRESERVE_QSCORES_LESS_THAN]
                                         [--quantizing_levels QUANTIZING_LEVELS]
                                         [--QUIET] [--read_filter READ_FILTER]
                                         [--read_index READ_INDEX]
                                         [--seconds_between_progress_updates SECONDS_BETWEEN_PROGRESS_UPDATES]
                                         [--sequence_dictionary SEQUENCE_DICTIONARY]
                                         [--sites_only_vcf_output]
                                         [--use_original_qualities]
                                         [--number_of_threads NUMBER_OF_THREADS]
                                         [--memory_per_job MEMORY_PER_JOB]
                                         [--memory_overhead MEMORY_OVERHEAD]
                                         [--known_sites_2 KNOWN_SITES_2]
                                         [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --input INPUT         BAM/SAM file containing reads
  --known_sites_1 KNOWN_SITES_1
                        One or more databases of known polymorphic sites used
                        to exclude regions around known polymorphisms from
                        analysis
  --reference REFERENCE
                        Reference sequence file
  --output_file_name OUTPUT_FILE_NAME
                        Output file name. Not Required
  --add_output_sam_program_record
  --add_output_vcf_command_line
  --arguments_file ARGUMENTS_FILE
  --binary_tag_name BINARY_TAG_NAME
  --bqsr_baq_gap_open_penalty BQSR_BAQ_GAP_OPEN_PENALTY
  --cloud-index-prefetch-buffer CLOUD_INDEX_PREFETCH_BUFFER
  --cloud_prefetch_buffer CLOUD_PREFETCH_BUFFER
  --create_output_bam_index
  --create_output_bam_md5
  --create_output_variant_index
  --create_output_variant_md5
  --default_base_qualities DEFAULT_BASE_QUALITIES
  --deletions_default_quality DELETIONS_DEFAULT_QUALITY
  --disable_bam_index_caching
  --disable_read_filter DISABLE_READ_FILTER
  --disable_sequence_dictionary_validation
  --exclude_intervals EXCLUDE_INTERVALS
  --gatk_config_file GATK_CONFIG_FILE
  --gcs_max_retries GCS_MAX_RETRIES
  --gcs_project_for_requester_pays GCS_PROJECT_FOR_REQUESTER_PAYS
  --indels_context_size INDELS_CONTEXT_SIZE
  --insertions_default_quality INSERTIONS_DEFAULT_QUALITY
  --interval_exclusion_padding INTERVAL_EXCLUSION_PADDING
  --interval_merging_rule INTERVAL_MERGING_RULE
  --interval_padding INTERVAL_PADDING
  --interval_set_rule INTERVAL_SET_RULE
  --intervals INTERVALS
  --lenient
  --low_quality_tail LOW_QUALITY_TAIL
  --maximum_cycle_value MAXIMUM_CYCLE_VALUE
  --mismatches_context_size MISMATCHES_CONTEXT_SIZE
  --mismatches_default_quality MISMATCHES_DEFAULT_QUALITY
  --preserve_qscores_less_than PRESERVE_QSCORES_LESS_THAN
  --quantizing_levels QUANTIZING_LEVELS
  --QUIET
  --read_filter READ_FILTER
  --read_index READ_INDEX
  --seconds_between_progress_updates SECONDS_BETWEEN_PROGRESS_UPDATES
  --sequence_dictionary SEQUENCE_DICTIONARY
  --sites_only_vcf_output
  --use_original_qualities
  --number_of_threads NUMBER_OF_THREADS
  --memory_per_job MEMORY_PER_JOB
  --memory_overhead MEMORY_OVERHEAD
  --known_sites_2 KNOWN_SITES_2
