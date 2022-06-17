# coverage_report_single_1.4.2  

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| python:8 base image | 8 | - |
| Athena | 1.4.2 | https://github.com/msk-access/athena/archive/refs/tags/1.4.2.zip |


## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner coverage_report_single.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/coverage_report_single.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir coverage_report_single_toil_log
> toil-cwl-runner --singularity --logFile /path/to/coverage_report_single_toil_log/cwltoil.log  --jobStore /path/to/coverage_report_single_jobStore --batchSystem lsf --workDir /path/to/coverage_report_single_toil_log --outdir . --writeLogs /path/to/coverage_report_single_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/coverage_report_single.cwl /path/to/inputs.yaml > coverage_report_single_toil.stdout 2> coverage_report_single_toil.stderr &
```

## Usage

The coverage_report_single.py script generates the full HTML report. It requires several files as input (some optional):

```
-e / --exon_stats: per exon statistics file (from `coverage_stats_single.py`)
-g / --gene_stats: per gene statistics file (from `coverage_stats_single.py`)
-r / --raw_coverage: annotated bed file with coverage data (generated from annotate_bed.sh / bedtools intersect)
-b / --per_base_coverage: Per-base coverage bed file from mosdepth. (Optional; if not submitted, plots displaying global coverage per chromosome will not be displayed)
-s / --snps: VCF(s) of known SNPs to check coverage of (optional; i.e. HGMD, ClinVar)
-t / --threshold: threshold value defining sub-optimal coverage (optional; default if not given: 20)
-n / --sample_name: name for title of report (optional; gene_stats file name will be used if not given)
-o / --output: name for output report (optional; sample name will be used if not given)
-p / --panel: panel bed file used for initial annotation, name will be displayed in summary of report (optional)
-l / --limit: number of genes at which to limit including full gene plots, large numbers of genes may take a long time to generate the plots (optional)
-m / --summary: boolean flag to add clinical report summary text in summary section, includes list of all genes with transcripts (optional; default False)
--cores: Number of CPU cores to utilise, for larger numbers of genes this will drastically reduce run time. If not given will use maximum available
```

Example usage:

```
$ python3 bin/coverage_report_single.py --gene_stats output/sample1-exon-coverage_gene_stats.tsv --exon_stats output/sample1-exon-coverage_exon_stats.tsv --raw_coverage sample1_gene_exon_coverage.bed -t 30 -n sample1
```

Example including coverage per chromosome:

```
$ python3 bin/coverage_report_single.py --gene_stats output/sample1-exon-coverage_gene_stats.tsv --exon_stats output/sample1-exon-coverage_exon_stats.tsv --raw_coverage sample1_gene_exon_coverage.bed --per_base_coverage sample_1.per-base.bed.gz -t 30 -n sample1
```