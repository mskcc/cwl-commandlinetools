# Vardict v1.8.3 - Single sample mode
To run VarDistJava in single sample mode vardict_workflow_single_sample.cwl should be run. vardict_workflow_single_sample.cwl will run 3 workflows to implement the example command in the original documentations as explained here:
https://github.com/AstraZeneca-NGS/VarDictJava#single-sample-mode



## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| ubuntu base image (alpine) | 3.8 | - |
| vardict | 1.8.3 | [https://github.com/AstraZeneca-NGS/VarDictJava/releases/tag/v1.8.2](https://github.com/AstraZeneca-NGS/VarDictJava/releases/tag/v1.8.2) |
| perl | 5.26.2-r1 | [https://pkgs.alpinelinux.org/package/edge/main/aarch64/perl](https://pkgs.alpinelinux.org/package/edge/main/aarch64/perl) |
| r | 3.5.1 | [https://pkgs.alpinelinux.org/package/edge/community/x86/R](https://pkgs.alpinelinux.org/package/edge/community/x86/R) |

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

#Using Toil-cwl-runner
toil-cwl-runner --singularity vardict_workflow_single_sample.cwl example_inputs.yaml
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
-c C
                The column for chromosome
-f F
                The threshold for allele frequency, default: 0.01 or 1%
--f_1 F_1
                The minimum allele frequency. Used for var2vcf_valid.pl
-g G
                The column for a gene name, or segment annotation
--vcf VCF
                vcf file name given to var2vcf_valid.pl
--bedfile BEDFILE
```
