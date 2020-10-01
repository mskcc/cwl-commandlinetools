# CWL and Dockerfile for running BWA MEM

## Version of tools in docker image (/container/Dockerfile)

| Tool   | Version | Location                                        |
| ------ | ------- | ----------------------------------------------- |
| ubuntu | 16.04   | -                                               |
| BWA    | 0.7.17  | https://github.com/lh3/bwa/releases/tag/v0.7.17 |

[![](https://images.microbadger.com/badges/version/mskaccess/bwa_mem_0.7.17.svg)](https://microbadger.com/images/mskaccess/bwa_mem_0.7.17 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/mskaccess/bwa_mem_0.7.17.svg)](https://microbadger.com/images/mskaccess/bwa_mem_0.7.17 "Get your own image badge on microbadger.com")

## CWL

-   CWL specification 1.0
-   Use example_inputs.yaml to see the inputs to the cwl
-   Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner bwa_mem_0.7.17.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster having installed toil-msk version 3.21.1 you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/bwa_mem_0.7.17.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> toil-cwl-runner --singularity --logFile /path/to/bwa_mem_toil.log  --jobStore /path/to/bwa_mem_jobStore --batchSystem lsf --workDir /path/to/bwa_mem_toil_log --outdir . --writeLogs /path/to/bwa_mem_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --disableChaining --maxLogFileSize 20000000000 /path/to/bwa_mem_0.7.17.cwl /path/to/inputs.yaml > bwa_mem_toil.stdout 2> bwa_mem_toil.stderr &
```

### Usage

```
usage: bwa_mem_0.7.17.cwl [-h] [--memory_per_job MEMORY_PER_JOB]
                          [--memory_overhead MEMORY_OVERHEAD]
                          [--number_of_threads NUMBER_OF_THREADS] --reads
                          READS --reference REFERENCE [-A A] [-B B] [-C]
                          [-E E] [-L L] [-M] [-O O] [-P] [-S] [-T T] [-U U]
                          [-a] [-c C] [-d D] [-k K] [-K K] [--output OUTPUT]
                          [-p] [-r R] [-v V] [-w W] [-y Y] [-D D] [-W W]
                          [-m M] [-e] [-x X] [-j J] [--he HE] [-V] [-Y] [-I I]
                          [-R R] [--sample_id SAMPLE_ID] [--lane_id LANE_ID]
                          [--platform PLATFORM]
                          [--platform_unit PLATFORM_UNIT]
                          [--center_name CENTER_NAME]
                          [--library_id LIBRARY_ID]
                          [job_order]

bwa mem [-aCHMpP] [-t nThreads] [-k minSeedLen] [-w bandWidth] [-d zDropoff]
[-r seedSplitRatio] [-c maxOcc] [-A matchScore] [-B mmPenalty] [-O gapOpenPen]
[-E gapExtPen] [-L clipPen] [-U unpairPen] [-R RGline] [-v verboseLevel]
db.prefix reads.fq [mates.fq] Align 70bp-1Mbp query sequences with the BWA-MEM
algorithm. Briefly, the algorithm works by seeding alignments with maximal
exact matches (MEMs) and then extending seeds with the affine-gap Smith-
Waterman algorithm (SW). If mates.fq file is absent and option -p is not set,
this command regards input reads are single-end. If mates.fq is present, this
command assumes the i-th read in reads.fq and the i-th read in mates.fq
constitute a read pair. If -p is used, the command assumes the 2i-th and the
(2i+1)-th read in reads.fq constitute a read pair (such input file is said to
be interleaved). In this case, mates.fq is ignored. In the paired-end mode,
the mem command will infer the read orientation and the insert size
distribution from a batch of reads. The BWA-MEM algorithm performs local
alignment. It may produce multiple primary alignments for different part of a
query sequence. This is a crucial feature for long sequences. However, some
tools such as Picard’s markDuplicates does not work with split alignments. One
may consider to use option -M to flag shorter split hits as secondary.

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --reads READS
  --reference REFERENCE
  -A A                  score for a sequence match, which scales options
                        -TdBOELU unless overridden [1]
  -B B                  penalty for a mismatch [4]
  -C                    append FASTA/FASTQ comment to SAM output
  -E E                  gap extension penalty; a gap of size k cost '{-O} +
                        {-E}*k' [1,1]
  -L L                  penalty for 5'- and 3'-end clipping [5,5]
  -M
  -O O                  gap open penalties for deletions and insertions [6,6]
  -P                    skip pairing; mate rescue performed unless -S also in
                        use
  -S                    skip mate rescue
  -T T                  minimum score to output [30]
  -U U                  penalty for an unpaired read pair [17]
  -a                    output all alignments for SE or unpaired PE
  -c C                  skip seeds with more than INT occurrences [500]
  -d D                  off-diagonal X-dropoff [100]
  -k K                  minimum seed length [19]
  -K K                  process INT input bases in each batch regardless of
                        nThreads (for reproducibility) []
  --output OUTPUT
  -p                    smart pairing (ignoring in2.fq)
  -r R                  look for internal seeds inside a seed longer than {-k}
                        * FLOAT [1.5]
  -v V                  verbosity level: 1=error, 2=warning, 3=message,
                        4+=debugging [3]
  -w W                  band width for banded alignment [100]
  -y Y                  seed occurrence for the 3rd round seeding [20]
  -D D                  drop chains shorter than FLOAT fraction of the longest
                        overlapping chain [0.50]
  -W W                  discard a chain if seeded bases shorter than INT [0]
  -m M                  perform at most INT rounds of mate rescues for each
                        read [50]
  -e
  -x X                  read type. Setting -x changes multiple parameters
                        unless overridden [null] pacbio: -k17 -W40 -r10 -A1
                        -B1 -O1 -E1 -L0 (PacBio reads to ref) ont2d: -k14 -W20
                        -r10 -A1 -B1 -O1 -E1 -L0 (Oxford Nanopore 2D-reads to
                        ref) intractg: -B9 -O16 -L5 (intra-species contigs to
                        ref)
  -j J                  treat ALT contigs as part of the primary assembly
                        (i.e. ignore <idxbase>.alt file)
  --he HE               if there are <INT hits with score >80% of the max
                        score, output all in XA [5,200]
  -V                    output the reference FASTA header in the XR tag
  -Y                    use soft clipping for supplementary alignments
  -I I
  -R R                  STR read group header line such as '@RG\tID -foo\tSM
                        -bar' [null]
  --sample_id SAMPLE_ID
  --lane_id LANE_ID
  --platform PLATFORM
  --platform_unit PLATFORM_UNIT
  --center_name CENTER_NAME
  --library_id LIBRARY_ID
```
