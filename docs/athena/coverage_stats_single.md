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
