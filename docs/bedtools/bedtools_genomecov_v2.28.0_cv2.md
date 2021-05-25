# genomecov v2.28.0\_cv2

## Version of tools in [docker image ](https://hub.docker.com/r/biocontainers/bedtools)

| Tool | Version | Location |
| :--- | :--- | :--- |
| Bedtools | v2.28.0\_cv2 | [https://github.com/arq5x/bedtools2/releases/tag/v2.28.0](https://github.com/arq5x/bedtools2/releases/tag/v2.28.0) |

[![](https://img.shields.io/badge/version-2.28.0_cv2-blue)](https://github.com/arq5x/bedtools2/releases/tag/v2.28.0)

## CWL

* CWL specification 1.0
* Use example\_inputs.yml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner bedtools_genomecov_v2.28.0_cv2.cwl example_inputs.yml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict bedtools_genomecov_v2.28.0_cv2.cwl inputs.yaml

#Using toil-cwl-runner
> mkdir run_directory
> toil-cwl-runner --singularity --logFile path/to/run_directory/cwltoil.log  --jobStore path/to/jobStore --batchSystem lsf --workDir /path/to/run_directory --outdir /path/to/run_directory --writeLogs /path/to/run_directory --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 bedtools_genomecov_v2.28.0_cv2.cwl inputs.yaml > file.stdout 2> file.stderr &
```

## Usage

\`\`\`bash

> toil-cwl-runner bedtools\_genomecov\_v2.28.0\_cv2.cwl --help

usage: bedtools\_genomecov\_v2.28.0\_cv2.cwl \[-h\] --input INPUT --output\_file\_name OUTPUT\_FILE\_NAME \[--memory\_overhead MEMORY\_OVERHEAD\] \[--memory\_per\_job MEMORY\_PER\_JOB\] \[--number\_of\_threads NUMBER\_OF\_THREADS\] \[--option\_bedgraph\] \[job\_order\]

positional arguments: job\_order Job input json file

optional arguments: -h, --help show this help message and exit --input INPUT The input file can be in BAM format \(Note: BAM must be sorted by position\) --output\_file\_name OUTPUT\_FILE\_NAME --memory\_overhead MEMORY\_OVERHEAD --memory\_per\_job MEMORY\_PER\_JOB --number\_of\_threads NUMBER\_OF\_THREADS --option\_bedgraph option flag parameter to choose output file format. -bg refers to bedgraph format

