# MergeSamFiles v4.1.8.0

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| gatk | 4.1.8.0 | broadinstitute/gatk:4.1.8.0 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_merge_sam_files_4.1.8.0.cwl example_inputs.yaml
```

### Usage

```bash
usage: gatk_merge_sam_files_4.1.8.0.cwl [-h] [--memory_per_job MEMORY_PER_JOB]
                                        [--memory_overhead MEMORY_OVERHEAD]
                                        [--number_of_threads NUMBER_OF_THREADS]
                                        --input INPUT
                                        [--output_file_name OUTPUT_FILE_NAME]
                                        [--assume_sorted] [--comment COMMENT]
                                        [--create_index] [--create_md5_file]
                                        [--intervals INTERVALS]
                                        [--merge_sequence_dictionaries]
                                        [--reference_sequence REFERENCE_SEQUENCE]
                                        [--sort_order SORT_ORDER]
                                        [--use_threading]
                                        [--validation_stringency VALIDATION_STRINGENCY]
                                        [--verbosity VERBOSITY]
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
  --input INPUT         SAM or BAM input file This argument must be specified
                        at least once. Required.
  --output_file_name OUTPUT_FILE_NAME
                        SAM or BAM file to write merged result to Required.
  --assume_sorted       If true, assume that the input files are in the same
                        sort order as the requested output sort order, even if
                        their headers say otherwise. Default value: false.
                        Possible values: {true, false}
  --comment COMMENT     Comment(s) to include in the merged output files
                        header. This argument may be specified 0 or more
                        times. Default value: null.
  --create_index        Whether to create a BAM index when writing a
                        coordinate-sorted BAM file. Default value: false.
                        Possible values: {true, false}
  --create_md5_file     Whether to create an MD5 digest for any BAM or FASTQ
                        files created. Default value: false. Possible values:
                        {true, false}
  --intervals INTERVALS
                        An interval list file that contains the locations of
                        the positions to merge. Assume bam are sorted and
                        indexed. The resulting file will contain alignments
                        that may overlap with genomic regions outside the
                        requested region. Unmapped reads are discarded.
                        Default value: null.
  --merge_sequence_dictionaries
                        Merge the sequence dictionaries Default value: false.
                        Possible values: {true, false}
  --reference_sequence REFERENCE_SEQUENCE
                        Reference sequence file. Default value: null.
  --sort_order SORT_ORDER
                        Sort order of output file Default value: coordinate.
                        Possible values: {unsorted, queryname, coordinate,
                        duplicate, unknown}
  --use_threading       Option to create a background thread to encode,
                        compress and write to disk the output file. The
                        threaded version uses about 20% more CPU and decreases
                        runtime by ~20% when writing out a compressed BAM
                        file. Default value: false. Possible values: {true,
                        false}
  --validation_stringency VALIDATION_STRINGENCY
                        Validation stringency for all SAM files read by this
                        program. Setting stringency to SILENT can improve
                        performance when processing a BAM file in which
                        variable-length data (read, qualities, tags) do not
                        otherwise need to be decoded. Default value: STRICT.
                        Possible values: {STRICT, LENIENT, SILENT}
  --verbosity VERBOSITY
                        Control verbosity of logging. Default value: INFO.
                        Possible values: {ERROR, WARNING, INFO, DEBUG}
```

