# v2.17

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| openjdk | 8 | - |
| ABRA2 | 2.17 | [https://github.com/mozack/abra2/releases/download/v2.19/abra2-2.17.jar](https://github.com/mozack/abra2/releases/download/v2.19/abra2-2.17.jar) |

[![](https://images.microbadger.com/badges/version/mskcc/abra2:0.1.0.svg)](https://microbadger.com/images/mskcc/abra2:0.1.0) [![](https://images.microbadger.com/badges/image/mskcc/abra2:0.1.0.svg)](https://microbadger.com/images/mskcc/abra2:0.1.0) [![](https://images.microbadger.com/badges/license/mskcc/abra2:0.1.0.svg)](https://microbadger.com/images/mskcc/abra2:0.1.0)

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner abra2_2.17.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command:**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/abra2_2.17.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir abra2_toil_log
> toil-cwl-runner --singularity --logFile /path/to/abra2_toil_log/cwltoil.log  --jobStore /path/to/abra2_jobStore --batchSystem lsf --workDir /path/to/abra2_toil_log --outdir . --writeLogs /path/to/abra2_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/abra2_2.17.cwl /path/to/inputs.yaml > abra2_toil.stdout 2> abra2_toil.stderr &
```

### Usage

```text
usage: abra2_2.17.cwl [-h]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --memory_per_job MEMORY_PER_JOB
                        Memory per job in megabytes
  --memory_overhead MEMORY_OVERHEAD
                        Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --working_directory WORKING_DIRECTORY
                        Set the temp directory (overrides java.io.tmpdir)
  --reference_fasta REFERENCE_FASTA
                        Genome reference location
  --targets TARGETS
  --kmer_size KMER_SIZE
                        Optional assembly kmer size(delimit with commas if
                        multiple sizes specified)
  --maximum_average_depth MAXIMUM_AVERAGE_DEPTH
                        Regions with average depth exceeding this value will
                        be downsampled (default: 1000)
  --soft_clip_contig SOFT_CLIP_CONTIG
                        Soft clip contig args [max_contigs,min_base_qual,frac_
                        high_qual_bases,min_soft_clip_len]
                        (default:16,13,80,15)
  --maximum_mixmatch_rate MAXIMUM_MIXMATCH_RATE
                        Max allowed mismatch rate when mapping reads back to
                        contigs (default: 0.05)
  --scoring_gap_alignments SCORING_GAP_ALIGNMENTS
                        Scoring used for contig alignments(match,
                        mismatch_penalty,gap_open_penalty,gap_extend_penalty)
                        (default:8,32,48,1)
  --contig_anchor CONTIG_ANCHOR
                        Contig anchor
                        [M_bases_at_contig_edge,max_mismatches_near_edge]
                        (default:10,2)
  --window_size WINDOW_SIZE
                        Processing window size and overlap (size,overlap)
                        (default: 400,200)
  --consensus_sequence  Use positional consensus sequence when aligning high
                        quality soft clipping
  --ignore_bad_assembly
                        Use this option to avoid parsing errors for corrupted
                        assemblies
  --bam_index           Enable BAM index generation when outputting sorted
                        alignments (may require additonal memory)
  --input_vcf INPUT_VCF
                        VCF containing known (or suspected) variant sites.
                        Very large files should be avoided.
  --no_sort             Do not attempt to sort final output
```

