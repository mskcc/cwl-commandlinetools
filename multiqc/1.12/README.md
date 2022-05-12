# CWL and Dockerfile for running merge_fastq

## Version of tools in docker image (/container/Dockerfile)

| Tool | Version | Location |
|--- |--- |--- |
| multiqc   | 1.12  |  <https://github.com/msk-access/MultiQC/> |


## Multiqc v1.12 supports Mosdepth
[Mosdepth](https://github.com/brentp/mosdepth/) performs fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing.

The MultiQC module plots coverage distributions from 2 kinds of outputs:

- `{prefix}.mosdepth.region.dist.txt`
- `{prefix}.mosdepth.global.dist.txt`

Using "region" if exists, otherwise "global". Plotting 3 figures:

- Proportion of bases in the reference genome with, at least, a given depth of coverage (cumulative coverage distribution).
- Proportion of bases in the reference genome with a given depth of coverage (absolute coverage distribution).
- Average coverage per contig/chromosome.

Also plotting the percentage of the genome covered at a threshold in the General Stats section.
The default thresholds are 1, 5, 10, 30, 50, which can be customised in the config as follows:

```yaml
mosdepth_config:
  general_stats_coverage:
    - 10
    - 20
    - 40
    - 200
    - 30000
```

You can also specify which columns would be hidden when the report loads (by default, all values are hidden except 30X):

```yaml
general_stats_coverage_hidden:
  - 10
  - 20
  - 200
```

For the per-contig coverage plot, you can include and exclude contigs based on name or pattern.

For example, you could add the following to your MultiQC config file:

```yaml
mosdepth_config:
  include_contigs:
    - "chr*"
  exclude_contigs:
    - "*_alt"
    - "*_decoy"
    - "*_random"
    - "chrUn*"
    - "HLA*"
    - "chrM"
    - "chrEBV"
```

## CWL

- CWL specification 1.0
- Use example_inputs.json to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner multiqc.cwl example_inputs.json
```

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/multiqc_1.10.1/multiqc.cwl /path/to/example_inputs.json

#Using toil-cwl-runner
> mkdir tool_toil_log
> toil-cwl-runner --singularity --logFile /path/to/tool_toil_log/cwltoil.log  --jobStore /path/to/tool_jobStore --batchSystem lsf --workDir /path/to/tool_toil_log --outdir . --writeLogs /path/to/tool_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/multiqc_1.12/multiqc_1.12.cwl /path/to/example_inputs.json > tool_toil.stdout 2> tool_toil.stderr &
```

### Usage

```bash

```

