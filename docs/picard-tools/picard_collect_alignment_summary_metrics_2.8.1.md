# CollectAlignmentSummaryMetrics v2.8.1

## Version of tools in docker image \(../picard\_mark\_duplicates\_2.8.1/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| java base image | 8 | - |
| picard | 2.8.1 | [https://github.com/broadinstitute/picard/releases/download/2.8.1/picard.jar](https://github.com/broadinstitute/picard/releases/download/2.8.1/picard.jar) |
| R | 3.3.3 | r-base for opnejdk:8 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner picard_collect_alignment_summary_metrics_2.8.1.cwl example_inputs.yaml
```

### Usage

```bash
> usage: picard_collect_alignment_summary_metrics_2.8.1.cwl [-h]

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
                        Output file (bam or sam).
  --metrics_acciumulation_level METRICS_ACCIUMULATION_LEVEL
                        The level(s) at which to accumulate metrics. Default
                        value: [ALL_READS]. This option can be set to 'null'
                        to clear the default value. Possible values:
                        {ALL_READS, SAMPLE, LIBRARY, READ_GROUP} This option
                        may be specified 0 or more times. This option can be
                        set to 'null' to clear the default list.
  --max_insert_size MAX_INSERT_SIZE
                        Paired-end reads above this insert size will be
                        considered chimeric along with inter-chromosomal
                        pairs. Default value: 100000. This option can be set
                        to 'null' to clear the default value.
  --tmp_dir TMP_DIR     This option may be specified 0 or more times
  --validation_stringency VALIDATION_STRINGENCY
                        Validation stringency for all SAM files read by this
                        program. Setting stringency to SILENT can improve
                        performance when processing a BAM file in which
                        variable-length data (read, qualities, tags) do not
                        otherwise need to be decoded. Default value: STRICT.
                        This option can be set to 'null' to clear the default
                        value. Possible values: {STRICT,LENIENT, SILENT}
  --bam_compression_level BAM_COMPRESSION_LEVEL
                        Compression level for all compressed files created
                        (e.g. BAM and GELI). Default value:5. This option can
                        be set to 'null' to clear the default value.
  --create_bam_index    Whether to create a BAM index when writing a
                        coordinate-sorted BAM file. Default value:false. This
                        option can be set to 'null' to clear the default
                        value. Possible values:{true, false}
  --assume_sorted
  --reference_sequence REFERENCE_SEQUENCE
                        Reference sequence file. Note that while this argument
                        isn't required, without it only a small subset of the
                        metrics will be calculated. Note also that if a
                        reference sequence is provided, it must be accompanied
                        by a sequence dictionary. Default value: null.
  --stop_after STOP_AFTER
                        Stop after processing N reads, mainly for debugging.
                        Default value: 0. This option can be set to 'null' to
                        clear the default value.
```

