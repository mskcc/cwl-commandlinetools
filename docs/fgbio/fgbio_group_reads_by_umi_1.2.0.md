# GroupReadsByUmi v1.2.0

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| fgbio | 1.2.0 | quay.io/biocontainers/fgbio:1.2.0--0 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner fgbio_group_reads_by_umi_1.2.0.cwl example_inputs.yaml
```

## Usage

```bash
usage: fgbio_group_reads_by_umi_1.2.0.cwl [-h]
                                          [--memory_per_job MEMORY_PER_JOB]
                                          [--memory_overhead MEMORY_OVERHEAD]
                                          [--number_of_threads NUMBER_OF_THREADS]
                                          --input INPUT
                                          [--output_file_name OUTPUT_FILE_NAME]
                                          [--family_size_histogram FAMILY_SIZE_HISTOGRAM]
                                          [--raw_tag RAW_TAG]
                                          [--assign_tag ASSIGN_TAG]
                                          [--min_map_q MIN_MAP_Q]
                                          [--include_non_pf_reads]
                                          --strategy STRATEGY
                                          [--edits EDITS]
                                          [--min_umi_length MIN_UMI_LENGTH]
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
  --input INPUT         The input BAM file.
  --output_file_name OUTPUT_FILE_NAME
                        The output SAM or BAM file to be written.
  --family_size_histogram FAMILY_SIZE_HISTOGRAM
                        Optional output of tag family size counts.
  --raw_tag RAW_TAG     The tag containing the raw UMI.
  --assign_tag ASSIGN_TAG
                        The output tag for UMI grouping.
  --min_map_q MIN_MAP_Q
                        Minimum mapping quality.
  --include_non_pf_reads
  --strategy STRATEGY   The UMI assignment strategy.
                        (identity,edit,adjacency,paired)
  --edits EDITS         The allowable number of edits between UMIs.
  --min_umi_length MIN_UMI_LENGTH
                        The minimum UMI length. If not specified then all UMIs
                        must have the same length, otherwise discard reads
                        with UMIs shorter than this length and allow for
                        differing UMI lengths.
```

