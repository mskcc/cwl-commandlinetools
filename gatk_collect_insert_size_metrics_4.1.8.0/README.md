# CWL for running GATK - CollectInsertSizeMetrics

## Version of tools in docker image

| Tool	| Version	| Location	|
|---	|---	|---	|
| gatk  	| 4.1.8.0  	|  broadinstitute/gatk:4.1.8.0	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_collect_insert_size_metrics_4.1.8.0.cwl example_inputs.yaml
```

### Usage

```bash
usage: ./GitHub/cwl-commandlinetools/gatk_collect_insert_size_metrics_4.1.8.0/gatk_collect_insert_size_metrics_4.1.8.0.cwl
       [-h] [--memory_per_job MEMORY_PER_JOB]
       [--memory_overhead MEMORY_OVERHEAD]
       [--number_of_threads NUMBER_OF_THREADS] --input INPUT
       --output_file_name OUTPUT_FILE_NAME --histogram_file HISTOGRAM_FILE
       [--deviations DEVIATIONS] [--histogram_width HISTOGRAM_WIDTH]
       [--minimum_pct MINIMUM_PCT]
       [--metrics_acciumulation_level METRICS_ACCIUMULATION_LEVEL]
       [--include_duplicates] [--validation_stringency VALIDATION_STRINGENCY]
       [--assume_sorted] [--stop_after STOP_AFTER] [--create_index]
       [--create_md5_file]
       [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --input INPUT         Input file (bam or sam). Required.
  --output_file_name OUTPUT_FILE_NAME
                        File to write the output to. Required.
  --histogram_file HISTOGRAM_FILE
                        File to write insert size Histogram chart to.
                        Required.
  --deviations DEVIATIONS
                        Generate mean, sd and plots by trimming the data down
                        to MEDIAN + DEVIATIONS*MEDIAN_ABSOLUTE_DEVIATION. This
                        is done because insert size data typically includes
                        enough anomalous values from chimeras and other
                        artifacts to make the mean and sd grossly misleading
                        regarding the real distribution. Default value: 10.0.
                        This option can be set to 'null' to clear the default
                        value.
  --histogram_width HISTOGRAM_WIDTH
                        Explicitly sets the Histogram width, overriding
                        automatic truncation of Histogram tail. Also, when
                        calculating mean and standard deviation, only bins <=
                        Histogram_WIDTH will be included. Default value: null.
  --minimum_pct MINIMUM_PCT
                        When generating the Histogram, discard any data
                        categories (out of FR, TANDEM, RF) that have fewer
                        than this percentage of overall reads. (Range: 0 to
                        1). Default value: 0.05. This option can be set to
                        'null' to clear the default value.
  --metrics_acciumulation_level METRICS_ACCIUMULATION_LEVEL
                        The level(s) at which to accumulate metrics. Default
                        value: [ALL_READS]. This option can be set to 'null'
                        to clear the default value. Possible values:
                        {ALL_READS, SAMPLE, LIBRARY, READ_GROUP} This option
                        may be specified 0 or more times. This option can be
                        set to 'null' to clear the default list.
  --include_duplicates  If true, also include reads marked as duplicates in
                        the insert size histogram. Default value: false. This
                        option can be set to 'null' to clear the default
                        value. Possible values: {true, false}
  --validation_stringency VALIDATION_STRINGENCY
                        Validation stringency for all SAM files read by this
                        program. Setting stringency to SILENT can improve
                        performance when processing a BAM file in which
                        variable-length data (read, qualities, tags) do not
                        otherwise need to be decoded. Default value: STRICT.
                        This option can be set to 'null' to clear the default
                        value. Possible values: {STRICT,LENIENT, SILENT}
  --assume_sorted       If true (default), then the sort order in the header
                        file will be ignored. Default value: true. This option
                        can be set to 'null' to clear the default value.
                        Possible values: {true, false}
  --stop_after STOP_AFTER
                        Stop after processing N reads, mainly for debugging.
                        Default value: 0. This option can be set to 'null' to
                        clear the default value.
  --create_index        Whether to create a BAM index when writing a
                        coordinate-sorted BAM file. Default value: false.
                        Possible values: {true, false}
  --create_md5_file     Whether to create an MD5 digest for any BAM or FASTQ
                        files created. Default value: false. Possible values:
                        {true, false}
```
