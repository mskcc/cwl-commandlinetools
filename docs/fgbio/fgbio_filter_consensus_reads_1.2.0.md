# FilterConsensusReads v1.2.0

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| fgbio | 1.2.0 | quay.io/biocontainers/fgbio:1.2.0--0 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner fgbio_filter_consensus_reads_1.2.0.cwl example_inputs.yaml
```

## Usage

```bash
usage: fgbio_filter_consensus_reads_1.2.0.cwl [-h]
                                              [--memory_per_job MEMORY_PER_JOB]
                                              [--memory_overhead MEMORY_OVERHEAD]
                                              [--number_of_threads NUMBER_OF_THREADS]
                                              --input INPUT
                                              [--output_file_name OUTPUT_FILE_NAME]
                                              --reference_fasta
                                              REFERENCE_FASTA
                                              [--reverse_per_base_tags]
                                              [--min_reads MIN_READS]
                                              [--max_read_error_rate MAX_READ_ERROR_RATE]
                                              [--max_base_error_rate MAX_BASE_ERROR_RATE]
                                              [--min_base_quality MIN_BASE_QUALITY]
                                              [--max_no_call_fraction MAX_NO_CALL_FRACTION]
                                              [--min_mean_base_quality MIN_MEAN_BASE_QUALITY]
                                              [--require_single_strand_agreement]
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
  --reference_fasta REFERENCE_FASTA
                        Reference fasta file.
  --reverse_per_base_tags
                        Reverse [complement] per base tags on reverse strand
                        reads.
  --min_reads MIN_READS
                        The minimum number of reads supporting a consensus
                        base/read. (Max 3 values)
  --max_read_error_rate MAX_READ_ERROR_RATE
                        The maximum raw-read error rate across the entire
                        consensus read. (Max 3 values)
  --max_base_error_rate MAX_BASE_ERROR_RATE
                        The maximum error rate for a single consensus base.
                        (Max 3 values)
  --min_base_quality MIN_BASE_QUALITY
                        Mask (make N) consensus bases with quality less than
                        this threshold.
  --max_no_call_fraction MAX_NO_CALL_FRACTION
                        Maximum fraction of no-calls in the read after
                        filtering
  --min_mean_base_quality MIN_MEAN_BASE_QUALITY
                        The minimum mean base quality across the consensus
                        read
  --require_single_strand_agreement
                        Mask (make N) consensus bases where the AB and BA
                        consensus reads disagree (for duplex-sequencing only).
```

