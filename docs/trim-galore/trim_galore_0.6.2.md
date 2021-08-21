# v0.6.2

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| Ubuntu base image | 18.04 | - |
| cutadapt | 2.3 | [https://pypi.org/project/cutadapt/](https://pypi.org/project/cutadapt/) |
| FASTQC | 0.11.8 | [https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc\_v0.11.8.zip](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip) |
| Trim Galore | 0.6.2 | [https://github.com/FelixKrueger/TrimGalore/archive/0.6.2.tar.gz](https://github.com/FelixKrueger/TrimGalore/archive/0.6.2.tar.gz) |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner trim_galore_0.6.2.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/trim_galore_0.6.2.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir trimgalore_toil_log
> toil-cwl-runner --singularity --logFile /path/to/trimgalore_toil_log/cwltoil.log  --jobStore /path/to/trimgalore_jobStore --batchSystem lsf --workDir /path/to/trimgalore_toil_log --outdir . --writeLogs /path/to/trimgalore_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/trim_galore_0.6.2.cwl /path/to/inputs.yaml > trimgalore_toil.stdout 2> trimgalore_toil.stderr &
```

### Usage

```text
usage: trim_galore_0.6.2.cwl [-h]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --path_to_trim_galore PATH_TO_TRIM_GALORE
                        Path to trim_galore executable file
  --adapter ADAPTER     Adapter sequence to be trimmed. If not specified
                        explicitely, the first 13bp of the Illumina adapter
                        'AGATCGGAAGAGC' will be used by default.
  --adapter2 ADAPTER2   Optional adapter sequence to be trimmed off read 2 of
                        paired-end files. This option requires '--paired' to
                        be specified as well
  --fastq1 FASTQ1       READ1 of the paired-end run
  --fastq2 FASTQ2       READ2 of the pair-end run
  --length LENGTH       Discard reads that became shorter than length INT
                        because of either quality or adapter trimming. A value
                        of '0' effectively disables this behaviour. Default:
                        20 bp.
  --paired              This option performs length trimming of
                        quality/adapter/RRBS trimmed reads for paired-end
                        files. To pass the validation test, both sequences of
                        a sequence pair are required to have a certain minimum
                        length which is governed by the option --length (see
                        above). If only one read passes this length threshold
                        the other read can be rescued (see option
                        --retain_unpaired). Using this option lets you discard
                        too short read pairs without disturbing the sequence-
                        by-sequence order of FastQ files which is required by
                        many aligners.
  --gzip                Compress the output file with gzip. If the input files
                        are gzip-compressed the output files will be
                        automatically gzip compressed as well.
  --quality QUALITY     Trim low-quality ends from reads in addition to
                        adapter removal. For RRBS samples, quality trimming
                        will be performed first, and adapter trimming is
                        carried in a second round. Other files are quality and
                        adapter trimmed in a single pass. The algorithm is the
                        same as the one used by BWA (Subtract INT from all
                        qualities; compute partial sums from all indices to
                        the end of the sequence; cut sequence at the index at
                        which the sum is minimal). Default Phred score: 20.
  --stringency STRINGENCY
                        "Overlap with adapter sequence required to trim a
                        sequence. Defaults to a very stringent setting of '1',
                        i.e. even a single bp of overlapping sequence will be
                        trimmed of the 3' end of any read."
  --suppress_warn       If specified any output to STDOUT or STDERR will be
                        suppressed.
  --error_rate ERROR_RATE
                        Maximum allowed error rate (no. of errors divided by
                        the length of the matching region) (default: 0.1)
```

