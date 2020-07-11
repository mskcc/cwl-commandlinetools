
class: CommandLineTool
cwlVersion: v1.0

$namespaces:
  dct: http://purl.org/dc/terms/
  doap: http://usefulinc.com/ns/doap#
  foaf: http://xmlns.com/foaf/0.1/
  sbg: https://www.sevenbridges.com/

id: mutect_v1

arguments:
  - $(inputs.java_7)
  - -Xmx8g
  - -Xms256m
  - -XX:-UseGCOverheadLimit
  - -jar
  - $(inputs.mutect)
  - --analysis_type
  - MuTect

requirements:
  ResourceRequirement:
    ramMin: 32000
    coresMin: 1
    outdirMax: 20000
  InlineJavascriptRequirement: {}

inputs:

  java_7: string
  mutect: string

  BQSR:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --BQSR
    doc: >-
      The input covariates table file which enables on-the-fly base quality
      score recalibration

  absolute_copy_number_data:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --absolute_copy_number_data
    doc: >-
      Absolute Copy Number Data, as defined by Absolute, to use in power
      calculations

  arg_file:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --arg_file
    doc: Reads arguments from the specified file

  bam_tumor_sample_name:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --bam_tumor_sample_name
    doc: >-
      if the tumor bam contains multiple samples, only use read groups with SM
      equal to this value

  baq:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --baq
    doc: >-
      Type of BAQ calculation to apply in the engine
      (OFF|CALCULATE_AS_NECESSARY| RECALCULATE)

  baqGapOpenPenalty:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --baqGapOpenPenalty
    doc: >-
      BAQ gap open penalty (Phred Scaled). Default value is 40. 30 is perhaps
      better for whole genome call sets

  clipping_bias_pvalue_threshold:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --clipping_bias_pvalue_threshold
    doc: >-
      pvalue threshold for fishers exact test of clipping bias in mutant reads
      vs ref reads

  cosmic:
    type: File?
    inputBinding:
      position: 0
      prefix: --cosmic
    doc: VCF file of COSMIC sites
    secondaryFiles: [^.vcf.idx]

  coverage_20_q20_file:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --coverage_20_q20_file
    doc: write out 20x of Q20 coverage in WIGGLE format to this file

  coverage_file:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --coverage_file
    doc: write out coverage in WIGGLE format to this file

  dbsnp:
    type: File?
    inputBinding:
      position: 0
      prefix: --dbsnp
    doc: VCF file of DBSNP information
    secondaryFiles: [^.vcf.idx]

  dbsnp_normal_lod:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --dbsnp_normal_lod
    doc: LOD threshold for calling normal non-variant at dbsnp sites

  defaultBaseQualities:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --defaultBaseQualities
    doc: >-
      If reads are missing some or all base quality scores, this value will be
      used for all base quality scores

  disableRandomization:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --disableRandomization
    doc: >-
      Completely eliminates randomization from nondeterministic methods. To be
      used mostly in the testing framework where dynamic parallelism can result
      in differing numbers of calls to the generator.

  disable_indel_quals:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --disable_indel_quals
    doc: >-
      If true, disables printing of base insertion and base deletion tags (with
      -BQSR)

  downsample_to_coverage:
    type: int?
    inputBinding:
      position: 0
      prefix: --downsample_to_coverage
    doc: Target coverage threshold for downsampling to coverage

  downsampling_type:
    type: string?
    default: NONE
    inputBinding:
      position: 0
      prefix: --downsampling_type
    doc: >-
      Type of reads downsampling to employ at a given locus. Reads will be
      selected randomly to be removed from the pile based on the method
      described here (NONE|ALL_READS| BY_SAMPLE) given locus; note that
      downsampled reads are randomly selected from all possible reads at a locus

  emit_original_quals:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --emit_original_quals
    doc: >-
      If true, enables printing of the OQ tag with the original base qualities
      (with -BQSR)

  enable_extended_output:
    type: boolean
    default: true
    inputBinding:
      position: 0
      prefix: --enable_extended_output

  excludeIntervals:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --excludeIntervals
    doc: >-
      One or more genomic intervals to exclude from processing. Can be
      explicitly specified on the command line or in a file (including a rod
      file)

  filter_mismatching_base_and_quals:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --filter_mismatching_base_and_quals
    doc: >-
      if a read has mismatching number of bases and base qualities, filter out
      the read instead of blowing up.

  force_alleles:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --force_alleles
    doc: force output for all alleles at each site

  force_output:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --force_output
    doc: force output for each site

  fraction_contamination:
    type: float?
    inputBinding:
      position: 0
      prefix: --fraction_contamination
    doc: >-
      estimate of fraction (0-1) of physical contamination with other unrelated
      samples

  fraction_mapq0_threshold:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --fraction_mapq0_threshold
    doc: >-
      threshold for determining if there is relatedness between the alt and ref
      allele read piles

  gap_events_threshold:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --gap_events_threshold
    doc: >-
      how many gapped events (ins/del) are allowed in proximity to this
      candidate

  gatk_key:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --gatk_key
    doc: >-
      GATK Key file. Required if running with -et NO_ET. Please see
      -phone-home-and-how-does-it-affect-me#latest for details.

  heavily_clipped_read_fraction:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --heavily_clipped_read_fraction
    doc: >-
      if this fraction or more of the bases in a read are soft/hard clipped, do
      not use this read for mutation calling

  initial_tumor_lod:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --initial_tumor_lod
    doc: Initial LOD threshold for calling tumor variant

  input_file_normal:
    type: File?
    inputBinding:
      position: 0
      prefix: --input_file:normal
    doc: SAM or BAM file(s)
    secondaryFiles: [^.bai]

  input_file_tumor:
    type: File?
    inputBinding:
      position: 0
      prefix: --input_file:tumor
    doc: SAM or BAM file(s)
    secondaryFiles: [^.bai]

  interval_merging:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --interval_merging
    doc: >-
      Indicates the interval merging rule we should use for abutting intervals
      (ALL| OVERLAPPING_ONLY)

  interval_padding:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --interval_padding
    doc: >-
      Indicates how many basepairs of padding to include around each of the
      intervals specified with the -L/

  interval_set_rule:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --interval_set_rule
    doc: >-
      Indicates the set merging approach the interval parser should use to
      combine the various -L or -XL inputs (UNION| INTERSECTION)

  intervals:
    type:
      - string
      - File
      - 'null'
    inputBinding:
      position: 0
      prefix: --intervals
    doc: >-
      One or more genomic intervals over which to operate. Can be explicitly
      specified on the command line or in a file (including a rod file)

  keep_program_records:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --keep_program_records
    doc: >-
      Should we override the Walkers default and keep program records from the
      SAM header

  log_to_file:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --log_to_file
    doc: Set the logging location

  logging_level:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --logging_level
    doc: >-
      Set the minimum level of logging, i.e. setting INFO gets you INFO up to
      FATAL, setting ERROR gets you ERROR and FATAL level logging.

  maxRuntime:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --maxRuntime
    doc: >-
      If provided, that GATK will stop execution cleanly as soon after
      maxRuntime has been exceeded, truncating the run but not exiting with a
      failure. By default the value is interpreted in minutes, but this can be
      changed by maxRuntimeUnits

  maxRuntimeUnits:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --maxRuntimeUnits
    doc: >-
      The TimeUnit for maxRuntime (NANOSECONDS|
      MICROSECONDS|MILLISECONDS|SECONDS|MINUTES| HOURS|DAYS)

  max_alt_allele_in_normal_fraction:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --max_alt_allele_in_normal_fraction
    doc: threshold for maximum alternate allele fraction in normal

  max_alt_alleles_in_normal_count:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --max_alt_alleles_in_normal_count
    doc: threshold for maximum alternate allele counts in normal

  max_alt_alleles_in_normal_qscore_sum:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --max_alt_alleles_in_normal_qscore_sum
    doc: threshold for maximum alternate allele quality score sum in normal

  min_qscore:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --min_qscore
    doc: threshold for minimum base quality score

  minimum_mutation_cell_fraction:
    type: float?
    inputBinding:
      position: 0
      prefix: --minimum_mutation_cell_fraction
    doc: >-
      minimum fraction of cells which are presumed to have a mutation, used to
      handle non-clonality and contamination

  minimum_normal_allele_fraction:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --minimum_normal_allele_fraction
    doc: >-
      minimum allele fraction to be considered in normal, useful for normal
      sample contaminated with tumor

  monitorThreadEfficiency:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --monitorThreadEfficiency
    doc: Enable GATK threading efficiency monitoring

  nonDeterministicRandomSeed:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --nonDeterministicRandomSeed
    doc: >-
      Makes the GATK behave non deterministically, that is, the random numbers
      generated will be different in every run

  noop:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --noop
    doc: used for debugging, basically exit as soon as we get the reads

  normal_depth_file:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --normal_depth_file
    doc: write out normal read depth in WIGGLE format to this file

  normal_lod:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --normal_lod
    doc: LOD threshold for calling normal non-germline

  normal_sample_name:
    type: string
    inputBinding:
      position: 0
      prefix: --normal_sample_name
    doc: name to use for normal in output files

  num_bam_file_handles:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --num_bam_file_handles
    doc: The total number of BAM file handles to keep open simultaneously

  num_cpu_threads_per_data_thread:
    type: string?
    inputBinding:
      position: 0
      prefix: --num_cpu_threads_per_data_thread
    doc: >-
      How many CPU threads should be allocated per data thread to running this
      analysis?

  num_threads:
    type: string?
    inputBinding:
      position: 0
      prefix: --num_threads
    doc: How many data threads should be allocated to running this analysis.

  only_passing_calls:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --only_passing_calls
    doc: only emit passing calls

  out:
    type:
      - 'null'
      - string
      - File
    inputBinding:
      position: 0
      prefix: --out
    doc: Call-stats output

  pedigree:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --pedigree
    doc: Pedigree files for samples

  pedigreeString:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --pedigreeString
    doc: Pedigree string for samples

  pedigreeValidationType:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --pedigreeValidationType
    doc: >-
      How strict should we be in validating the pedigree information?
      (STRICT|SILENT)

  performanceLog:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --performanceLog
    doc: If provided, a GATK runtime performance log will be written to this file

  phone_home:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --phone_home
    doc: >-
      What kind of GATK run report should we generate? STANDARD is the default,
      can be NO_ET so nothing is posted to the run repository. Please see
      -phone-home-and-how-does-it-affect-me#latest for details.
      (NO_ET|STANDARD|STDOUT)

  pir_mad_threshold:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --pir_mad_threshold
    doc: threshold for clustered read position artifact MAD

  pir_median_threshold:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --pir_median_threshold
    doc: threshold for clustered read position artifact median

  power_constant_af:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --power_constant_af
    doc: Allelic fraction constant to use in power calculations

  power_constant_qscore:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --power_constant_qscore
    doc: Phred scale quality score constant to use in power calculations

  power_file:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --power_file
    doc: write out power in WIGGLE format to this file

  preserve_qscores_less_than:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --preserve_qscores_less_than
    doc: >-
      Bases with quality scores less than this threshold wont be recalibrated
      (with -BQSR)

  read_buffer_size:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --read_buffer_size
    doc: Number of reads per SAM file to buffer in memory

  read_filter:
    type: string?
    inputBinding:
      position: 0
      prefix: --read_filter
    doc: Specify filtration criteria to apply to each read individually

  read_group_black_list:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --read_group_black_list
    doc: >-
      Filters out read groups matching <TAG> -<STRING> or a .txt file containing
      the filter strings one per line.

  reference_sequence:
    type: File
    inputBinding:
      position: 0
      prefix: --reference_sequence
    secondaryFiles: [.fai, ^.dict]

  remove_program_records:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --remove_program_records
    doc: >-
      Should we override the Walkers default and remove program records from
      the SAM header

  required_maximum_alt_allele_mapping_quality_score:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --required_maximum_alt_allele_mapping_quality_score
    doc: >-
      required minimum value for
      <required_maximum_alt_allele_mapping_quality_score> tumor alt allele
      maximum mapping quality score

  somatic_classification_normal_power_threshold:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --somatic_classification_normal_power_threshold
    doc: >-
      Power threshold for normal to
      <somatic_classification_normal_power_threshold> determine germline vs
      variant

  tag:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --tag
    doc: >-
      Arbitrary tag string to identify this GATK run as part of a group of runs,
      for later analysis

  tumor_depth_file:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --tumor_depth_file
    doc: write out tumor read depth in WIGGLE format to this file

  tumor_f_pretest:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --tumor_f_pretest
    doc: >-
      for computational efficiency, reject sites with allelic fraction below
      this threshold

  tumor_lod:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --tumor_lod
    doc: LOD threshold for calling tumor variant

  tumor_sample_name:
    type: string
    inputBinding:
      position: 0
      prefix: --tumor_sample_name
    doc: name to use for tumor in output files

  unsafe:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --unsafe
    doc: >-
      If set, enables unsafe operations - nothing will be checked at runtime.
      For expert users only who know what they are doing. We do not support
      usage of this argument. (ALLOW_UNINDEXED_BAM| ALLOW_UNSET_BAM_SORT_ORDER|
      NO_READ_ORDER_VERIFICATION| ALLOW_SEQ_DICT_INCOMPATIBILITY|
      LENIENT_VCF_PROCESSING|ALL)

  useOriginalQualities:
    type: boolean?
    default: false
    inputBinding:
      position: 0
      prefix: --useOriginalQualities
    doc: >-
      If set, use the original base quality scores from the OQ tag when present
      instead of the standard scores

  validation_strictness:
    type: string[]?
    inputBinding:
      position: 0
      prefix: --validation_strictness
    doc: How strict should we be with validation (STRICT|LENIENT|SILENT)

  vcf:
    type: string?
    inputBinding:
      position: 0
      prefix: --vcf
    doc: VCF output of mutation candidates


outputs:
  callstats_output:
    type: File?
    outputBinding:
      glob: |
        ${
          if (inputs.out)
            return inputs.out;
          return null;
        }

  output:
    type: File?
    outputBinding:
      glob: |
        ${
          if (inputs.vcf)
            return inputs.vcf;
          return null;
        }
