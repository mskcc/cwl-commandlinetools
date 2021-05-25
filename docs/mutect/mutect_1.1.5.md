# MuTect 1.1.5

## Version of tools in docker image \(/container/Dockerfile\)

| Tool | Version | Location |
| :--- | :--- | :--- |
| openjdk:7 base image | 7 | - |
| muTect | 1.1.5 | [https://github.com/broadinstitute/mutect/releases/download/1.1.5/muTect-1.1.5-bin.zip](https://github.com/broadinstitute/mutect/releases/download/1.1.5/muTect-1.1.5-bin.zip) |

## CWL

* CWL specification 1.0
* Use example\_inputs.yaml to see the inputs to the cwl
* Example Command using [toil](https://toil.readthedocs.io):

```bash
    > toil-cwl-runner mutect_1.1.5.cwl example_inputs.yaml
```

**If at MSK, using the JUNO cluster you can use the following command**

```bash
#Using CWLTOOL
> cwltool --singularity --non-strict /path/to/mutect_1.1.5.cwl /path/to/inputs.yaml

#Using toil-cwl-runner
> mkdir mutect_toil_log
> toil-cwl-runner --singularity --logFile /path/to/mutect_toil_log/cwltoil.log  --jobStore /path/to/mutect_jobStore --batchSystem lsf --workDir /path/to/mutect_toil_log --outdir . --writeLogs /path/to/mutect_toil_log --logLevel DEBUG --stats --retryCount 2 --disableCaching --maxLogFileSize 20000000000 /path/to/mutect_1.1.5.cwl /path/to/inputs.yaml > mutect_toil.stdout 2> mutect_toil.stderr &
```

### Usage

```text
usage: toil-cwl-runner mutect_1.1.5.cwl [-h]

positional arguments:
  job_order             Job input json file

optional arguments:
  -h, --help            show this help message and exit
  --BQSR BQSR           The input covariates table file which enables on-the-
                        fly base quality score recalibration
  --absolute_copy_number_data ABSOLUTE_COPY_NUMBER_DATA
                        Absolute Copy Number Data, as defined by Absolute, to
                        use in power calculations
  --arg_file ARG_FILE   Reads arguments from the specified file
  --bam_tumor_sample_name BAM_TUMOR_SAMPLE_NAME
                        if the tumor bam contains multiple samples, only use
                        read groups with SM equal to this value
  --baq BAQ             Type of BAQ calculation to apply in the engine
                        (OFF|CALCULATE_AS_NECESSARY| RECALCULATE)
  --baqGapOpenPenalty BAQGAPOPENPENALTY
                        BAQ gap open penalty (Phred Scaled). Default value is
                        40. 30 is perhaps better for whole genome call sets
  --clipping_bias_pvalue_threshold CLIPPING_BIAS_PVALUE_THRESHOLD
                        pvalue threshold for fishers exact test of clipping
                        bias in mutant reads vs ref reads
  --cosmic COSMIC       VCF file of COSMIC sites
  --coverage_20_q20_file COVERAGE_20_Q20_FILE
                        write out 20x of Q20 coverage in WIGGLE format to this
                        file
  --coverage_file COVERAGE_FILE
                        write out coverage in WIGGLE format to this file
  --dbsnp DBSNP         VCF file of DBSNP information
  --dbsnp_normal_lod DBSNP_NORMAL_LOD
                        LOD threshold for calling normal non-variant at dbsnp
                        sites
  --defaultBaseQualities DEFAULTBASEQUALITIES
                        If reads are missing some or all base quality scores,
                        this value will be used for all base quality scores
  --disableRandomization
                        Completely eliminates randomization from
                        nondeterministic methods. To be used mostly in the
                        testing framework where dynamic parallelism can result
                        in differing numbers of calls to the generator.
  --disable_indel_quals
                        If true, disables printing of base insertion and base
                        deletion tags (with -BQSR)
  --downsample_to_coverage DOWNSAMPLE_TO_COVERAGE
                        Target coverage threshold for downsampling to coverage
  --downsampling_type DOWNSAMPLING_TYPE
                        Type of reads downsampling to employ at a given locus.
                        Reads will be selected randomly to be removed from the
                        pile based on the method described here
                        (NONE|ALL_READS| BY_SAMPLE) given locus; note that
                        downsampled reads are randomly selected from all
                        possible reads at a locus
  --emit_original_quals
                        If true, enables printing of the OQ tag with the
                        original base qualities (with -BQSR)
  --enable_extended_output
  --excludeIntervals EXCLUDEINTERVALS
                        One or more genomic intervals to exclude from
                        processing. Can be explicitly specified on the command
                        line or in a file (including a rod file)
  --filter_mismatching_base_and_quals
                        if a read has mismatching number of bases and base
                        qualities, filter out the read instead of blowing up.
  --force_alleles       force output for all alleles at each site
  --force_output        force output for each site
  --fraction_contamination FRACTION_CONTAMINATION
                        estimate of fraction (0-1) of physical contamination
                        with other unrelated samples
  --fraction_mapq0_threshold FRACTION_MAPQ0_THRESHOLD
                        threshold for determining if there is relatedness
                        between the alt and ref allele read piles
  --gap_events_threshold GAP_EVENTS_THRESHOLD
                        how many gapped events (ins/del) are allowed in
                        proximity to this candidate
  --gatk_key GATK_KEY   GATK Key file. Required if running with -et NO_ET.
                        Please see -phone-home-and-how-does-it-affect-
                        me#latest for details.
  --heavily_clipped_read_fraction HEAVILY_CLIPPED_READ_FRACTION
                        if this fraction or more of the bases in a read are
                        soft/hard clipped, do not use this read for mutation
                        calling
  --initial_tumor_lod INITIAL_TUMOR_LOD
                        Initial LOD threshold for calling tumor variant
  --input_file_normal INPUT_FILE_NORMAL
                        SAM or BAM file(s)
  --input_file_tumor INPUT_FILE_TUMOR
                        SAM or BAM file(s)
  --interval_merging INTERVAL_MERGING
                        Indicates the interval merging rule we should use for
                        abutting intervals (ALL| OVERLAPPING_ONLY)
  --interval_padding INTERVAL_PADDING
                        Indicates how many basepairs of padding to include
                        around each of the intervals specified with the -L/
  --interval_set_rule INTERVAL_SET_RULE
                        Indicates the set merging approach the interval parser
                        should use to combine the various -L or -XL inputs
                        (UNION| INTERSECTION)
  --java_7 JAVA_7
  --keep_program_records
                        Should we override the Walkers default and keep
                        program records from the SAM header
  --log_to_file LOG_TO_FILE
                        Set the logging location
  --logging_level LOGGING_LEVEL
                        Set the minimum level of logging, i.e. setting INFO
                        gets you INFO up to FATAL, setting ERROR gets you
                        ERROR and FATAL level logging.
  --maxRuntime MAXRUNTIME
                        If provided, that GATK will stop execution cleanly as
                        soon after maxRuntime has been exceeded, truncating
                        the run but not exiting with a failure. By default the
                        value is interpreted in minutes, but this can be
                        changed by maxRuntimeUnits
  --maxRuntimeUnits MAXRUNTIMEUNITS
                        The TimeUnit for maxRuntime (NANOSECONDS|
                        MICROSECONDS|MILLISECONDS|SECONDS|MINUTES| HOURS|DAYS)
  --max_alt_allele_in_normal_fraction MAX_ALT_ALLELE_IN_NORMAL_FRACTION
                        threshold for maximum alternate allele fraction in
                        normal
  --max_alt_alleles_in_normal_count MAX_ALT_ALLELES_IN_NORMAL_COUNT
                        threshold for maximum alternate allele counts in
                        normal
  --max_alt_alleles_in_normal_qscore_sum MAX_ALT_ALLELES_IN_NORMAL_QSCORE_SUM
                        threshold for maximum alternate allele quality score
                        sum in normal
  --min_qscore MIN_QSCORE
                        threshold for minimum base quality score
  --minimum_mutation_cell_fraction MINIMUM_MUTATION_CELL_FRACTION
                        minimum fraction of cells which are presumed to have a
                        mutation, used to handle non-clonality and
                        contamination
  --minimum_normal_allele_fraction MINIMUM_NORMAL_ALLELE_FRACTION
                        minimum allele fraction to be considered in normal,
                        useful for normal sample contaminated with tumor
  --monitorThreadEfficiency
                        Enable GATK threading efficiency monitoring
  --mutect MUTECT
  --nonDeterministicRandomSeed
                        Makes the GATK behave non deterministically, that is,
                        the random numbers generated will be different in
                        every run
  --noop                used for debugging, basically exit as soon as we get
                        the reads
  --normal_depth_file NORMAL_DEPTH_FILE
                        write out normal read depth in WIGGLE format to this
                        file
  --normal_lod NORMAL_LOD
                        LOD threshold for calling normal non-germline
  --normal_sample_name NORMAL_SAMPLE_NAME
                        name to use for normal in output files
  --num_bam_file_handles NUM_BAM_FILE_HANDLES
                        The total number of BAM file handles to keep open
                        simultaneously
  --num_cpu_threads_per_data_thread NUM_CPU_THREADS_PER_DATA_THREAD
                        How many CPU threads should be allocated per data
                        thread to running this analysis?
  --num_threads NUM_THREADS
                        How many data threads should be allocated to running
                        this analysis.
  --only_passing_calls  only emit passing calls
  --pedigree PEDIGREE   Pedigree files for samples
  --pedigreeString PEDIGREESTRING
                        Pedigree string for samples
  --pedigreeValidationType PEDIGREEVALIDATIONTYPE
                        How strict should we be in validating the pedigree
                        information? (STRICT|SILENT)
  --performanceLog PERFORMANCELOG
                        If provided, a GATK runtime performance log will be
                        written to this file
  --phone_home PHONE_HOME
                        What kind of GATK run report should we generate?
                        STANDARD is the default, can be NO_ET so nothing is
                        posted to the run repository. Please see -phone-home-
                        and-how-does-it-affect-me#latest for details.
                        (NO_ET|STANDARD|STDOUT)
  --pir_mad_threshold PIR_MAD_THRESHOLD
                        threshold for clustered read position artifact MAD
  --pir_median_threshold PIR_MEDIAN_THRESHOLD
                        threshold for clustered read position artifact median
  --power_constant_af POWER_CONSTANT_AF
                        Allelic fraction constant to use in power calculations
  --power_constant_qscore POWER_CONSTANT_QSCORE
                        Phred scale quality score constant to use in power
                        calculations
  --power_file POWER_FILE
                        write out power in WIGGLE format to this file
  --preserve_qscores_less_than PRESERVE_QSCORES_LESS_THAN
                        Bases with quality scores less than this threshold
                        wont be recalibrated (with -BQSR)
  --read_buffer_size READ_BUFFER_SIZE
                        Number of reads per SAM file to buffer in memory
  --read_filter READ_FILTER
                        Specify filtration criteria to apply to each read
                        individually
  --read_group_black_list READ_GROUP_BLACK_LIST
                        Filters out read groups matching <TAG> -<STRING> or a
                        .txt file containing the filter strings one per line.
  --reference_sequence REFERENCE_SEQUENCE
  --remove_program_records
                        Should we override the Walkers default and remove
                        program records from the SAM header
  --required_maximum_alt_allele_mapping_quality_score
                        required minimum value for
                        <required_maximum_alt_allele_mapping_quality_score>
                        tumor alt allele maximum mapping quality score
  --somatic_classification_normal_power_threshold
                        Power threshold for normal to
                        <somatic_classification_normal_power_threshold>
                        determine germline vs variant
  --tag TAG             Arbitrary tag string to identify this GATK run as part
                        of a group of runs, for later analysis
  --tumor_depth_file TUMOR_DEPTH_FILE
                        write out tumor read depth in WIGGLE format to this
                        file
  --tumor_f_pretest TUMOR_F_PRETEST
                        for computational efficiency, reject sites with
                        allelic fraction below this threshold
  --tumor_lod TUMOR_LOD
                        LOD threshold for calling tumor variant
  --tumor_sample_name TUMOR_SAMPLE_NAME
                        name to use for tumor in output files
  --unsafe UNSAFE       If set, enables unsafe operations - nothing will be
                        checked at runtime. For expert users only who know
                        what they are doing. We do not support usage of this
                        argument. (ALLOW_UNINDEXED_BAM|
                        ALLOW_UNSET_BAM_SORT_ORDER|
                        NO_READ_ORDER_VERIFICATION|
                        ALLOW_SEQ_DICT_INCOMPATIBILITY|
                        LENIENT_VCF_PROCESSING|ALL)
  --useOriginalQualities
                        If set, use the original base quality scores from the
                        OQ tag when present instead of the standard scores
  --validation_strictness VALIDATION_STRICTNESS
                        How strict should we be with validation
                        (STRICT|LENIENT|SILENT)
  --vcf VCF             VCF output of mutation candidates
```

