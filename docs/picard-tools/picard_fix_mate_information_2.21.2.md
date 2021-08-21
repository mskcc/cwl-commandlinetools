# FixMateInformation v2.21.2

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| picard | 2.21.2 | [https://github.com/broadinstitute/picard/releases/download/2.21.2/picard.jar](https://github.com/broadinstitute/picard/releases/download/2.21.2/picard.jar) |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner picard_fix_mate_information_2.21.2.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/picard_fix_mate_information_1.96/picard_fix_mate_information_2.21.2.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir picardFixMate_toil_log
> toil-cwl-runner --singularity --logFile /path/to/picardFixMate_toil_log/cwltoil.log  --jobStore /path/to/picardFixMate_jobStore --batchSystem lsf --workDir /path/to picardFixMate_toil_log --outdir . --writeLogs /path/to/picardFixMate_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/picard_fix_mate_information_2.21.2/picard_fix_mate_information_2.21.2.cwl /path/to/inputs.yaml > picardFixMate_toil.stdout 2> picardFixMate_toil.stderr &
```

### Usage

```text
usage: picard_fix_mate_information_2.21.2.cwl [-h]

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
```

