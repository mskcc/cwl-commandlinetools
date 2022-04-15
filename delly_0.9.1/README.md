# CWL and Dockerfile for running ABRA2

## Version of tools in docker image (/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| ubuntu  	| 18.04  	|  -	|
| DELLY  	| 0.9.1	|  https://github.com/dellytools/delly	|


## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner delly_0.9.1.cwl example_inputs.yaml
```
**If at MSK, using the JUNO cluster having installed toil-msk version 3.21.1 you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/bwa_mem_0.7.17.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> toil-cwl-runner --singularity --logFile /path/to/bwa_mem_toil.log  --jobStore /path/to/bwa_mem_jobStore --batchSystem lsf --workDir /path/to/bwa_mem_toil_log --outdir . --writeLogs /path/to/bwa_mem_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --disableChaining --maxLogFileSize 20000000000 /path/to/bwa_mem_0.7.17.cwl /path/to/inputs.yaml > bwa_mem_toil.stdout 2> bwa_mem_toil.stderr &
```

### Usage 

```
usage: delly_0.9.1.cwl [-h] [--memory_per_job MEMORY_PER_JOB]
                       [--memory_overhead MEMORY_OVERHEAD]
                       [--number_of_threads NUMBER_OF_THREADS]
                       [--out_file OUT_FILE] --reference_genome
                       REFERENCE_GENOME [--exclude_regions EXCLUDE_REGIONS]
                       [--vcffile VCFFILE] [--svtype SVTYPE]
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
  --out_file OUT_FILE   The name to be used for the output bcf file
  --reference_genome REFERENCE_GENOME
                        reference genome fasta file
  --exclude_regions EXCLUDE_REGIONS
                        file with regions to exclude
  --vcffile VCFFILE     input VCF/BCF file for genotyping
  --svtype SVTYPE       SV type to compute [DEL, INS, DUP, INV, BND, ALL]
``` 
