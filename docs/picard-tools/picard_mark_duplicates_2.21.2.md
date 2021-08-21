# MarkDuplicates v2.21.2

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| picard | 2.21.2 | [https://github.com/broadinstitute/picard/releases/download/2.21.2/picard.jar](https://github.com/broadinstitute/picard/releases/download/2.21.2/picard.jar) |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner picard_mark_duplicates_2.21.2.cwl example_inputs.yaml
```

### Usage

```bash
usage: picard_mark_duplicates_2.21.2.cwl [-h]

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
  --duplication_metrics DUPLICATION_METRICS
                        File to write duplication metrics to Required.
  --assume_sort_order ASSUME_SORT_ORDER
                        Optional sort order to output in. If not supplied
                        OUTPUT is in the same order as INPUT.Default value:
                        null. Possible values: {unsorted, queryname,
                        coordinate}
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
  --duplicate_scoring_strategy DUPLICATE_SCORING_STRATEGY
                        The scoring strategy for choosing the non-duplicate
                        among candidates. Default value:SUM_OF_BASE_QUALITIES.
                        This option can be set to 'null' to clear the default
                        value.Possible values: {SUM_OF_BASE_QUALITIES,
                        TOTAL_MAPPED_REFERENCE_LENGTH, RANDOM}
  --optical_duplicate_pixel_distance OPTICAL_DUPLICATE_PIXEL_DISTANCE
                        The maximum offset between two duplicate clusters in
                        order to consider them optical duplicates. The default
                        is appropriate for unpatterned versions of the
                        Illumina platform. For the patterned flowcell models,
                        2500 is moreappropriate. For other platforms and
                        models, users should experiment to find what works
                        best. Default value: 100. This option can be set to
                        'null' to clear the default value.
```

