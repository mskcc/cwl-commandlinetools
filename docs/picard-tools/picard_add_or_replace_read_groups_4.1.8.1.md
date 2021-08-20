# AddOrReplaceReadGroups v4.1.8.1

## Version of tools in docker image

| Tool | Version | Location |
| :--- | :--- | :--- |
| gatk | 4.1.8.1 | broadinstitute/gatk:4.1.8.1 |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner picard_add_or_replace_read_groups_4.1.8.1.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/picard_add_or_replace_read_groups_4.1.8.1/picard_add_or_replace_read_groups_4.1.8.1.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir picardAddOrReplaceReadGroup_toil_log
> toil-cwl-runner --singularity --logFile /path/to/picardAddOrReplaceReadGroup_toil_log/cwltoil.log  --jobStore /path/to/picardAddOrReplaceReadGroup_jobStore --batchSystem lsf --workDir /path/to picardAddOrReplaceReadGroup_toil_log --outdir . --writeLogs /path/to/picardAddOrReplaceReadGroup_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/picard_add_or_replace_read_groups_4.1.8.1/picard_add_or_replace_read_groups_4.1.8.1.cwl /path/to/inputs.yaml > picardAddOrReplaceReadGroup_toil.stdout 2> picardAddOrReplaceReadGroup_toil.stderr &
```

### Usage

```bash
> toil-cwl-runner picard_add_or_replace_read_groups_4.1.8.1.cwl --help
usage: picard_add_or_replace_read_groups_4.1.8.1.cwl

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --input INPUT         Input file ( sam). Required.
  --output_file_name OUTPUT_FILE_NAME
                        Output file name (bam or sam). Not Required
  --sort_order SORT_ORDER
                        Optional sort order to output in. If not supplied
                        OUTPUT is in the same order as INPUT.Default value:
                        null. Possible values: {unsorted, queryname,
                        coordinate}
  --read_group_identifier READ_GROUP_IDENTIFIER
                        Read Group ID Default value: 1. This option can be set
                        to 'null' to clear the default value Required
  --read_group_sequencing_center READ_GROUP_SEQUENCING_CENTER
                        Read Group sequencing center name Default value: null.
                        Required
  --read_group_library READ_GROUP_LIBRARY
                        Read Group Library. Required
  --read_group_platform_unit READ_GROUP_PLATFORM_UNIT
                        Read Group platform unit (eg. run barcode) Required.
  --read_group_sample_name READ_GROUP_SAMPLE_NAME
                        Read Group sample name. Required
  --read_group_sequencing_platform READ_GROUP_SEQUENCING_PLATFORM
                        Read Group platform (e.g. illumina, solid) Required.
  --read_group_description READ_GROUP_DESCRIPTION
                        Read Group description Default value: null.
  --read_group_run_date READ_GROUP_RUN_DATE
                        Read Group run date Default value: null.
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
  --use_jdk_deflater    Use the JDK Deflater instead of the Intel Deflater for
                        writing compressed output
  --use_jdk_inflater    Whether to create a BAM index when writing a
                        coordinate-sorted BAM file. Default value:false. This
                        option can be set to 'null' to clear the default
                        value. Possible values:{true, false}
  --create_bam_index    Whether to create a BAM index when writing a
                        coordinate-sorted BAM file. Default value:false. This
                        option can be set to 'null' to clear the default
                        value. Possible values:{true, false}
```

