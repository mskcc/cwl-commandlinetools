# FastqToBam v1.2.0

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| fgbio | 1.2.0 | quay.io/biocontainers/fgbio:1.2.0--0 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner fgbio_fastq_to_bam_1.2.0.cwl example_inputs.yaml
```

## Usage

```bash
usage: fgbio_fastq_to_bam_1.2.0.cwl [-h] [--memory_per_job MEMORY_PER_JOB]
                                    [--memory_overhead MEMORY_OVERHEAD]
                                    [--number_of_threads NUMBER_OF_THREADS]
                                    --input INPUT
                                    [--output_file_name OUTPUT_FILE_NAME]
                                    [--read-structures READ_STRUCTURES]
                                    [--sort] [--umi-tag UMI_TAG]
                                    [--read-group-id READ_GROUP_ID]
                                    [--sample SAMPLE] [--library LIBRARY]
                                    [--platform PLATFORM]
                                    [--platform-unit PLATFORM_UNIT]
                                    [--platform-model PLATFORM_MODEL]
                                    [--sequencing-center SEQUENCING_CENTER]
                                    [--predicted-insert-size PREDICTED_INSERT_SIZE]
                                    [--description DESCRIPTION]
                                    [--comment COMMENT] [--run-date RUN_DATE]
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
  --input INPUT         Fastq files corresponding to each sequencing read
                        (e.g. R1, I1, etc.).
  --output_file_name OUTPUT_FILE_NAME
                        The output SAM or BAM file to be written.
  --read-structures READ_STRUCTURES
                        Read structures, one for each of the FASTQs.
                        https://github.com/fulcrumgenomics/fgbio/wiki/Read-
                        Structures
  --sort                If true, queryname sort the BAM file, otherwise
                        preserve input order.
  --umi-tag UMI_TAG     Tag in which to store molecular barcodes/UMIs
  --read-group-id READ_GROUP_ID
                        Read group ID to use in the file header.
  --sample SAMPLE       The name of the sequenced sample.
  --library LIBRARY     The name/ID of the sequenced library.
  --platform PLATFORM   Sequencing Platform
  --platform-unit PLATFORM_UNIT
                        Platform unit (e.g. ‘..')
  --platform-model PLATFORM_MODEL
                        Platform model to insert into the group header (ex.
                        miseq, hiseq2500, hiseqX)
  --sequencing-center SEQUENCING_CENTER
                        The sequencing center from which the data originated
  --predicted-insert-size PREDICTED_INSERT_SIZE
                        Predicted median insert size, to insert into the read
                        group header
  --description DESCRIPTION
                        Description of the read group.
  --comment COMMENT     Comment(s) to include in the output file’s header
  --run-date RUN_DATE   Date the run was produced, to insert into the read
                        group header
```

