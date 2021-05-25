# MarkDuplicates v4.1.8.1

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| gatk | 4.1.8.1 | broadinstitute/gatk:4.1.8.1 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner picard_mark_duplicates_4.1.8.1.cwl example_inputs.yaml
```

### Usage

```bash
usage: picard_mark_duplicates_4.1.8.1.cwl [-h]

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
  --read_name_regex READ_NAME_REGEX
                        MarkDuplicates can use the tile and cluster positions
                        to estimate the rate of optical duplication in
                        addition to the dominant source of duplication, PCR,
                        to provide a more accurate estimation of library size.
                        By default (with no READ_NAME_REGEX specified),
                        MarkDuplicates will attempt to extract coordinates
                        using a split on ':' (see Note below). Set
                        READ_NAME_REGEX to 'null' to disable optical duplicate
                        detection. Note that without optical duplicate counts,
                        library size estimation will be less accurate. If the
                        read name does not follow a standard Illumina colon-
                        separation convention, but does contain tile and x,y
                        coordinates, a regular expression can be specified to
                        extract three variables: tile/region, x coordinate and
                        y coordinate from a read name. The regular expression
                        must contain three capture groups for the three
                        variables, in order. It must match the entire read
                        name. e.g. if field names were separated by semi-colon
                        (';') this example regex could be specified
                        (?:.*;)?([0-9]+)[^;]*;([0-9]+)[^;]*;([0-9]+)[^;]*$
                        Note that if no READ_NAME_REGEX is specified, the read
                        name is split on ':'. For 5 element names, the 3rd,
                        4th and 5th elements are assumed to be tile, x and y
                        values. For 7 element names (CASAVA 1.8), the 5th,
                        6th, and 7th elements are assumed to be tile, x and y
                        values.
  --sorting_collection_size_ratio SORTING_COLLECTION_SIZE_RATIO
                        This number, plus the maximum RAM available to the
                        JVM, determine the memory footprint used by some of
                        the sorting collections. If you are running out of
                        memory, try reducing this number.
  --use_jdk_deflater    Use the JDK Deflater instead of the Intel Deflater for
                        writing compressed output
  --use_jdk_inflater    Whether to create a BAM index when writing a
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

