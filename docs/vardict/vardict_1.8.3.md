# Vardict v1.8.3

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| ubuntu base image (alpine) | 3.8 | - |
| vardict | 1.8.3 | [https://github.com/AstraZeneca-NGS/VarDictJava/releases/tag/v1.8.2](https://github.com/AstraZeneca-NGS/VarDictJava/releases/tag/v1.8.2) |
|

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner vardict_workflow_single_sample.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/manta_1.5.1/vardict_workflow_single_sample.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir toil_log
> toil-cwl-runner --singularity --logFile /path/to/toil_log/cwltoil.log  --jobStore /path/to/jobStore --batchSystem lsf --workDir /path/to =toil_log --outdir . --writeLogs /path/to/toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/manta_1.5.1/vardict_workflow_single_sample.cwl /path/to/inputs.yaml > toil.stdout 2> toil.stderr &
```

### Usage

```bash
> toil-cwl-runner vardict_workflow_single_sample.cwl --help
usage: manta_1.5.1.cwl [-h]

positional arguments:
  job_order             Job input json file

optional arguments:

-h, --help         show this help message and exit
-E E
-G G
-N N
-S S
-b B
--bedfile BEDFILE
-c C
-f F
--f_1 F_1
-g G
--vcf VCF









  -h, --help            show this help message and exit
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --call_regions CALL_REGIONS
                        bgzip-compressed, tabix-indexed BED file specifiying
                        regions to which variant analysis will be restricted
  --non_wgs             toggles on settings for WES
  --normal_bam NORMAL_BAM
                        Normal sample BAM or CRAM file. May be specified more
                        than once, multiple inputs will be treated as each BAM
                        file representing a different sample. [optional] (no
                        default)
  --output_contigs      if true, outputs assembled contig sequences in final
                        VCF files, in the INFO field CONTIG
  --reference_fasta REFERENCE_FASTA
                        samtools-indexed reference fasta file [required]
  --tumor_bam TUMOR_BAM
                        Tumor sample BAM or CRAM file. Only up to one tumor
                        bam file accepted.
  --generateEvidenceBam
                        Generate a bam of supporting reads for all SVs
```
