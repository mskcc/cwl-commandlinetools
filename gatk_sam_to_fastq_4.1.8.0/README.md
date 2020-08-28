# CWL for running GATK - SamToFastq

## Version of tools in docker image

| Tool	| Version	| Location	|
|---	|---	|---	|
| gatk  	| 4.1.8.0  	|  broadinstitute/gatk:4.1.8.0	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_sam_to_fastq_4.1.8.0.cwl example_inputs.yaml
```

### Usage

```bash
usage: gatk_sam_to_fastq_4.1.8.0.cwl [-h] [--memory_per_job MEMORY_PER_JOB]
                                     [--memory_overhead MEMORY_OVERHEAD]
                                     [--number_of_threads NUMBER_OF_THREADS]
                                     --input INPUT [--fastq FASTQ]
                                     [--clipping_action CLIPPING_ACTION]
                                     [--clipping_attribute CLIPPING_ATTRIBUTE]
                                     [--clipping_min_length CLIPPING_MIN_LENGTH]
                                     [--compress_outputs_per_rg]
                                     [--compression_level COMPRESSION_LEVEL]
                                     [--create_index] [--include_non_pf_reads]
                                     [--include_non_primary_alignments]
                                     [--interleave]
                                     [--max_records_in_ram MAX_RECORDS_IN_RAM]
                                     [--output_dir OUTPUT_DIR]
                                     [--create_md5_file] [--output_per_rg]
                                     [--quality QUALITY] [--re_reverse]
                                     [--read1_max_bases_to_write READ1_MAX_BASES_TO_WRITE]
                                     [--read1_trim READ1_TRIM]
                                     [--read2_max_bases_to_write READ2_MAX_BASES_TO_WRITE]
                                     [--read2_trim READ2_TRIM]
                                     [--reference_sequence REFERENCE_SEQUENCE]
                                     [--rg_tag RG_TAG]
                                     [--second_end_fastq SECOND_END_FASTQ]
                                     [--unpaired_fastq UNPAIRED_FASTQ]
                                     [--validation_stringency VALIDATION_STRINGENCY]
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
  --input INPUT         Input SAM/BAM file to extract reads from Required.
  --fastq FASTQ         Output FASTQ file (single-end fastq or, if paired,
                        first end of the pair FASTQ). Required. Cannot be used
                        in conjunction with argument(s) OUTPUT_PER_RG (OPRG)
                        COMPRESS_OUTPUTS_PER_RG (GZOPRG) OUTPUT_DIR (ODIR)
  --clipping_action CLIPPING_ACTION
                        The action that should be taken with clipped reads:
                        'X' means the reads and qualities should be trimmed at
                        the clipped position; 'N' means the bases should be
                        changed to Ns in the clipped region; and any integer
                        means that the base qualities should be set to that
                        value in the clipped region. Default value: null.
  --clipping_attribute CLIPPING_ATTRIBUTE
                        The attribute that stores the position at which the
                        SAM record should be clipped Default value: null.
  --clipping_min_length CLIPPING_MIN_LENGTH
                        When performing clipping with the CLIPPING_ATTRIBUTE
                        and CLIPPING_ACTION parameters, ensure that the
                        resulting reads after clipping are at least
                        CLIPPING_MIN_LENGTH bases long. If the original read
                        is shorter than CLIPPING_MIN_LENGTH then the original
                        read length will be maintained. Default value: 0.
  --compress_outputs_per_rg
                        Compress output FASTQ files per read group using gzip
                        and append a .gz extension to the file names. Default
                        value: false. Possible values: {true, false} Cannot be
                        used in conjunction with argument(s) FASTQ (F)
                        SECOND_END_FASTQ (F2) UNPAIRED_FASTQ (FU)
  --compression_level COMPRESSION_LEVEL
                        Compression level for all compressed files created
                        (e.g. BAM and VCF). Default value: 2.
  --create_index        Whether to create a BAM index when writing a
                        coordinate-sorted BAM file. Default value: false.
                        Possible values: {true, false}
  --include_non_pf_reads
                        Include non-PF reads from the SAM file into the output
                        FASTQ files. PF means 'passes filtering'. Reads whose
                        'not passing quality controls' flag is set are non-PF
                        reads. See GATK Dictionary for more info. Default
                        value: false. Possible values: {true, false}
  --include_non_primary_alignments
                        If true, include non-primary alignments in the output.
                        Support of non-primary alignments in SamToFastq is not
                        comprehensive, so there may be exceptions if this is
                        set to true and there are paired reads with non-
                        primary alignments. Default value: false. Possible
                        values: {true, false}
  --interleave          Will generate an interleaved fastq if paired, each
                        line will have /1 or /2 to describe which end it came
                        from Default value: false. Possible values: {true,
                        false}
  --max_records_in_ram MAX_RECORDS_IN_RAM
                        When writing files that need to be sorted, this will
                        specify the number of records stored in RAM before
                        spilling to disk. Increasing this number reduces the
                        number of file handles needed to sort the file, and
                        increases the amount of RAM needed. Default value:
                        500000.
  --output_dir OUTPUT_DIR
                        Directory in which to output the FASTQ file(s). Used
                        only when OUTPUT_PER_RG is true. Default value: null.
                        Cannot be used in conjunction with argument(s) FASTQ
                        (F).
  --create_md5_file     Whether to create an MD5 digest for any BAM or FASTQ
                        files created. Default value: false. Possible values:
                        {true, false}.
  --output_per_rg       Output a FASTQ file per read group (two FASTQ files
                        per read group if the group is paired). Default value:
                        false. Possible values: {true, false} Cannot be used
                        in conjunction with argument(s) FASTQ (F)
                        SECOND_END_FASTQ (F2) UNPAIRED_FASTQ (FU)
  --quality QUALITY     End-trim reads using the phred/bwa quality trimming
                        algorithm and this quality. Default value: null.
  --re_reverse          Re-reverse bases and qualities of reads with negative
                        strand flag set before writing them to FASTQ Default
                        value: true. Possible values: {true, false}
  --read1_max_bases_to_write READ1_MAX_BASES_TO_WRITE
                        The maximum number of bases to write from read 1 after
                        trimming. If there are fewer than this many bases left
                        after trimming, all will be written. If this value is
                        null then all bases left after trimming will be
                        written. Default value: null.
  --read1_trim READ1_TRIM
                        The number of bases to trim from the beginning of read
                        1. Default value: 0.
  --read2_max_bases_to_write READ2_MAX_BASES_TO_WRITE
                        The maximum number of bases to write from read 2 after
                        trimming. If there are fewer than this many bases left
                        after trimming, all will be written. If this value is
                        null then all bases left after trimming will be
                        written. Default value: null.
  --read2_trim READ2_TRIM
                        The number of bases to trim from the beginning of read
                        2. Default value: 0.
  --reference_sequence REFERENCE_SEQUENCE
                        Reference sequence file. Default value: null.
  --rg_tag RG_TAG       The read group tag (PU or ID) to be used to output a
                        FASTQ file per read group. Default value: PU.
  --second_end_fastq SECOND_END_FASTQ
                        Output FASTQ file (if paired, second end of the pair
                        FASTQ). Default value: null. Cannot be used in
                        conjunction with argument(s) OUTPUT_PER_RG (OPRG)
                        COMPRESS_OUTPUTS_PER_RG (GZOPRG)
  --unpaired_fastq UNPAIRED_FASTQ
                        Output FASTQ file for unpaired reads; may only be
                        provided in paired-FASTQ mode Default value: null.
                        Cannot be used in conjunction with argument(s)
                        OUTPUT_PER_RG (OPRG) COMPRESS_OUTPUTS_PER_RG (GZOPRG)
  --validation_stringency VALIDATION_STRINGENCY
                        Validation stringency for all SAM files read by this
                        program. Setting stringency to SILENT can improve
                        performance when processing a BAM file in which
                        variable-length data (read, qualities, tags) do not
                        otherwise need to be decoded. Default value: STRICT.
                        Possible values: {STRICT, LENIENT, SILENT}
```
