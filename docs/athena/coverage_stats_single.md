# coverage_stats_single_1.4.2  

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
    > toil-cwl-runner coverage_stats_single.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/coverage_stats_single.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir coverage_stats_single_toil_log
> toil-cwl-runner --singularity --logFile /path/to/coverage_stats_single_toil_log/cwltoil.log  --jobStore /path/to/coverage_stats_single_jobStore --batchSystem lsf --workDir /path/to/coverage_stats_single_toil_log --outdir . --writeLogs /path/to/coverage_stats_single_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/coverage_stats_single.cwl /path/to/inputs.yaml > coverage_stats_single_toil.stdout 2> coverage_stats_single_toil.stderr &
```

## Usage

The coverage_stats_single.py script generates both a tsv of per per exon and per gene coverage statistics. This gives a minimum, mean and maxmimum coverage for each region, along with coverage at defined thresholds.

Expected inputs:
```
--file: annotated bed file on which to generate report from
--build: text file with build number used for alignment, output from mosdepth (optional)
--outfile: output file name prefix, if not given the input file name will be used as the name prefix
--thresholds: threshold values to calculate coverage for as comma seperated integers (default: 10, 20, 30, 50, 100)
--flagstat: flagstat file for sample, required for generating run statistics (in development)
--cores: Number of CPU cores to utilise, for larger numbers of genes this will drastically reduce run time. If not given will use maximum available
```
Example usage:
```
$ python3 bin/coverage_stats_single.py  --file annotated_bed_file --build {sample}_reference_build.txt --thresholds 20, 40, 60, 80 --outfile example_sample
Example output files are given in /data/example/
``
