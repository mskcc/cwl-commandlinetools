# CWL for running GATK - CollectAlignmentSummaryMetrics

## Version of tools in docker image

| Tool	| Version	| Location	|
|---	|---	|---	|
| gatk  	| 4.1.8.0  	|  broadinstitute/gatk:4.1.8.0	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_collect_alignment_summary_metrics_4.1.8.0.cwl example_inputs.yaml
```

### Usage

```bash
usage: ./GitHub/cwl-commandlinetools/gatk_collect_alignment_summary_metrics_4.1.8.0/gatk_collect_alignment_summary_metrics_4.1.8.0.cwl
       [-h] [--memory_per_job MEMORY_PER_JOB]
       [--memory_overhead MEMORY_OVERHEAD]
       [--number_of_threads NUMBER_OF_THREADS] --input INPUT
       --output_file_name OUTPUT_FILE_NAME [--reference REFERENCE]
       [--adaptor_sequence ADAPTOR_SEQUENCE]
       [--metrics_acciumulation_level METRICS_ACCIUMULATION_LEVEL]
       [--expected_pair_orientations EXPECTED_PAIR_ORIENTATIONS]
       [--is_bisulfite_sequenced] [--max_insert_size MAX_INSERT_SIZE]
       [--validation_stringency VALIDATION_STRINGENCY] [--assume_sorted]
       [--stop_after STOP_AFTER] [--create_index] [--create_md5_file]
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
  --reference REFERENCE
                        Reference sequence file. Note that while this argument
                        is not required, without it only a small subset of the
                        metrics will be calculated. Note also that if a
                        reference sequence is provided, it must be accompanied
                        by a sequence dictionary. Default value: null.
  --adaptor_sequence ADAPTOR_SEQUENCE
                        List of adapter sequences to use when processing the
                        alignment metrics. This argument may be specified 0 or
                        more times. Default value: [AATGATACGGCGACCACCGAGATCTA
                        CACTCTTTCCCTACACGACGCTCTTCCGATCT,
                        to clear the default value. Possible values:
                        {ALL_READS, SAMPLE, LIBRARY, READ_GROUP} This option
                        may be specified 0 or more times. This option can be
                        set to 'null' to clear the default list.
  --expected_pair_orientations EXPECTED_PAIR_ORIENTATIONS
                        Paired-end reads that do not have this expected
                        orientation will be considered chimeric. This argument
                        may be specified 0 or more times. Default value: [FR].
                        Possible values: {FR, RF, TANDEM}
  --is_bisulfite_sequenced
                        Whether the SAM or BAM file consists of bisulfite
                        sequenced reads. Default value: false. Possible
                        values: {true, false}
  --max_insert_size MAX_INSERT_SIZE
                        Paired-end reads above this insert size will be
                        considered chimeric along with inter-chromosomal
                        pairs. Default value: 100000.
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
