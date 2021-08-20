# ApplyBQSR v4.1.8.1

## Version of tools in [docker image ](https://hub.docker.com/r/broadinstitute/gatk)

| Tool | Version | Location |
| :--- | :--- | :--- |
| GATK | 4.1.8.1 | [https://github.com/broadinstitute/gatk/releases/tag/4.1.8.1](https://github.com/broadinstitute/gatk/releases/tag/4.1.8.1) |

[![](https://img.shields.io/badge/version-4.1.8.1-blue)](https://github.com/broadinstitute/gatk/releases/tag/4.1.8.1)

## CWL

* CWL specification 1.0
* Use example\_inputs.yml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner gatk_apply_bqsr_4.1.8.1.cwl example_inputs.yml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict gatk_apply_bqsr_4.1.8.1.cwl inputs.yaml

#Using toil-cwl-runner
> mkdir run_directory
> toil-cwl-runner --singularity --logFile path/to/run_directory/cwltoil.log  --jobStore path/to/jobStore --batchSystem lsf --workDir /path/to/run_directory --outdir /path/to/run_directory --writeLogs /path/to/run_directory --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 gatk_apply_bqsr_4.1.8.1.cwl inputs.yaml > file.stdout 2> file.stderr &
```

## Usage

\`\`\`bash

> toil-cwl-runner gatk\_apply\_bqsr\_4.1.8.1.cwl --help

usage: gatk\_apply\_bqsr\_4.1.8.1.cwl \[-h\] --reference REFERENCE \[--create\_output\_bam\_index\] --bqsr\_recal\_file BQSR\_RECAL\_FILE --input INPUT \[--output\_file\_name OUTPUT\_FILE\_NAME\] \[--add\_output\_sam\_program\_record\] \[--add\_output\_vcf\_command\_line\] \[--arguments\_file ARGUMENTS\_FILE\] \[--cloud\_index\_prefetch\_buffer CLOUD\_INDEX\_PREFETCH\_BUFFER\] \[--cloud\_prefetch\_buffer CLOUD\_PREFETCH\_BUFFER\] \[--create\_output\_bam\_md5\] \[--create\_output\_variant\_index\] \[--create\_output\_variant\_md5\] \[--disable\_bam\_index\_caching\] \[--disable\_read\_filter DISABLE\_READ\_FILTER\] \[--disable\_sequence\_dictionary\_validation\] \[--emit\_original\_quals\] \[--exclude\_intervals EXCLUDE\_INTERVALS\] \[--gatk\_config\_file GATK\_CONFIG\_FILE\] \[--gcs\_max\_retries GCS\_MAX\_RETRIES\] \[--gcs\_project\_for\_requester\_pays GCS\_PROJECT\_FOR\_REQUESTER\_PAYS\] \[--global\_qscore\_prior GLOBAL\_QSCORE\_PRIOR\] \[--interval\_exclusion\_padding INTERVAL\_EXCLUSION\_PADDING\] \[--interval\_merging\_rule INTERVAL\_MERGING\_RULE\] \[--interval\_padding INTERVAL\_PADDING\] \[--interval\_set\_rule INTERVAL\_SET\_RULE\] \[--intervals INTERVALS\] \[--lenient\] \[--preserve\_qscores\_less\_than PRESERVE\_QSCORES\_LESS\_THAN\] \[--quantize\_quals QUANTIZE\_QUALS\] \[--quiet\] \[--read\_filter READ\_FILTER\] \[--read\_index READ\_INDEX\] \[--read\_validation\_stringency READ\_VALIDATION\_STRINGENCY\] \[--seconds\_between\_progress\_updates SECONDS\_BETWEEN\_PROGRESS\_UPDATES\] \[--sequence\_dictionary SEQUENCE\_DICTIONARY\] \[--sites\_only\_vcf\_output\] \[--use\_jdk\_deflater\] \[--use\_jdk\_inflater\] \[--use\_original\_qualities\] \[--memory\_overhead MEMORY\_OVERHEAD\] \[--memory\_per\_job MEMORY\_PER\_JOB\] \[--number\_of\_threads NUMBER\_OF\_THREADS\] \[job\_order\]

positional arguments: job\_order Job input json file

optional arguments: -h, --help show this help message and exit --reference REFERENCE Reference sequence --create\_output\_bam\_index --bqsr\_recal\_file BQSR\_RECAL\_FILE Input recalibration table for BQSR. Only run ApplyBQSR with the covariates table created from the input BAM --input INPUT A BAM file containing input read data --output\_file\_name OUTPUT\_FILE\_NAME Output file name. Not Required --add\_output\_sam\_program\_record --add\_output\_vcf\_command\_line --arguments\_file ARGUMENTS\_FILE --cloud\_index\_prefetch\_buffer CLOUD\_INDEX\_PREFETCH\_BUFFER --cloud\_prefetch\_buffer CLOUD\_PREFETCH\_BUFFER --create\_output\_bam\_md5 --create\_output\_variant\_index --create\_output\_variant\_md5 --disable\_bam\_index\_caching --disable\_read\_filter DISABLE\_READ\_FILTER --disable\_sequence\_dictionary\_validation --emit\_original\_quals --exclude\_intervals EXCLUDE\_INTERVALS --gatk\_config\_file GATK\_CONFIG\_FILE --gcs\_max\_retries GCS\_MAX\_RETRIES --gcs\_project\_for\_requester\_pays GCS\_PROJECT\_FOR\_REQUESTER\_PAYS --global\_qscore\_prior GLOBAL\_QSCORE\_PRIOR --interval\_exclusion\_padding INTERVAL\_EXCLUSION\_PADDING --interval\_merging\_rule INTERVAL\_MERGING\_RULE --interval\_padding INTERVAL\_PADDING --interval\_set\_rule INTERVAL\_SET\_RULE --intervals INTERVALS --lenient --preserve\_qscores\_less\_than PRESERVE\_QSCORES\_LESS\_THAN --quantize\_quals QUANTIZE\_QUALS --quiet --read\_filter READ\_FILTER --read\_index READ\_INDEX --read\_validation\_stringency READ\_VALIDATION\_STRINGENCY --seconds\_between\_progress\_updates SECONDS\_BETWEEN\_PROGRESS\_UPDATES --sequence\_dictionary SEQUENCE\_DICTIONARY --sites\_only\_vcf\_output --use\_jdk\_deflater --use\_jdk\_inflater --use\_original\_qualities --memory\_overhead MEMORY\_OVERHEAD --memory\_per\_job MEMORY\_PER\_JOB --number\_of\_threads NUMBER\_OF\_THREADS

