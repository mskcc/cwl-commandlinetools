# CWL for running GATK - MeanQualityByCycle

## Version of tools in docker image

| Tool	| Version	| Location	|
|---	|---	|---	|
| gatk  	| 4.1.8.0  	|  broadinstitute/gatk:4.1.8.0	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_mean_quality_by_cycle_4.1.8.0.cwl example_inputs.yaml
```

### Usage

```bash
usage: gatk_mean_quality_by_cycle_4.1.8.0.cwl
       [-h] --input INPUT [--output_file_name OUTPUT_FILE_NAME]
       [--chart_output CHART_OUTPUT] [--assume_sorted] [--pf_reads_only]
       [--reference REFERENCE] [--validation_stringency VALIDATION_STRINGENCY]
       [--create_index] [--create_md5_file] [--memory_per_job MEMORY_PER_JOB]
       [--memory_overhead MEMORY_OVERHEAD]
       [--number_of_threads NUMBER_OF_THREADS]
       [--temporary_directory TEMPORARY_DIRECTORY]
       [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --input INPUT         An aligned SAM or BAM file. Required.
  --output_file_name OUTPUT_FILE_NAME
                        The output file to write the metrics to.
  --chart_output CHART_OUTPUT
                        A file (with .pdf extension) to write the chart to.
  --assume_sorted       If true (default), then the sort order in the header
                        file will be ignored.
  --pf_reads_only       If set to true calculate mean quality over PF reads
                        only. Default value: false. Possible values: {true,
                        false}
  --reference REFERENCE
                        Reference sequence file. Note that while this argument
                        is not required, without it only a small subset of the
                        metrics will be calculated. Note also that if a
                        reference sequence is provided, it must be accompanied
                        by a sequence dictionary. Default value: null.
  --validation_stringency VALIDATION_STRINGENCY
                        Validation stringency for all SAM files read by this
                        program. Setting stringency to SILENT can improve
                        performance when processing a BAM file in which
                        variable-length data (read, qualities, tags) do not
                        otherwise need to be decoded. Default value: STRICT.
                        This option can be set to 'null' to clear the default
                        value. Possible values: {STRICT,LENIENT, SILENT}
  --create_index        Whether to create a BAM index when writing a
                        coordinate-sorted BAM file. Default value: false.
                        Possible values: {true, false}
  --create_md5_file     Whether to create an MD5 digest for any BAM or FASTQ
                        files created. Default value: false. Possible values:
                        {true, false}
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --temporary_directory TEMPORARY_DIRECTORY
                        Default value: null. This option may be specified 0 or
                        more times.
```
