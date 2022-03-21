## CWL and Docker for Running Octopus

## Version of tools in [docker image](https://hub.docker.com/r/biocontainers/bedtools)

| Tool    | Version | Location                         |
| ------- | ------- | -------------------------------- |
| Octopus | v0.7.4  | ghcr.io/msk-access/octopus:0.7.4 |

### CWL

CWL specification 1.0
Use example_input.yaml to see the inputs to the cwl
Example Command using [toil](https://toil.readthedocs.io/):
`toil-cwl-runner octopus_0-7-4.cwl example_input.yaml`

If at MSK, using the JUNO cluster having installed toil version 3.19 and manually modifying [lsf.py](https://github.com/DataBiosphere/toil/blob/releases/3.19.0/src/toil/batchSystems/lsf.py#L170) by removing type==X86_64 && you can use the following command

### Using CWLTOOL

```
cwltool --singularity --non-strict /path/to/mutect_1.1.5.cwl /path/to/inputs.yaml
```

### Using toil-cwl-runner

```shell
mkdir octopus_toil_log
toil-cwl-runner --singularity --logFile /path/to/octopus_toil_log/cwltoil.log  --jobStore /path/to/octopus_jobStore --batchSystem lsf --workDir /path/to/octopus_toil_log --outdir . --writeLogs /path/to/octopus_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/octopus_0-7-4.cwl /path/to/inputs.yaml > octopus_toil.stdout 2> octopus_toil.stderr &
```

### Usage

```shell
usage: /work/bergerm1/bergerlab/sivaprk/tool_testing/octopus_full.cwl
       [-h] --input INPUT [--normalId NORMALID] [--tumorOnlySample]
       [--somaticOnlyCalls]
       [--targettedCalling_singleEntry TARGETTEDCALLING_SINGLEENTRY]
       [--skipRegions_singleEntry SKIPREGIONS_SINGLEENTRY]
       [--targettedCalling_file TARGETTEDCALLING_FILE]
       [--skipRegions_file SKIPREGIONS_FILE] [--error_models ERROR_MODELS]
       --reference REFERENCE --output_file_name OUTPUT_FILE_NAME
```