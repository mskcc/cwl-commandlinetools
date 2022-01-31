# Vardict v1.8.3 - Single sample mode

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| ubuntu base image (alpine) | 3.8 | - |
| vardict | 1.8.3 | [https://github.com/AstraZeneca-NGS/VarDictJava/releases/tag/v1.8.2](https://github.com/AstraZeneca-NGS/VarDictJava/releases/tag/v1.8.2) |


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
> cwltool --singularity --non-strict /path/to/vardict_1.8.3/vardict_workflow_single_sample.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir toil_log
> toil-cwl-runner --singularity --logFile /path/to/toil_log/cwltoil.log  --jobStore /path/to/jobStore --batchSystem lsf --workDir /path/to =toil_log --outdir . --writeLogs /path/to/toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/vardict_1.8.3/vardict_workflow_single_sample.cwl /path/to/inputs.yaml > toil.stdout 2> toil.stderr &
```

### Usage

```bash
> toil-cwl-runner vardict_workflow_single_sample.cwl --help
usage: vardict_workflow_single_sample.cwl [-h]

positional arguments:
  job_order             Job input json file

optional arguments:

-h, --help         show this help message and exit
-E E
                The column for the region end, e.g. gene end
-G G
                The reference fasta. Should be indexed (.fai).
-N N
                The sample name to be used directly.
-S S
                The column for the region start, e.g. gene start
-b B
                The indexed BAM file.
--bedfile BEDFILE
-c C
                The column for chromosome
-f F
                The threshold for allele frequency, default: 0.01 or 1%
--f_1 F_1
-g G
                The column for a gene name, or segment annotation
--vcf VCF

```
