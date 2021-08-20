# HSmetrics v2.21.2

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| picard | 2.8.1 | [https://github.com/broadinstitute/picard/releases/download/2.21.2/picard.jar](https://github.com/broadinstitute/picard/releases/download/2.21.2/picard.jar) |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
> toil-cwl-runner picard_hsmetrics_2.21.2.cwl example_inputs.yaml
```

### Usage

```bash
> usage: picard_hsmetrics_2.21.2.cwl [-h]

optional arguments:
  -h, --help            show this help message and exit
  --bait_intervals BAIT_INTERVALS
                        An interval list file that contains the locations of
                        the baits used. Default value: null. This option must
                        be specified at least 1 times.
  --bait_set_name BAIT_SET_NAME
                        Bait set name. If not provided it is inferred from the
                        filename of the bait intervals. Default value: null
  --minimum_mapping_quality MINIMUM_MAPPING_QUALITY
                        Minimum mapping quality for a read to contribute
                        coverage. Default value: 20. This option can be set to
                        'null' to clear the default value.
  --minimum_base_quality MINIMUM_BASE_QUALITY
                        Minimum base quality for a base to contribute
                        coverage. Default value: 20. This option can be set to
                        'null' to clear the default value.
  --clip_overlapping_reads
                        True if we are to clip overlapping reads, false
                        otherwise. Default value: true. This option can be set
                        to 'null' to clear the default value. Possible values:
                        {true, false}
  --target_intervals TARGET_INTERVALS
                        An interval list file that contains the locations of
                        the targets. Default value: null. This option must be
                        specified at least 1 times.
  --input INPUT         An aligned SAM or BAM file. Required.
  --output_file_name OUTPUT_FILE_NAME
                        The output file to write the metrics to. Required.
  --metric_accumulation_level METRIC_ACCUMULATION_LEVEL
                        The level(s) at which to accumulate metrics. Default
                        value: [ALL_READS]. This option can be set to 'null'
                        to clear the default value. Possible values:
                        {ALL_READS, SAMPLE, LIBRARY, READ_GROUP} This option
                        may be specified 0 or more times. This option can be
                        set to 'null' to clear the default list.
  --per_target_coverage PER_TARGET_COVERAGE
                        An optional file to output per target coverage
                        information to. Default value: null.
  --per_base_coverage PER_BASE_COVERAGE
                        An optional file to output per base coverage
                        information to. The per-base file contains one line
                        per target base and can grow very large. It is not
                        recommended for use with large target sets. Default
                        value: null.
  --near_distance NEAR_DISTANCE
                        The maximum distance between a read and the nearest
                        probe/bait/amplicon for the read to be considered
                        'near probe' and included in percent selected. Default
                        value: 250. This option can be set to 'null' to clear
                        the default value.
  --coverage_cap COVERAGE_CAP
                        Parameter to set a max coverage limit for Theoretical
                        Sensitivity calculations. Default is 200. Default
                        value: 200. This option can be set to 'null' to clear
                        the default value.
  --sample_size SAMPLE_SIZE
                        Sample Size used for Theoretical Het Sensitivity
                        sampling. Default is 10000. Default value: 10000. This
                        option can be set to 'null' to clear the default
                        value.
```

