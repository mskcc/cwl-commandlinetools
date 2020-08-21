# CWL and Dockerfile for running Picard - FixMateInformation

## Version of tools in docker image (./container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| java base image  	| 8 	|   -	|
| picard  	| 2.9.0  	|  https://github.com/broadinstitute/picard/releases/download/2.9.0/picard.jar	|
| R 	| 3.3.3	|  r-base for openjdk:8	|

[![](https://images.microbadger.com/badges/image/mskaccess/picard_2.9.0.svg)](https://microbadger.com/images/mskaccess/picard_2.9.0 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/mskaccess/picard_2.9.0.svg)](https://microbadger.com/images/mskaccess/picard_2.9.0 "Get your own version badge on microbadger.com")

## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner picard_fix_mate_information_2.9.0.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster having installed toil-msk version 3.21.1 you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/picard_fix_mate_information_2.9.0.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> toil-cwl-runner --singularity --logFile /path/to/picardFixMate_jobStore.log  --jobStore /path/to/picardFixMate_jobStore --batchSystem lsf --workDir /path/to picardFixMate_toil_log --outdir . --writeLogs /path/to/picardFixMate_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --disableChaining --maxLogFileSize 20000000000 /path/to/picard_fix_mate_information_2.9.0/picard_fix_mate_information_2.9.0.cwl /path/to/inputs.yaml > picardFixMate_toil.stdout 2> picardFixMate_toil.stderr &
```

### Usage

```
usage: picard_fix_mate_information_2.9.0/picard_fix_mate_information_2.9.0.cwl
       [-h] [--memory_per_job MEMORY_PER_JOB]
       [--memory_overhead MEMORY_OVERHEAD]
       [--number_of_threads NUMBER_OF_THREADS] --input INPUT
       [--output_file_name OUTPUT_FILE_NAME] [--sort_order SORT_ORDER]
       [--validation_stringency VALIDATION_STRINGENCY]
       [--bam_compression_level BAM_COMPRESSION_LEVEL] [--create_bam_index]
       [--temporary_directory TEMPORARY_DIRECTORY]
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
  --input INPUT         The input file to fix. This option may be specified 0
                        or more times
  --output_file_name OUTPUT_FILE_NAME
                        Output file name (bam or sam). Not Required
  --sort_order SORT_ORDER
                        Optional sort order to output in. If not supplied
                        OUTPUT is in the same order as INPUT.Default value:
                        null. Possible values: {unsorted, queryname,
                        coordinate}
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
  --temporary_directory TEMPORARY_DIRECTORY
                        Default value: null. This option may be specified 0 or
                        more times.
```
