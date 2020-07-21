# CWL for running GATK - CollectHsMetrics

## Version of tools in docker image

| Tool	| Version	| Location	|
|---	|---	|---	|
| gatk  	| 4.1.8.0  	|  broadinstitute/gatk:4.1.8.0	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_collect_hs_metrics_4.1.8.0.cwl example_inputs.yaml
```

### Usage

```bash
usage: ./GitHub/cwl-commandlinetools/gatk_collect_hs_metrics_4.1.8.0/gatk_collect_hs_metrics_4.1.8.0.cwl
       [-h] --input INPUT --bait_intervals BAIT_INTERVALS --target_intervals
       TARGET_INTERVALS --output_file_name OUTPUT_FILE_NAME
       [--per_base_coverage PER_BASE_COVERAGE]
       [--per_target_coverage PER_TARGET_COVERAGE]
       [--theoretical_sensitivity_output THEORETICAL_SENSITIVITY_OUTPUT]
       [--allele_fraction ALLELE_FRACTION] [--bait_set_name BAIT_SET_NAME]
       [--clip_overlapping_reads] [--coverage_cap COVERAGE_CAP]
       [--include_indels] [--minimum_base_quality MINIMUM_BASE_QUALITY]
       [--minimum_mapping_quality MINIMUM_MAPPING_QUALITY]
       [--near_distance NEAR_DISTANCE] [--sample_size SAMPLE_SIZE]
       [--reference REFERENCE]
       [--metrics_acciumulation_level METRICS_ACCIUMULATION_LEVEL]
       [--validation_stringency VALIDATION_STRINGENCY] [--create_index]
       [--create_md5_file] [--memory_per_job MEMORY_PER_JOB]
       [--memory_overhead MEMORY_OVERHEAD]
       [--number_of_threads NUMBER_OF_THREADS]
       [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --input INPUT         An aligned SAM or BAM file. Required.
  --bait_intervals BAIT_INTERVALS
                        An interval list file that contains the locations of
                        the baits used. This argument must be specified at
                        least once. Required.
  --target_intervals TARGET_INTERVALS
                        An interval list file that contains the locations of
                        the targets. This argument must be specified at least
                        once. Required.
  --output_file_name OUTPUT_FILE_NAME
                        The output file to write the metrics to. Required.
  --per_base_coverage PER_BASE_COVERAGE
                        An optional file to output per base coverage
                        information to. The per-base file contains one line
                        per target base and can grow very large. It is not
                        recommended for use with large target sets. Default
                        value: null.
  --per_target_coverage PER_TARGET_COVERAGE
                        An optional file to output per target coverage
                        information to. Default value: null.
  --theoretical_sensitivity_output THEORETICAL_SENSITIVITY_OUTPUT
                        Output for Theoretical Sensitivity metrics where the
                        allele fractions are provided by the ALLELE_FRACTION
                        argument. Default value: null.
  --allele_fraction ALLELE_FRACTION
                        Allele fraction for which to calculate theoretical
                        sensitivity. This argument may be specified 0 or more
                        times. Default value: [0.001, 0.005, 0.01, 0.02, 0.05,
                        0.1, 0.2, 0.3, 0.5].
  --bait_set_name BAIT_SET_NAME
                        Bait set name. If not provided it is inferred from the
                        filename of the bait intervals. Default value: null.
  --clip_overlapping_reads
                        True if we are to clip overlapping reads, false
                        otherwise. Default value: true. Possible values:
                        {true, false}
  --coverage_cap COVERAGE_CAP
                        Parameter to set a max coverage limit for Theoretical
                        Sensitivity calculations. Default is 200. Default
                        value: 200.
  --include_indels      If true count inserted bases as on target and deleted
                        bases as covered by a read. Default value: false.
                        Possible values: {true, false}
  --minimum_base_quality MINIMUM_BASE_QUALITY
                        Minimum base quality for a base to contribute
                        coverage. Default value: 20.
  --minimum_mapping_quality MINIMUM_MAPPING_QUALITY
                        Minimum mapping quality for a read to contribute
                        coverage. Default value: 20.
  --near_distance NEAR_DISTANCE
                        The maximum distance between a read and the nearest
                        probe/bait/amplicon for the read to be considered
                        'near probe' and included in percent selected. Default
                        value: 250.
  --sample_size SAMPLE_SIZE
                        Sample Size used for Theoretical Het Sensitivity
                        sampling. Default is 10000. Default value: 10000.
  --reference REFERENCE
                        Reference sequence file. Note that while this argument
                        is not required, without it only a small subset of the
                        metrics will be calculated. Note also that if a
                        reference sequence is provided, it must be accompanied
                        by a sequence dictionary. Default value: null.
  --metrics_acciumulation_level METRICS_ACCIUMULATION_LEVEL
                        The level(s) at which to accumulate metrics. Default
                        value: [ALL_READS]. This option can be set to 'null'
                        to clear the default value. Possible values:
                        {ALL_READS, SAMPLE, LIBRARY, READ_GROUP} This option
                        may be specified 0 or more times. This option can be
                        set to 'null' to clear the default list.
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
```
