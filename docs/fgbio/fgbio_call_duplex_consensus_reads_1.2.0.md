# CallDuplexConsensusReads v1.2.0

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| fgbio | 1.2.0 | quay.io/biocontainers/fgbio:1.2.0--0 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner fgbio_call_duplex_consensus_reads_1.2.0.cwl example_inputs.yaml
```

## Usage

```bash
usage: fgbio_call_duplex_consensus_reads_1.2.0.cwl [-h]
                                                   [--memory_per_job MEMORY_PER_JOB]
                                                   [--memory_overhead MEMORY_OVERHEAD]
                                                   [--number_of_threads NUMBER_OF_THREADS]
                                                   --input INPUT
                                                   [--output_file_name OUTPUT_FILE_NAME]
                                                   [--read_name_prefix READ_NAME_PREFIX]
                                                   [--read_group_id READ_GROUP_ID]
                                                   [--error_rate_pre_umi ERROR_RATE_PRE_UMI]
                                                   [--error_rate_post_umi ERROR_RATE_POST_UMI]
                                                   [--min_input_base_quality MIN_INPUT_BASE_QUALITY]
                                                   [--trim]
                                                   [--sort_order SORT_ORDER]
                                                   [--min_reads MIN_READS]
                                                   [--max_reads_per_strand MAX_READS_PER_STRAND]
                                                   [--threads THREADS]
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
  --input INPUT         The input SAM or BAM file.
  --output_file_name OUTPUT_FILE_NAME
                        Output SAM or BAM file to write consensus reads.
  --read_name_prefix READ_NAME_PREFIX
                        The prefix all consensus read names
  --read_group_id READ_GROUP_ID
                        The new read group ID for all the consensus reads.
  --error_rate_pre_umi ERROR_RATE_PRE_UMI
                        The Phred-scaled error rate for an error prior to the
                        UMIs being integrated.
  --error_rate_post_umi ERROR_RATE_POST_UMI
                        The Phred-scaled error rate for an error post the UMIs
                        have been integrated.
  --min_input_base_quality MIN_INPUT_BASE_QUALITY
                        Ignore bases in raw reads that have Q below this
                        value.
  --trim                If true, quality trim input reads in addition to
                        masking low Q bases
  --sort_order SORT_ORDER
                        The sort order of the output, if :none: then the same
                        as the input.
  --min_reads MIN_READS
                        The minimum number of input reads to a consensus read.
  --max_reads_per_strand MAX_READS_PER_STRAND
                        The maximum number of reads to use when building a
                        single-strand consensus. If more than this many reads
                        are present in a tag family, the family is randomly
                        downsampled to exactly max-reads reads.
```

