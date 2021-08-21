# CWL and Dockerfile for running BWA MEM

## Version of tools in docker image (/container/Dockerfile)

| Tool   | Version | Location                                        |
| ------ | ------- | ----------------------------------------------- |
| ubuntu | 16.04   | -                                               |
| GetBaseCountMultiSample    | 1.2.5  | https://github.com/msk-access/GetBaseCountMultiSample/releases/tag/1.2.5 |


## CWL

-   CWL specification 1.0
-   Use example_inputs.yaml to see the inputs to the cwl
-   Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner getbasecountmultisample_1.2.5.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster having installed toil-msk version 3.21.1 you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/getbasecountmultisample_1.2.5.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> toil-cwl-runner --singularity --logFile /path/to/gbcms_toil.log  --jobStore /path/to/gbcms_jobStore --batchSystem lsf --workDir /path/to/gbcms_toil_log --outdir . --writeLogs /path/to/gbcms_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --disableChaining --maxLogFileSize 20000000000 /path/to/getbasecountmultisample_1.2.5.cwl /path/to/inputs.yaml > gbcms_toil.stdout 2> gbcms_toil.stderr &
```

### Usage

```
usage: getbasecountsmultisample_1.2.5.cwl [-h]
                                          [--memory_per_job MEMORY_PER_JOB]
                                          [--memory_overhead MEMORY_OVERHEAD]
                                          [--number_of_threads NUMBER_OF_THREADS]
                                          --genotyping_bams GENOTYPING_BAMS
                                          --genotyping_bams_ids
                                          GENOTYPING_BAMS_IDS
                                          --filter_duplicate FILTER_DUPLICATE
                                          --fragment_count FRAGMENT_COUNT
                                          --maf MAF [--maq MAQ] [--omaf]
                                          --output OUTPUT --ref_fasta
                                          REF_FASTA [--vcf VCF]
                                          [--generic_counting GENERIC_COUNTING]
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
  --genotyping_bams GENOTYPING_BAMS
                        Input bam file
  --genotyping_bams_ids GENOTYPING_BAMS_IDS
                        Input bam, sample identifier to be used for "Tumor
                        Sample Barcode" for maf or Sample name in the header
                        for vcf
  --filter_duplicate FILTER_DUPLICATE
                        Whether to filter reads that are marked as duplicate.
                        0=off, 1=on. Default 1
  --fragment_count FRAGMENT_COUNT
                        Whether to output fragment read counts DPF/RDF/ADF.
                        0=off, 1=on. Default 0
  --maf MAF             Input variant file in TCGA maf format. --maf or --vcf
                        need to be specified at least once. But --maf and
                        --vcf are mutually exclusive
  --maq MAQ             Mapping quality threshold. Default 20
  --omaf                Output the result in maf format
  --output OUTPUT       Filename for output of raw fillout data in MAF/VCF
                        format
  --ref_fasta REF_FASTA
                        Input reference sequence file
  --vcf VCF             Input variant file in vcf-like format(the first 5
                        columns are used). --maf or --vcf need to be specified
                        at least once. But --maf and --vcf are mutually
                        exclusive
  --generic_counting GENERIC_COUNTING
                        se the newly implemented generic counting algorithm.
                        Works better for complex variants. You may get
                        different allele count result from the default
                        counting algorithm
```
