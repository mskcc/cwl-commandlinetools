# CWL and Dockerfile for running vcf2maf v1.6.17

## Version of tools in docker image (/container/Dockerfile)

| Tool	| Version	| Location	|
|---	|---	|---	|
| alpine:3.8 base image  	| 3.8  	|   -	|
| vcf2maf  	| 1.6.17	| https://github.com/mskcc/vcf2maf/archive/v1.6.17.zip	|

## CWL

- CWL specification 1.0
- Use example_inputs.yaml to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner vcf2maf_1.6.17.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster having installed toil version 3.19 and manually modifying [lsf.py](https://github.com/DataBiosphere/toil/blob/releases/3.19.0/src/toil/batchSystems/lsf.py#L170) by removing `type==X86_64 &&` you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/vcf2maf_1.6.17.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir vcf2maf_toil_log
> toil-cwl-runner --singularity --logFile /path/to/vcf2maf_toil_log/cwltoil.log  --jobStore /path/to/vcf2maf_jobStore --batchSystem lsf --workDir /path/to/vcf2maf_toil_log --outdir . --writeLogs /path/to/vcf2maf_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/vcf2maf_1.6.17.cwl /path/to/inputs.yaml > vcf2maf_toil.stdout 2> vcf2maf_toil.stderr &
```

### Usage

```
usage: toil-cwl-runner vcf2maf_1.6.17.cwl [-h]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --any_allele ANY_ALLELE
                        When reporting co-located variants, allow mismatched
                        variant alleles too
  --buffer_size BUFFER_SIZE
                        Number of variants VEP loads at a time; Reduce this
                        for low memory systems
  --cache_version CACHE_VERSION
                        Version of VEP and its cache to use
  --custom_enst CUSTOM_ENST
                        List of custom ENST IDs that override canonical
                        selection
  --maf_center MAF_CENTER
                        Variant calling center to report in MAF
  --max_filter_ac MAX_FILTER_AC
                        Use tag common_variant if the filter-vcf reports a
                        subpopulation AC higher than this
  --min_hom_vaf MIN_HOM_VAF
                        If GT undefined in VCF, minimum allele fraction to
                        call a variant homozygous
  --ncbi_build NCBI_BUILD
                        Genome build of variants in input
  --normal_id NORMAL_ID
                        Matched_Norm_Sample_Barcode to report in the MAF
  --output_maf OUTPUT_MAF
                        Path to output MAF file
  --ref_fasta REF_FASTA
                        Reference FASTA file
  --remap_chain REMAP_CHAIN
                        Chain file to remap variants to a different assembly
                        before running VEP
  --retain_fmt RETAIN_FMT
                        Comma-delimited names of FORMAT fields to retain as
                        extra columns in MAF []
  --retain_info RETAIN_INFO
                        Comma-delimited names of INFO fields to retain as
                        extra columns in MAF
  --species SPECIES     Species of variants in input
  --tumor_id TUMOR_ID   Tumor_Sample_Barcode to report in the MAF
  --vcf_normal_id VCF_NORMAL_ID
                        Matched normal ID used in VCFs genotype columns
  --vcf_tumor_id VCF_TUMOR_ID
                        Tumor sample ID used in VCFs genotype columns
  --vep_data VEP_DATA   VEPs base cache/plugin directory
  --vep_forks VEP_FORKS
                        Number of forked processes to use when running VEP
  --vep_path VEP_PATH   Folder containing variant_effect_predictor.pl or vep
                        binary


```
