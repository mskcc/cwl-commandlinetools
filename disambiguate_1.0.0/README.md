 # CWL and Dockerfile for running Disambiguate

## Version of tools in docker image (/container/Dockerfile)

Dockerfile uses `biocontainers/biocontainers:latest` as a base image and installs tools from `bioconda`.

| Tool	| Version	| Location	| Notes |
|---	|---	|---	| - |
| biocontainers | latest | https://hub.docker.com/r/biocontainers/biocontainers/ | base image; "latest" not actually latest version, just tag name on docker hub|
| bamtools  	| 2.4.0  	|  https://bioconda.github.io/recipes/bamtools/README.html	| - |
| ngs-disambiguate  	| 2016.11.10	| https://bioconda.github.io/recipes/ngs-disambiguate/README.html?highlight=ngs%20disambiguate	| - |

[![](https://images.microbadger.com/badges/version/mskcc/disambiguate:1.0.0.svg)](https://microbadger.com/images/mskcc/disambiguate:1.0.0 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/mskcc/disambiguate:1.0.0.svg)](https://microbadger.com/images/mskcc/disambiguate:1.0.0 "Get your own image badge on microbadger.com")


## CWL

- CWL specification 1.0
- Use `example_inputs.yaml` to see the inputs to the cwl
- Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner disambiguate_1.0.0.cwl example_inputs.yaml
```
  
## Command
```
USAGE:

   cwltool disambiguate_1.0.0.cwl \
   --prefix <string> \
   --output_dir <string> \
   [--aligner <string>] \
   <species_a_bam> <species_b_bam>

Where:

   --prefix <string>
     (required)  Sample ID or name used as prefix. Do not include .bam

   --output_dir <string>
     (required)  Output directory

   --aligner <string>
     Aligner option {bwa(default),tophat,hisat2,star}

   <species_a_bam>
     (required)  Species A BAM file

   <species_b_bam>
     (required)  Species B BAM file
```
