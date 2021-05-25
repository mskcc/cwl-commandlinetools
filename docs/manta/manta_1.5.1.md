# Manta v1.5.1

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| ubuntu base image | 16.04 | - |
| manta | 1.5.1 | [https://github.com/Illumina/manta/releases/download/](https://github.com/Illumina/manta/releases/download/) |
| samtools | 1.9 | [https://github.com/samtools/samtools/releases/download/](https://github.com/samtools/samtools/releases/download/) |
| htslib | 1.9 | "[https://github.com/samtools/htslib/releases/download/](https://github.com/samtools/htslib/releases/download/) |

[![](https://images.microbadger.com/badges/image/mskaccess/manta:0.0.2.svg)](https://microbadger.com/images/mskaccess/manta:0.0.2)[![](https://images.microbadger.com/badges/version/mskaccess/manta:0.0.2.svg)](https://microbadger.com/images/mskaccess/manta:0.0.2) [![](https://images.microbadger.com/badges/commit/mskaccess/manta:0.0.2.svg)](https://microbadger.com/images/mskaccess/manta:0.0.2) [![](https://images.microbadger.com/badges/license/mskaccess/manta:0.0.2.svg)](https://microbadger.com/images/mskaccess/manta:0.0.2)

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner manta_1.5.1.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/manta_1.5.1/manta_1.51.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir toil_log
> toil-cwl-runner --singularity --logFile /path/to/toil_log/cwltoil.log  --jobStore /path/to/jobStore --batchSystem lsf --workDir /path/to =toil_log --outdir . --writeLogs /path/to/toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/manta_1.5.1/manta.1.5.1.cwl /path/to/inputs.yaml > toil.stdout 2> toil.stderr &
```

### Usage

```bash
> toil-cwl-runner manta_1.5.1.cwl --help
usage: manta_1.5.1.cwl [-h]

positional arguments:
  job_order             Job input json file

optional arguments:
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

