# BaseRecalibrator v4.1.8.1

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
    > toil-cwl-runner gatk_base_recalibrator_4.1.8.1.cwl example_inputs.yml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict gatk_base_recalibrator_4.1.8.1.cwl inputs.yaml

#Using toil-cwl-runner
> mkdir run_directory
> toil-cwl-runner --singularity --logFile path/to/run_directory/cwltoil.log  --jobStore path/to/jobStore --batchSystem lsf --workDir /path/to/run_directory --outdir /path/to/run_directory --writeLogs /path/to/run_directory --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 gatk_base_recalibrator_4.1.8.1.cwl inputs.yaml > file.stdout 2> file.stderr &
```

## Usage

\`\`\`bash

> toil-cwl-runner gatk\_base\_recalibrator\_4.1.8.1.cwl --help

usage: gatk\_base\_recalibrator\_4.1.8.1.cwl \[-h\] --input INPUT --known\_sites\_1 KNOWN\_SITES\_1 --reference REFERENCE \[--output\_file\_name OUTPUT\_FILE\_NAME\] \[--add\_output\_sam\_program\_record\] \[--add\_output\_vcf\_command\_line\] \[--arguments\_file ARGUMENTS\_FILE\] \[--binary\_tag\_name BINARY\_TAG\_NAME\] \[--bqsr\_baq\_gap\_open\_penalty BQSR\_BAQ\_GAP\_OPEN\_PENALTY\] \[--cloud-index-prefetch-buffer CLOUD\_INDEX\_PREFETCH\_BUFFER\] \[--cloud\_prefetch\_buffer CLOUD\_PREFETCH\_BUFFER\] \[--create\_output\_bam\_index\] \[--create\_output\_bam\_md5\] \[--create\_output\_variant\_index\] \[--create\_output\_variant\_md5\] \[--default\_base\_qualities DEFAULT\_BASE\_QUALITIES\] \[--deletions\_default\_quality DELETIONS\_DEFAULT\_QUALITY\] \[--disable\_bam\_index\_caching\] \[--disable\_read\_filter DISABLE\_READ\_FILTER\] \[--disable\_sequence\_dictionary\_validation\] \[--exclude\_intervals EXCLUDE\_INTERVALS\] \[--gatk\_config\_file GATK\_CONFIG\_FILE\] \[--gcs\_max\_retries GCS\_MAX\_RETRIES\] \[--gcs\_project\_for\_requester\_pays GCS\_PROJECT\_FOR\_REQUESTER\_PAYS\] \[--indels\_context\_size INDELS\_CONTEXT\_SIZE\] \[--insertions\_default\_quality INSERTIONS\_DEFAULT\_QUALITY\] \[--interval\_exclusion\_padding INTERVAL\_EXCLUSION\_PADDING\] \[--interval\_merging\_rule INTERVAL\_MERGING\_RULE\] \[--interval\_padding INTERVAL\_PADDING\] \[--interval\_set\_rule INTERVAL\_SET\_RULE\] \[--intervals INTERVALS\] \[--lenient\] \[--low\_quality\_tail LOW\_QUALITY\_TAIL\] \[--maximum\_cycle\_value MAXIMUM\_CYCLE\_VALUE\] \[--mismatches\_context\_size MISMATCHES\_CONTEXT\_SIZE\] \[--mismatches\_default\_quality MISMATCHES\_DEFAULT\_QUALITY\] \[--preserve\_qscores\_less\_than PRESERVE\_QSCORES\_LESS\_THAN\] \[--quantizing\_levels QUANTIZING\_LEVELS\] \[--QUIET\] \[--read\_filter READ\_FILTER\] \[--read\_index READ\_INDEX\] \[--seconds\_between\_progress\_updates SECONDS\_BETWEEN\_PROGRESS\_UPDATES\] \[--sequence\_dictionary SEQUENCE\_DICTIONARY\] \[--sites\_only\_vcf\_output\] \[--use\_original\_qualities\] \[--number\_of\_threads NUMBER\_OF\_THREADS\] \[--memory\_per\_job MEMORY\_PER\_JOB\] \[--memory\_overhead MEMORY\_OVERHEAD\] \[--known\_sites\_2 KNOWN\_SITES\_2\] \[job\_order\]

positional arguments: job\_order Job input json file

optional arguments: -h, --help show this help message and exit --input INPUT BAM/SAM file containing reads --known\_sites\_1 KNOWN\_SITES\_1 One or more databases of known polymorphic sites used to exclude regions around known polymorphisms from analysis --reference REFERENCE Reference sequence file --output\_file\_name OUTPUT\_FILE\_NAME Output file name. Not Required --add\_output\_sam\_program\_record --add\_output\_vcf\_command\_line --arguments\_file ARGUMENTS\_FILE --binary\_tag\_name BINARY\_TAG\_NAME --bqsr\_baq\_gap\_open\_penalty BQSR\_BAQ\_GAP\_OPEN\_PENALTY --cloud-index-prefetch-buffer CLOUD\_INDEX\_PREFETCH\_BUFFER --cloud\_prefetch\_buffer CLOUD\_PREFETCH\_BUFFER --create\_output\_bam\_index --create\_output\_bam\_md5 --create\_output\_variant\_index --create\_output\_variant\_md5 --default\_base\_qualities DEFAULT\_BASE\_QUALITIES --deletions\_default\_quality DELETIONS\_DEFAULT\_QUALITY --disable\_bam\_index\_caching --disable\_read\_filter DISABLE\_READ\_FILTER --disable\_sequence\_dictionary\_validation --exclude\_intervals EXCLUDE\_INTERVALS --gatk\_config\_file GATK\_CONFIG\_FILE --gcs\_max\_retries GCS\_MAX\_RETRIES --gcs\_project\_for\_requester\_pays GCS\_PROJECT\_FOR\_REQUESTER\_PAYS --indels\_context\_size INDELS\_CONTEXT\_SIZE --insertions\_default\_quality INSERTIONS\_DEFAULT\_QUALITY --interval\_exclusion\_padding INTERVAL\_EXCLUSION\_PADDING --interval\_merging\_rule INTERVAL\_MERGING\_RULE --interval\_padding INTERVAL\_PADDING --interval\_set\_rule INTERVAL\_SET\_RULE --intervals INTERVALS --lenient --low\_quality\_tail LOW\_QUALITY\_TAIL --maximum\_cycle\_value MAXIMUM\_CYCLE\_VALUE --mismatches\_context\_size MISMATCHES\_CONTEXT\_SIZE --mismatches\_default\_quality MISMATCHES\_DEFAULT\_QUALITY --preserve\_qscores\_less\_than PRESERVE\_QSCORES\_LESS\_THAN --quantizing\_levels QUANTIZING\_LEVELS --QUIET --read\_filter READ\_FILTER --read\_index READ\_INDEX --seconds\_between\_progress\_updates SECONDS\_BETWEEN\_PROGRESS\_UPDATES --sequence\_dictionary SEQUENCE\_DICTIONARY --sites\_only\_vcf\_output --use\_original\_qualities --number\_of\_threads NUMBER\_OF\_THREADS --memory\_per\_job MEMORY\_PER\_JOB --memory\_overhead MEMORY\_OVERHEAD --known\_sites\_2 KNOWN\_SITES\_2

