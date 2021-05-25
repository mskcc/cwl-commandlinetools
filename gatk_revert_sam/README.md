# CWL for running GATK - RevertSam

## Version of tools in docker image

| Tool	| Version	| Location	|
|---	|---	|---	|
| gatk  	| 4.1.8.0  	|  broadinstitute/gatk:4.1.8.0	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_revert_sam_4.1.8.0.cwl example_inputs.yaml
```

### Usage

```bash
usage: gatk_revert_sam_4.1.8.0.cwl [-h] --input INPUT [--output OUTPUT]
                                   [--output_map OUTPUT_MAP]
                                   [--attribute_to_clear ATTRIBUTE_TO_CLEAR]
                                   [--max_discard_fraction MAX_DISCARD_FRACTION]
                                   [--library_name LIBRARY_NAME]
                                   [--max_records_in_ram MAX_RECORDS_IN_RAM]
                                   [--output_by_readgroup OUTPUT_BY_READGROUP]
                                   [--output_by_readgroup_file_format OUTPUT_BY_READGROUP_FILE_FORMAT]
                                   [--remove_alignment_information REMOVE_ALIGNMENT_INFORMATION]
                                   [--remove_duplicate_information REMOVE_DUPLICATE_INFORMATION]
                                   [--restore_hardclips RESTORE_HARDCLIPS]
                                   [--restore_original_qualities RESTORE_ORIGINAL_QUALITIES]
                                   [--sample_alias SAMPLE_ALIAS]
                                   [--sanitize SANITIZE]
                                   [--sort_order SORT_ORDER]
                                   [--reference REFERENCE]
                                   [--validation_stringency VALIDATION_STRINGENCY]
                                   [--compression_level COMPRESSION_LEVEL]
                                   [--create_index] [--create_md5_file]
                                   [--memory_per_job MEMORY_PER_JOB]
                                   [--memory_overhead MEMORY_OVERHEAD]
                                   [--number_of_threads NUMBER_OF_THREADS]
                                   [--temporary_directory TEMPORARY_DIRECTORY]
                                   [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --input INPUT         An aligned SAM or BAM file. Required.
  --output OUTPUT       The output SAM/BAM file to create, or an output
                        directory if OUTPUT_BY_READGROUP is true. Required.
                        Cannot be used in conjunction with argument(s)
                        OUTPUT_MAP (OM)
  --output_map OUTPUT_MAP
                        Tab separated file with two columns, READ_GROUP_ID and
                        OUTPUT, providing file mapping only used if
                        OUTPUT_BY_READGROUP is true. Required. Cannot be used
                        in conjunction with argument(s) OUTPUT (O)
  --attribute_to_clear ATTRIBUTE_TO_CLEAR
                        When removing alignment information, the set of
                        optional tags to remove. This may be specified 0 or
                        more times. Default value: [NM, UQ, PG, MD, MQ, SA,
                        MC, AS].
  --max_discard_fraction MAX_DISCARD_FRACTION
                        If SANITIZE=true and higher than MAX_DISCARD_FRACTION
                        reads are discarded due to sanitization thenthe
                        program will exit with an Exception instead of exiting
                        cleanly. Output BAM will still be valid. Default
                        value: 0.01.
  --library_name LIBRARY_NAME
                        The library name to use in the reverted output file.
                        This will override the existing sample alias in the
                        file and is used only if all the read groups in the
                        input file have the same library name. Default value:
                        null.
  --max_records_in_ram MAX_RECORDS_IN_RAM
                        When writing files that need to be sorted, this will
                        specify the number of records stored in RAM before
                        spilling to disk. Increasing this number reduces the
                        number of file handles needed to sort the file, and
                        increases the amount of RAM needed. Default value:
                        500000.
  --output_by_readgroup OUTPUT_BY_READGROUP
                        When true, outputs each read group in a separate file.
                        Default value: false. Possible values: {true, false}
  --output_by_readgroup_file_format OUTPUT_BY_READGROUP_FILE_FORMAT
                        When using OUTPUT_BY_READGROUP, the output file format
                        can be set to a certain format. Default value:
                        dynamic. sam (Generate SAM files.) bam (Generate BAM
                        files.) cram (Generate CRAM files.) dynamic (Generate
                        files based on the extention of INPUT.)
  --remove_alignment_information REMOVE_ALIGNMENT_INFORMATION
                        Remove all alignment information from the file.
                        Default value: true. Possible values: {true, false}
  --remove_duplicate_information REMOVE_DUPLICATE_INFORMATION
                        Remove duplicate read flags from all reads. Note that
                        if this is false and
                        REMOVE_ALIGNMENT_INFORMATION==true, the output may
                        have the unusual but sometimes desirable trait of
                        having unmapped reads that are marked as duplicates.
                        Default value: true. Possible values: {true, false}
  --restore_hardclips RESTORE_HARDCLIPS
                        When true, restores reads and qualities of records
                        with hard-clips containing XB and XQ tags. Default
                        value: true. Possible values: {true, false}
  --restore_original_qualities RESTORE_ORIGINAL_QUALITIES
                        True to restore original qualities from the OQ field
                        to the QUAL field if available. Default value: true.
                        Possible values: {true, false}
  --sample_alias SAMPLE_ALIAS
                        The sample alias to use in the reverted output file.
                        This will override the existing sample alias in the
                        file and is used only if all the read groups in the
                        input file have the same sample alias. Default value:
                        null.
  --sanitize SANITIZE   WARNING: This option is potentially destructive. If
                        enabled will discard reads in order to produce a
                        consistent output BAM. Reads discarded include (but
                        are not limited to) paired reads with missing mates,
                        duplicated records, records with mismatches in length
                        of bases and qualities. This option can only be
                        enabled if the output sort order is queryname and will
                        always cause sorting to occur. Default value: false.
                        Possible values: {true, false}
  --sort_order SORT_ORDER
                        The sort order to create the reverted output file
                        with. Default value: queryname. Possible values:
                        {unsorted, queryname, coordinate, duplicate, unknown}
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
  --compression_level COMPRESSION_LEVEL
                        Compression level for all compressed files created
                        (e.g. BAM and VCF). Default value: 2.
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
